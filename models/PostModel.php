<?php
class PostModel {
    private $_db;
    static $LIMIT = 8;

    public function __construct() {
        $this->_db = require __DIR__ . '/../services/db_connector.php';
    }

    public function getByPk($postPk, $handle) {

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
            author.user_avatar,

			-- referenced post
			rp.post_pk AS ref_post_pk,
			rp.post_content AS ref_post_content,
			rp.post_image AS ref_post_image,
			rp.post_created_at AS ref_post_created_at,

			-- referenced post author
			ru.user_pk AS ref_user_pk,
			ru.user_name AS ref_user_name,
			ru.user_handle AS ref_user_handle,
            ru.user_avatar AS ref_user_avatar

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
                AND author.user_handle = :handle
                AND post.post_deleted_at IS NULL
            ";

        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':postPk', $postPk);
        $stmt->bindValue(':handle', $handle);
        $stmt->execute();

        $post = $stmt->fetch();
        return $post;
    }

    public function getAllFromOthersWithCounts($current_user_pk, $page = 1) {

        $OFFSET = ($page - 1) * $this::$LIMIT;

        $sql = "SELECT 
                p.post_pk,
                p.post_content,
                p.post_image,
                p.post_created_at,
                u.user_pk,
                u.user_name,
                u.user_handle,
                u.user_avatar,

                rp.post_pk AS ref_post_pk,
                rp.post_content AS ref_post_content,
                rp.post_image AS ref_post_image,
                rp.post_created_at AS ref_post_created_at,
                ru.user_pk AS ref_user_pk,
                ru.user_name AS ref_user_name,
                ru.user_handle AS ref_user_handle,
                ru.user_avatar AS ref_user_avatar,

                (SELECT COUNT(*) FROM post_likes 
                    WHERE post_fk = p.post_pk 
                    AND like_deleted_at IS NULL
                ) AS like_count,

                (SELECT 1 FROM post_likes 
                    WHERE post_fk = p.post_pk 
                    AND user_fk = :current_user_pk 
                    AND like_deleted_at IS NULL 
                    LIMIT 1
                ) AS liked_by_user,

                (SELECT COUNT(*) FROM comments 
                    WHERE comment_post_fk = p.post_pk 
                    AND comment_deleted_at IS NULL
                ) AS comment_count,

                (SELECT COUNT(*) FROM posts 
                    WHERE post_reference = p.post_pk 
                    AND post_deleted_at IS NULL
                ) AS repost_count,

                (SELECT 1 FROM posts 
                    WHERE post_reference = p.post_pk 
                    AND post_user_fk = :current_user_pk 
                    AND post_deleted_at IS NULL 
                    LIMIT 1
                ) AS reposted_by_user,

                (SELECT 1 FROM bookmarks 
                    WHERE post_fk = p.post_pk 
                    AND user_fk = :current_user_pk 
                    LIMIT 1
                ) AS bookmarked_by_user

                FROM posts p
                INNER JOIN users u 
                    ON p.post_user_fk = u.user_pk
                LEFT JOIN posts rp 
                    ON p.post_reference = rp.post_pk
                LEFT JOIN users ru 
                    ON rp.post_user_fk = ru.user_pk
                INNER JOIN follows f 
                    ON u.user_pk = f.followed_user_fk
                AND f.following_user_fk = :current_user_pk
                AND f.follow_deleted_at IS NULL

                WHERE p.post_deleted_at IS NULL
                ORDER BY p.post_created_at DESC
                LIMIT :_limit OFFSET :offset;";

        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':current_user_pk', $current_user_pk);
        $stmt->bindValue(':_limit', $this::$LIMIT + 1, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $OFFSET, PDO::PARAM_INT);
        $stmt->execute();

        $posts = $stmt->fetchAll();
        return $posts;
    }

    public function getAllFromUserWithCounts($current_user_pk, $userhandle, $page = 1) {

        $OFFSET = ($page - 1) * $this::$LIMIT;

        $sql = "SELECT 
                p.post_pk,
                p.post_content,
                p.post_image,
                p.post_created_at,
                u.user_pk,
                u.user_name,
                u.user_handle,
                u.user_avatar,

                rp.post_pk AS ref_post_pk,
                rp.post_content AS ref_post_content,
                rp.post_image AS ref_post_image,
                rp.post_created_at AS ref_post_created_at,
                ru.user_pk AS ref_user_pk,
                ru.user_name AS ref_user_name,
                ru.user_handle AS ref_user_handle,
                ru.user_avatar AS ref_user_avatar,

                (SELECT COUNT(*) FROM post_likes 
                    WHERE post_fk = p.post_pk 
                    AND like_deleted_at IS NULL
                ) AS like_count,

                (SELECT 1 FROM post_likes 
                    WHERE post_fk = p.post_pk 
                    AND user_fk = :current_user_pk 
                    AND like_deleted_at IS NULL 
                    LIMIT 1
                ) AS liked_by_user,

                (SELECT COUNT(*) FROM comments 
                    WHERE comment_post_fk = p.post_pk 
                    AND comment_deleted_at IS NULL
                ) AS comment_count,

                (SELECT COUNT(*) FROM posts 
                    WHERE post_reference = p.post_pk 
                    AND post_deleted_at IS NULL
                ) AS repost_count,

                (SELECT 1 FROM posts 
                    WHERE post_reference = p.post_pk 
                    AND post_user_fk = :current_user_pk 
                    AND post_deleted_at IS NULL 
                    LIMIT 1
                ) AS reposted_by_user,

                (SELECT 1 FROM bookmarks 
                    WHERE post_fk = p.post_pk 
                    AND user_fk = :current_user_pk 
                    LIMIT 1
                ) AS bookmarked_by_user

            FROM posts p
            INNER JOIN users u 
                ON p.post_user_fk = u.user_pk
            LEFT JOIN posts rp 
                ON p.post_reference = rp.post_pk
            LEFT JOIN users ru 
                ON rp.post_user_fk = ru.user_pk

            WHERE u.user_handle = :user_handle
              AND p.post_deleted_at IS NULL

            ORDER BY p.post_created_at DESC
            LIMIT :_limit OFFSET :offset";

        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':current_user_pk', $current_user_pk);
        $stmt->bindValue(':user_handle', $userhandle);
        $stmt->bindValue(':_limit', $this::$LIMIT + 1, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $OFFSET, PDO::PARAM_INT);

        $stmt->execute();
        return $stmt->fetchAll();
    }


    public function getAllWithCounts($current_user_pk, $page = 1) {

        $OFFSET = ($page - 1) * $this::$LIMIT;

        $sql = "SELECT 
                p.post_pk,
                p.post_content,
                p.post_image,
                p.post_created_at,
                u.user_pk,
                u.user_name,
                u.user_handle,
                u.user_avatar,

                rp.post_pk AS ref_post_pk,
                rp.post_content AS ref_post_content,
                rp.post_image AS ref_post_image,
                rp.post_created_at AS ref_post_created_at,
                ru.user_pk AS ref_user_pk,
                ru.user_name AS ref_user_name,
                ru.user_handle AS ref_user_handle,
                ru.user_avatar AS ref_user_avatar,

                (SELECT COUNT(*) FROM post_likes 
                    WHERE post_fk = p.post_pk 
                    AND like_deleted_at IS NULL
                ) AS like_count,

                (SELECT 1 FROM post_likes 
                    WHERE post_fk = p.post_pk 
                    AND user_fk = :current_user_pk 
                    AND like_deleted_at IS NULL 
                    LIMIT 1
                ) AS liked_by_user,

                (SELECT COUNT(*) FROM comments 
                    WHERE comment_post_fk = p.post_pk 
                    AND comment_deleted_at IS NULL
                ) AS comment_count,

                (SELECT 1 FROM comments 
                    WHERE comment_post_fk = p.post_pk 
                    AND comment_user_fk = :current_user_pk 
                    AND comment_deleted_at IS NULL 
                    LIMIT 1
                ) AS commented_by_user,

                (SELECT COUNT(*) FROM posts 
                    WHERE post_reference = p.post_pk 
                    AND post_deleted_at IS NULL
                ) AS repost_count,

                (SELECT 1 FROM posts 
                    WHERE post_reference = p.post_pk 
                    AND post_user_fk = :current_user_pk 
                    AND post_deleted_at IS NULL 
                    LIMIT 1
                ) AS reposted_by_user,

                (SELECT 1 FROM bookmarks 
                    WHERE post_fk = p.post_pk 
                    AND user_fk = :current_user_pk 
                    LIMIT 1
                ) AS bookmarked_by_user

                FROM posts p
                INNER JOIN users u 
                    ON p.post_user_fk = u.user_pk
                LEFT JOIN posts rp 
                    ON p.post_reference = rp.post_pk
                LEFT JOIN users ru 
                    ON rp.post_user_fk = ru.user_pk

                WHERE p.post_deleted_at IS NULL
                ORDER BY p.post_created_at DESC
                LIMIT :_limit OFFSET :offset;";

        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':current_user_pk', $current_user_pk);
        $stmt->bindValue(':_limit', $this::$LIMIT + 1, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $OFFSET, PDO::PARAM_INT);
        $stmt->execute();
        $posts = $stmt->fetchAll();
        return $posts;
    }

    public function search($current_user_pk, $searchTerm) {

        $sql = "SELECT 
                p.post_pk,
                p.post_content,
                p.post_image,
                p.post_created_at,
                u.user_pk,
                u.user_name,
                u.user_handle,
                u.user_avatar,

                rp.post_pk AS ref_post_pk,
                rp.post_content AS ref_post_content,
                rp.post_image AS ref_post_image,
                rp.post_created_at AS ref_post_created_at,
                ru.user_pk AS ref_user_pk,
                ru.user_name AS ref_user_name,
                ru.user_handle AS ref_user_handle,
                ru.user_avatar AS ref_user_avatar,

                (SELECT COUNT(*) FROM post_likes 
                    WHERE post_fk = p.post_pk 
                    AND like_deleted_at IS NULL
                ) AS like_count,

                (SELECT 1 FROM post_likes 
                    WHERE post_fk = p.post_pk 
                    AND user_fk = :current_user_pk 
                    AND like_deleted_at IS NULL 
                    LIMIT 1
                ) AS liked_by_user,

                (SELECT COUNT(*) FROM comments 
                    WHERE comment_post_fk = p.post_pk 
                    AND comment_deleted_at IS NULL
                ) AS comment_count,

                (SELECT 1 FROM comments 
                    WHERE comment_post_fk = p.post_pk 
                    AND comment_user_fk = :current_user_pk 
                    AND comment_deleted_at IS NULL 
                    LIMIT 1
                ) AS commented_by_user,

                (SELECT COUNT(*) FROM posts 
                    WHERE post_reference = p.post_pk 
                    AND post_deleted_at IS NULL
                ) AS repost_count,

                (SELECT 1 FROM posts 
                    WHERE post_reference = p.post_pk 
                    AND post_user_fk = :current_user_pk 
                    AND post_deleted_at IS NULL 
                    LIMIT 1
                ) AS reposted_by_user,

                (SELECT 1 FROM bookmarks 
                    WHERE post_fk = p.post_pk 
                    AND user_fk = :current_user_pk 
                    LIMIT 1
                ) AS bookmarked_by_user

                FROM posts p
                INNER JOIN users u 
                    ON p.post_user_fk = u.user_pk
                LEFT JOIN posts rp 
                    ON p.post_reference = rp.post_pk
                LEFT JOIN users ru 
                    ON rp.post_user_fk = ru.user_pk

                WHERE p.post_deleted_at IS NULL
                AND p.post_content LIKE :searchTerm
                ORDER BY p.post_created_at DESC;";

        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':current_user_pk', $current_user_pk);
        $stmt->bindValue(':searchTerm', '%' . $searchTerm . '%');
        $stmt->execute();
        $posts = $stmt->fetchAll();
        return $posts;
    }

    public function likePost($postPk, $userPk) {

        $sql = "SELECT * FROM post_likes WHERE post_fk = :postPk AND user_fk = :userPk";
        $stmt = $this->_db->prepare($sql);

        $stmt->bindValue(":postPk", $postPk);
        $stmt->bindValue(":userPk", $userPk);

        $stmt->execute();

        $post_has_like = $stmt->fetch();

        // user has never liked the post before
        if (!$post_has_like) {
            $sql = "INSERT INTO post_likes (post_fk, user_fk, like_created_at) VALUES (:postPk, :userPk, UNIX_TIMESTAMP())";
            $stmt = $this->_db->prepare($sql);
            $stmt->bindValue(":postPk", $postPk);
            $stmt->bindValue(":userPk", $userPk);
            $stmt->execute();

            echo json_encode([
                'status' => 'success',
                'message' => "user liked the post"
            ]);
            exit;
        }

        // user has liked the post before
        if ($post_has_like['like_deleted_at'] == null) {
            $sql = "UPDATE post_likes SET like_deleted_at = UNIX_TIMESTAMP() WHERE post_fk = :postPk AND user_fk = :userPk";
            $stmt = $this->_db->prepare($sql);
            $stmt->bindValue(":postPk", $postPk);
            $stmt->bindValue(":userPk", $userPk);
            $stmt->execute();
            echo json_encode([
                'status' => 'success',
                'message' => "user unliked the post"
            ]);
            exit;
        }

        // user is disliked the post and wants to like it again
        $sql = "UPDATE post_likes SET like_deleted_at = NULL WHERE post_fk = :postPk AND user_fk = :userPk";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(":postPk", $postPk);
        $stmt->bindValue(":userPk", $userPk);
        $stmt->execute();
        echo json_encode([
            'status' => 'success',
            'message' => "user liked the post"
        ]);
    }

    public function getBookmarks($userPk) {

        $sql = "SELECT 
                p.post_pk,
                p.post_content,
                p.post_image,
                p.post_created_at,
                u.user_pk,
                u.user_name,
                u.user_handle,
                u.user_avatar,

                rp.post_pk AS ref_post_pk,
                rp.post_content AS ref_post_content,
                rp.post_image AS ref_post_image,
                rp.post_created_at AS ref_post_created_at,
                ru.user_pk AS ref_user_pk,
                ru.user_name AS ref_user_name,
                ru.user_handle AS ref_user_handle,
                ru.user_avatar AS ref_user_avatar,

                (SELECT COUNT(*) FROM post_likes 
                    WHERE post_fk = p.post_pk 
                    AND like_deleted_at IS NULL
                ) AS like_count,

                (SELECT 1 FROM post_likes 
                    WHERE post_fk = p.post_pk 
                    AND user_fk = :user_pk
                    AND like_deleted_at IS NULL 
                    LIMIT 1
                ) AS liked_by_user,

                (SELECT COUNT(*) FROM comments 
                    WHERE comment_post_fk = p.post_pk 
                    AND comment_deleted_at IS NULL
                ) AS comment_count,

                (SELECT COUNT(*) FROM posts 
                    WHERE post_reference = p.post_pk 
                    AND post_deleted_at IS NULL
                ) AS repost_count,

                (SELECT 1 FROM posts 
                    WHERE post_reference = p.post_pk 
                    AND post_user_fk = :user_pk 
                    AND post_deleted_at IS NULL 
                    LIMIT 1
                ) AS reposted_by_user,

                (SELECT 1 FROM bookmarks 
                    WHERE post_fk = p.post_pk 
                    AND user_fk = :user_pk 
                    LIMIT 1
                ) AS bookmarked_by_user

            FROM bookmarks b
            INNER JOIN posts p 
                ON b.post_fk = p.post_pk
            INNER JOIN users u 
                ON p.post_user_fk = u.user_pk
            LEFT JOIN posts rp 
                ON p.post_reference = rp.post_pk
            LEFT JOIN users ru 
                ON rp.post_user_fk = ru.user_pk

            WHERE b.user_fk = :user_pk
              AND p.post_deleted_at IS NULL

            ORDER BY b.bookmark_created_at DESC";

        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':user_pk', $userPk);

        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function repost($referencePk, $postUserFk) {

        $repostPk = bin2hex(random_bytes(25));

        $sql = "INSERT INTO posts (post_pk, post_reference, post_user_fk, post_created_at) 
                VALUES (:postPk, :postReference, :postUserFk, UNIX_TIMESTAMP())";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(":postPk", $repostPk);
        $stmt->bindValue(":postReference", $referencePk);
        $stmt->bindValue(":postUserFk", $postUserFk);
        $stmt->execute();
    }

    public function createPost($postContent, $postUserFk) {
        $postPk = bin2hex(random_bytes(25));

        $sql = "INSERT INTO posts (post_pk, post_content, post_user_fk) 
                VALUES (:postPk, :postContent, :postUserFk)";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(":postPk", $postPk);
        $stmt->bindValue(":postContent", $postContent);
        $stmt->bindValue(":postUserFk", $postUserFk);
        $stmt->execute();
    }
}
