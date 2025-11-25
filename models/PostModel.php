<?php
class PostModel {
    private $_db;

    public function __construct() {
        $this->_db = require __DIR__ . '/../services/db_connector.php';
    }

    /**
     * Fetch posts with optional counts, references, and filters.
     *
     * Options:
     *  - includeLikes: bool
     *  - includeComments: bool
     *  - includeReposts: bool
     *  - includeReference: bool
     *  - onlyOthers: bool  (posts from followed users only)
     */
    public function getAll($current_user_pk, array $options,) {
        // Base selects and joins
        $selects = [
            'p.post_pk',
            'p.post_content',
            'p.post_image',
            'p.post_created_at',
            'u.user_pk',
            'u.user_name',
            'u.user_handle'
        ];
        $joins = [
            'INNER JOIN users u ON p.post_user_fk = u.user_pk'
        ];

        // Optional: referenced post
        if (!empty($options['includeReference'])) {
            $selects = array_merge($selects, [
                'rp.post_pk AS ref_post_pk',
                'rp.post_content AS ref_post_content',
                'rp.post_image AS ref_post_image',
                'rp.post_created_at AS ref_post_created_at',
                'ru.user_pk AS ref_user_pk',
                'ru.user_name AS ref_user_name',
                'ru.user_handle AS ref_user_handle'
            ]);
            $joins[] = 'LEFT JOIN posts rp ON p.post_reference = rp.post_pk';
            $joins[] = 'LEFT JOIN users ru ON rp.post_user_fk = ru.user_pk';
        }

        // Optional: likes
        if (!empty($options['includeLikes'])) {
            $selects[] = '(SELECT COUNT(*) FROM post_likes WHERE post_fk = p.post_pk AND like_deleted_at IS NULL) AS like_count';
            $selects[] = "(SELECT 1 FROM post_likes WHERE post_fk = p.post_pk AND user_fk = :current_user_pk AND like_deleted_at IS NULL LIMIT 1) AS liked_by_user";
        }

        // Optional: comment count
        if (!empty($options['includeComments'])) {
            $selects[] = '(SELECT COUNT(*) FROM comments WHERE comment_post_fk = p.post_pk AND comment_deleted_at IS NULL) AS comment_count';
        }

        // Optional: reposts
        if (!empty($options['includeReposts'])) {
            $selects[] = '(SELECT COUNT(*) FROM posts WHERE post_reference = p.post_pk AND post_deleted_at IS NULL) AS repost_count';
            $selects[] = "(SELECT 1 FROM posts WHERE post_reference = p.post_pk AND post_user_fk = :current_user_pk AND post_deleted_at IS NULL LIMIT 1) AS reposted_by_user";
        }

        // Optional: only posts from followed users
        if (!empty($options['onlyOthers'])) {
            $joins[] = 'INNER JOIN follows f ON u.user_pk = f.followed_user_fk AND f.following_user_fk = :current_user_pk AND f.follow_deleted_at IS NULL';
        }

        // Build final SQL
        $sql = "SELECT " . implode(', ', $selects) . " FROM posts p " . implode(' ', $joins) . " WHERE p.post_deleted_at IS NULL ORDER BY p.post_created_at DESC";

        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':current_user_pk', $current_user_pk);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function getByPk($postPk, $username) {

        $sql = "
        SELECT 
			-- post
			post.post_pk,
			post.post_content,
			post.post_image,
			post.post_reference,
			post.post_created_at,

			-- author
			author.user_pk,
			author.user_handle,
			author.user_name,

			-- referenced post
			rp.post_pk AS ref_post_pk,
			rp.post_content AS ref_post_content,
			rp.post_image AS ref_post_image,
			rp.post_created_at AS ref_post_created_at,

			-- referenced post author
			ru.user_pk AS ref_user_pk,
			ru.user_name AS ref_user_name,
			ru.user_handle AS ref_user_handle

            FROM posts post
            INNER JOIN users author
                ON post.post_user_fk = author.user_pk
            LEFT JOIN comments c
                ON c.comment_post_fk = post.post_pk
            LEFT JOIN posts rp
                ON post.post_reference = rp.post_pk
            LEFT JOIN users ru
                ON rp.post_user_fk = ru.user_pk
            WHERE post.post_pk = :postPk
                AND author.user_handle = :username
                AND post.post_deleted_at IS NULL
            ";

        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':postPk', $postPk);
        $stmt->bindValue(':username', $username);
        $stmt->execute();

        $post = $stmt->fetch();
        return $post;
    }
}
