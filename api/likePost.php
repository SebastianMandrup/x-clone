<?php
$tweetId = $_POST['tweetId'];

// db logic

echo json_encode(['status' => 'success', 'tweetId' => $tweetId]);
?>