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

		$sql = "SELECT user_pk, user_name, user_handle 
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
}


/*	public function getAllWithCounts($currentUserPk) {
		return $this->postModel->getAll($currentUserPk, [
			'includeLikes' => true,
			'includeComments' => true,
			'includeReposts' => true,
			'includeReference' => true
		]);
	}

	public function getAllFromOthersWithCounts($currentUserPk) {
		return $this->postModel->getAll($currentUserPk, [
			'includeLikes' => true,
			'includeComments' => true,
			'includeReposts' => true,
			'includeReference' => true,
			'onlyOthers' => true
		]);
	}
*/