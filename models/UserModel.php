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
}
