<?php
function getUserAvatar($user) {
	if (!isset($user['user_avatar']) || empty($user['user_avatar'])) {
		return ("https://ui-avatars.com/api/?name=" . urlencode($user['user_name']) . "&background=random");
	}
	return ("/uploads/avatars/" . $user['user_avatar']);
}
