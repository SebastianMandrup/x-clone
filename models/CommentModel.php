<?php

class CommentModel {
	private $_db;

	public function __construct() {
		$this->_db = require __DIR__ . '/../services/db_connector.php';
	}

	public function getCommentsByPostPk($postPk, $currentUserPk) {
		try {
			$sql = "SELECT
				c.comment_pk,
				c.comment_content,
				c.comment_created_at,
				u.user_handle as commenter_handle,
				u.user_name as commenter_name,
				u.user_pk as commenter_pk,
				(SELECT COUNT(*) FROM comment_likes cl WHERE cl.comment_fk = c.comment_pk AND cl.user_fk = :currentUserPk AND cl.like_deleted_at IS NULL) AS is_liked_by_current_user,
				(SELECT COUNT(*) FROM comment_likes cl WHERE cl.comment_fk = c.comment_pk AND cl.like_deleted_at IS NULL) AS comment_likes_count
				FROM comments c
				INNER JOIN users u ON c.comment_user_fk = u.user_pk
				WHERE c.comment_post_fk = :postPk
				AND c.comment_deleted_at IS NULL
				ORDER BY c.comment_created_at ASC";
			$stmt = $this->_db->prepare($sql);
			$stmt->bindValue(':postPk', $postPk);
			$stmt->bindValue(':currentUserPk', $currentUserPk);
			$stmt->execute();
			$comments = $stmt->fetchAll();
			return $comments;
		} catch (Exception $e) {
			throw new Exception("Error fetching comments: " . $e->getMessage());
		}
	}

	public function createComment($userPk, $postPk, $commentContent) {
		try {
			$commentPk = bin2hex(random_bytes(25));

			$sql = "INSERT INTO comments (comment_pk, comment_user_fk, comment_post_fk, comment_content, comment_created_at, comment_updated_at) VALUES (:comment_pk, :user_pk, :post_pk, :comment_content, UNIX_TIMESTAMP(), UNIX_TIMESTAMP())";
			$stmt = $this->_db->prepare($sql);
			$stmt->bindParam(':comment_pk', $commentPk);
			$stmt->bindParam(':user_pk', $userPk);
			$stmt->bindParam(':post_pk', $postPk);
			$stmt->bindParam(':comment_content', $commentContent);
			$stmt->execute();

			return true;
		} catch (Exception $e) {
			throw new Exception("Error creating comment: " . $e->getMessage());
		}
		
	}
}
