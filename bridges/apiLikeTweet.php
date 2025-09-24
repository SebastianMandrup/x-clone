<?php
$tweetId = $_POST['tweetId'];
echo json_encode(['status' => 'success', 'tweetId' => $tweetId]);
?>