<?php

class CommentModel {
	private $_db;

	public function __construct() {
		$this->_db = require __DIR__ . '/../services/db_connector.php';
	}

	public function getCommentsByPostPk($postPk, $currentUserPk) {
		$sql = "SELECT
                c.comment_pk,
                c.comment_content,
                c.comment_created_at,
                u.user_handle as commenter_handle,
				u.user_avatar as commenter_avatar,
                u.user_name as commenter_name,
                u.user_pk as commenter_pk,
                (SELECT COUNT(*) FROM comment_likes cl WHERE cl.comment_fk = c.comment_pk AND cl.user_fk = :currentUserPk AND cl.like_deleted_at IS NULL) AS is_liked_by_current_user,
                (SELECT COUNT(*) FROM comment_likes cl WHERE cl.comment_fk = c.comment_pk AND cl.like_deleted_at IS NULL) AS comment_likes_count,

                (SELECT COUNT(*) FROM comment_replies cr WHERE cr.comment_fk = c.comment_pk AND cr.user_fk = :currentUserPk) AS is_replied_by_current_user,
                (SELECT COUNT(*) FROM comment_replies cr WHERE cr.comment_fk = c.comment_pk) AS comment_replies_count,
                
                -- Reply fields (using correct column names)
                cr.comment_reply_created_at as reply_created_at,
                cr.comment_reply_pk as reply_pk,
                cr.comment_reply_content as reply_content,
                ru.user_handle as replier_handle,
                ru.user_name as replier_name,
				ru.user_avatar as replier_avatar,
                ru.user_pk as replier_pk
                
                FROM comments c
                INNER JOIN users u ON c.comment_user_fk = u.user_pk
                LEFT JOIN comment_replies cr ON cr.comment_fk = c.comment_pk
                LEFT JOIN users ru ON cr.user_fk = ru.user_pk
                WHERE c.comment_post_fk = :postPk
                AND c.comment_deleted_at IS NULL
                ORDER BY c.comment_created_at DESC, cr.comment_reply_created_at ASC";

		$stmt = $this->_db->prepare($sql);
		$stmt->bindValue(':postPk', $postPk);
		$stmt->bindValue(':currentUserPk', $currentUserPk);
		$stmt->execute();

		$results = $stmt->fetchAll();
		return $this->structureCommentsWithReplies($results);
	}

	private function structureCommentsWithReplies($results) {
		$commentsMap = [];

		foreach ($results as $row) {
			$commentPk = $row['comment_pk'];

			// Initialize comment if not exists
			if (!isset($commentsMap[$commentPk])) {
				$commentsMap[$commentPk] = [
					'comment_pk' => $commentPk,
					'comment_content' => $row['comment_content'],
					'comment_created_at' => $row['comment_created_at'],
					'commenter_handle' => $row['commenter_handle'],
					'commenter_avatar' => $row['commenter_avatar'],
					'commenter_name' => $row['commenter_name'],
					'commenter_pk' => $row['commenter_pk'],
					'is_liked_by_current_user' => (bool)$row['is_liked_by_current_user'],
					'comment_likes_count' => (int)$row['comment_likes_count'],
					'is_replied_by_current_user' => (bool)$row['is_replied_by_current_user'],
					'comment_replies_count' => (int)$row['comment_replies_count'],
					'replies' => []
				];
			}

			// Add reply if exists
			if ($row['reply_pk']) {
				$commentsMap[$commentPk]['replies'][] = [
					'reply_pk' => $row['reply_pk'],
					'reply_content' => $row['reply_content'],
					'replier_handle' => $row['replier_handle'],
					'replier_name' => $row['replier_name'],
					'replier_avatar' => $row['replier_avatar'],
					'replier_pk' => $row['replier_pk']
				];
			}
		}

		return array_values($commentsMap);
	}

	public function createComment($userPk, $postPk, $commentContent) {
		$commentPk = bin2hex(random_bytes(25));

		$sql = "INSERT INTO comments (comment_pk, comment_user_fk, comment_post_fk, comment_content, comment_created_at, comment_updated_at) VALUES (:comment_pk, :user_pk, :post_pk, :comment_content, UNIX_TIMESTAMP(), UNIX_TIMESTAMP())";
		$stmt = $this->_db->prepare($sql);
		$stmt->bindParam(':comment_pk', $commentPk);
		$stmt->bindParam(':user_pk', $userPk);
		$stmt->bindParam(':post_pk', $postPk);
		$stmt->bindParam(':comment_content', $commentContent);

		$stmt->execute();
	}

	public function createCommentReply($userPk, $commentPk, $commentReplyContent) {
		$commentReplyPk = bin2hex(random_bytes(25));

		$sql = "INSERT INTO comment_replies (comment_reply_pk, comment_fk, user_fk, comment_reply_content) 
			VALUES (:comment_reply_pk, :comment_pk, :user_pk, :comment_reply_content)";
		$stmt = $this->_db->prepare($sql);
		$stmt->bindParam(':comment_reply_pk', $commentReplyPk);
		$stmt->bindParam(':user_pk', $userPk);
		$stmt->bindParam(':comment_pk', $commentPk);
		$stmt->bindParam(':comment_reply_content', $commentReplyContent);
		$stmt->execute();

		$newComment = $stmt->fetch();
		return $newComment;
	}

	public function likeComment($commentPk, $userPk) {

		$sql = "SELECT * FROM comment_likes WHERE comment_fk = :commentPk AND user_fk = :userPk";
		$stmt = $this->_db->prepare($sql);
		$stmt->bindValue(":commentPk", $commentPk);
		$stmt->bindValue(":userPk", $userPk);
		$stmt->execute();

		$post_has_like = $stmt->fetch();

		// user has never liked the post before
		if (!$post_has_like) {
			$sql = "INSERT INTO comment_likes (comment_fk, user_fk, like_created_at) VALUES (:commentPk, :userPk, UNIX_TIMESTAMP())";
			$stmt = $this->_db->prepare($sql);
			$stmt->bindValue(":commentPk", $commentPk);
			$stmt->bindValue(":userPk", $userPk);
			$stmt->execute();
			return 'user_liked_the_comment';
		}

		// user has liked the post before
		if ($post_has_like['like_deleted_at'] == null) {
			$sql = "UPDATE comment_likes SET like_deleted_at = UNIX_TIMESTAMP() WHERE comment_fk = :commentPk AND user_fk = :userPk";
			$stmt = $this->_db->prepare($sql);
			$stmt->bindValue(":commentPk", $commentPk);
			$stmt->bindValue(":userPk", $userPk);
			$stmt->execute();
			return 'user_disliked_the_comment';
		}

		// user is disliked the post and wants to like it again
		$sql = "UPDATE comment_likes SET like_deleted_at = NULL WHERE comment_fk = :commentPk AND user_fk = :userPk";
		$stmt = $this->_db->prepare($sql);
		$stmt->bindValue(":commentPk", $commentPk);
		$stmt->bindValue(":userPk", $userPk);
		$stmt->execute();
		return 'user_liked_the_comment_again';
	}
}
