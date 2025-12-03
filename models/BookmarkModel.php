<?php

class BookmarkModel {

	private $_db;
	private static $LIMIT = 10;

	public function __construct() {
		$this->_db = require __DIR__ . '/../services/db_connector.php';
	}

	public function addBookmark($userFk, $postFk) {

		$stmt = $this->_db->prepare("SELECT COUNT(*) FROM bookmarks WHERE user_fk = :user_fk AND post_fk = :post_fk");
		$stmt->bindValue(':user_fk', $userFk);
		$stmt->bindValue(':post_fk', $postFk);
		$stmt->execute();
		$count = $stmt->fetchColumn();

		if ($count > 0) {
			$stmt = $this->_db->prepare("DELETE FROM bookmarks WHERE user_fk = :user_fk AND post_fk = :post_fk");
			$stmt->bindValue(':user_fk', $userFk);
			$stmt->bindValue(':post_fk', $postFk);
			return $stmt->execute();
		}


		$stmt = $this->_db->prepare("INSERT INTO bookmarks (user_fk, post_fk) VALUES (:user_fk, :post_fk)");
		$stmt->bindValue(':user_fk', $userFk);
		$stmt->bindValue(':post_fk', $postFk);
		return $stmt->execute();
	}

	public function getUserBookmarks($userFk, $page = 1) {

		$offset = ($page - 1) * self::$LIMIT;

		$stmt = $this->_db->prepare("
			SELECT p.*
			FROM bookmarks b
			JOIN posts p ON b.post_fk = p.post_pk
			WHERE b.user_fk = :user_fk
			ORDER BY b.created_at DESC
			LIMIT :limit OFFSET :offset
		");
		$stmt->bindValue(':user_fk', $userFk);
		$stmt->bindValue(':limit', (int)self::$LIMIT);
		$stmt->bindValue(':offset', (int)$offset);
		$stmt->execute();
		return $stmt->fetchAll(PDO::FETCH_ASSOC);
	}
}
