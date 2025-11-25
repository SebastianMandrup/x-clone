<?php

class UserModel {

	private $_db;

	public function __construct() {
		$this->_db = require __DIR__ . '/../services/db_connector.php';
	}

	public function getWhoToFollow() {
		$sql = "SELECT user_pk, user_name, user_handle 
			FROM users 
			LEFT JOIN follows ON users.user_pk = follows.followed_user_fk AND follows.following_user_fk = :userPk
			WHERE follows.followed_user_fk IS NULL
			OR follows.follow_deleted_at IS NOT NULL
			AND user_pk != :userPk 
			ORDER BY user_pk 
			LIMIT 4;
	";

		$stmt = $this->_db->prepare($sql);
		$stmt->bindValue(':userPk', $_SESSION['user']['user_pk']);
		$stmt->execute();

		$users = $stmt->fetchAll();
		return $users;
	}

	public function getByHandle($userHandle, $currentUserPk) {
		$sql = "
        SELECT 
            users.user_pk, 
            users.user_name, 
            users.user_email, 
            users.user_birthday, 
            users.user_handle,
            users.user_banner,
            COUNT(posts.post_pk) AS post_count,
            (SELECT COUNT(*) FROM follows WHERE followed_user_fk = users.user_pk AND follow_deleted_at IS NULL) AS followers_count,
            (SELECT COUNT(*) FROM follows WHERE following_user_fk = users.user_pk AND follow_deleted_at IS NULL) AS following_count,
            -- Check if session user is following this user
            CASE 
                WHEN :currentUserPk IS NOT NULL THEN 
                    EXISTS (SELECT 1 FROM follows 
                            WHERE following_user_fk = :currentUserPk 
                            AND followed_user_fk = users.user_pk 
                            AND follow_deleted_at IS NULL)
                ELSE FALSE
            END AS is_following
        FROM users 
        LEFT JOIN posts ON users.user_pk = posts.post_user_fk
        WHERE users.user_handle = :userHandle
        GROUP BY users.user_pk, users.user_name, users.user_email, users.user_birthday, users.user_handle, users.user_banner
        LIMIT 1;
";
		$stmt = $this->_db->prepare($sql);
		$stmt->bindValue(':userHandle', $userHandle);
		$stmt->bindValue(':currentUserPk', $currentUserPk ?? null, PDO::PARAM_INT);
		$stmt->execute();
		$user = $stmt->fetch();
		return $user;
	}
}
