<?php

class FollowModel {

	private $_db;
	private $LIMIT = 4;

	public function __construct() {
		$this->_db = require __DIR__ . '/../services/db_connector.php';
	}

	public function getLimit() {
		return $this->LIMIT;
	}

	public function followUser($following_user_fk, $followed_user_fk) {
		$sql = "UPDATE follows 
			SET follow_deleted_at = NULL 
			WHERE following_user_fk = :following_user_fk 
			AND followed_user_fk = :followed_user_fk";
		$stmt = $this->_db->prepare($sql);
		$stmt->bindParam(':following_user_fk', $following_user_fk);
		$stmt->bindParam(':followed_user_fk', $followed_user_fk);
		$stmt->execute();

		$success = $stmt->rowCount() > 0;

		if (!$success) {
			$sql = "INSERT INTO follows (following_user_fk, followed_user_fk, follow_created_at) VALUES (:following_user_fk, :followed_user_fk, UNIX_TIMESTAMP())";
			$stmt = $this->_db->prepare($sql);
			$stmt->bindParam(':following_user_fk', $following_user_fk);
			$stmt->bindParam(':followed_user_fk', $followed_user_fk);
			$stmt->execute();
		}
	}

	public function unfollowUser($following_user_fk, $followed_user_fk) {
		$sql = "UPDATE follows 
			SET follow_deleted_at = UNIX_TIMESTAMP() 
			WHERE following_user_fk = :following_user_fk 
			AND followed_user_fk = :followed_user_fk 
			AND follow_deleted_at IS NULL";
		$stmt = $this->_db->prepare($sql);
		$stmt->bindParam(':following_user_fk', $following_user_fk);
		$stmt->bindParam(':followed_user_fk', $followed_user_fk);
		$stmt->execute();
	}

	public function getWhoToFollow($page = 1) {

		$offset = ($page - 1) * $this->LIMIT;

		$sql = "SELECT user_pk, user_name, user_handle, user_avatar
				FROM users 
				LEFT JOIN follows 
				ON users.user_pk = follows.followed_user_fk 
				AND follows.following_user_fk = :userPk
				AND follows.follow_deleted_at IS NULL  -- Only consider active follows
				WHERE users.user_pk != :userPk 
				AND follows.followed_user_fk IS NULL   -- Only users NOT actively followed
				ORDER BY user_pk 
				LIMIT :_limit OFFSET :offset;";

		$stmt = $this->_db->prepare($sql);
		$stmt->bindValue(':userPk', $_SESSION['user']['user_pk']);
		$stmt->bindValue(':_limit', $this->LIMIT, PDO::PARAM_INT);
		$stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
		$stmt->execute();

		$users = $stmt->fetchAll();
		return $users;
	}

	public function getFollowersByHandle($handle, $currentUserPk) {
		$sql = "SELECT 
                u.user_pk, 
                u.user_name, 
                u.user_handle,
				u.user_avatar,
                CASE 
                    WHEN EXISTS (
                        SELECT 1 FROM follows f2 
                        WHERE f2.following_user_fk = :currentUserPk 
                        AND f2.followed_user_fk = u.user_pk 
                        AND f2.follow_deleted_at IS NULL
                    ) THEN 1 
                    ELSE 0 
                END as is_followed
            FROM users u
            JOIN follows f ON u.user_pk = f.following_user_fk
            JOIN users target ON f.followed_user_fk = target.user_pk
            WHERE target.user_handle = :handle
            AND f.follow_deleted_at IS NULL";

		$stmt = $this->_db->prepare($sql);
		$stmt->bindParam(':handle', $handle);
		$stmt->bindParam(':currentUserPk', $currentUserPk);
		$stmt->execute();

		return $stmt->fetchAll();
	}

	public function getFollowingByHandle($handle, $currentUserPk) {
		$sql = "SELECT 
                u.user_pk, 
                u.user_name, 
                u.user_handle,
				u.user_avatar,
                CASE 
                    WHEN EXISTS (
                        SELECT 1 FROM follows f2 
                        WHERE f2.following_user_fk = :currentUserPk 
                        AND f2.followed_user_fk = u.user_pk 
                        AND f2.follow_deleted_at IS NULL
                    ) THEN 1 
                    ELSE 0 
                END as is_followed
            FROM users u
            JOIN follows f ON u.user_pk = f.followed_user_fk
            JOIN users target ON f.following_user_fk = target.user_pk
            WHERE target.user_handle = :handle
            AND f.follow_deleted_at IS NULL";

		$stmt = $this->_db->prepare($sql);
		$stmt->bindParam(':handle', $handle);
		$stmt->bindParam(':currentUserPk', $currentUserPk);
		$stmt->execute();

		return $stmt->fetchAll();
	}
}
