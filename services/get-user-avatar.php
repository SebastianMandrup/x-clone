<?php
function getUserAvatar($_user) {
	if (!isset($_user['user_avatar']) || empty($_user['user_avatar'])) {
		return ("https://ui-avatars.com/api/?name=" . urlencode($_user['user_name']) . "&background=random");
	}
	return ("/views/uploads/avatars/" . $_user['user_avatar']);
}
