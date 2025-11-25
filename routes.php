<?php

require_once __DIR__ . '/router.php';

get('/', 'views/index.php');
get('/home', 'public/home.php');
get('/following', 'public/following.php');
get('/$username', 'public/profile.php');
get('/$username/posts/$postPk', 'public/post.php');

post('/api/repost', 'public/api/repost.php');
post('/api/like-post', 'public/api/like-post.php');
post('/api/like-comment', 'public/api/like-comment.php');
post('/api/search', 'public/api/search.php');
post('/api/add-comment', 'public/api/add-comment.php');
post('/api/follow-user', 'public/api/follow-user.php');
post('/api/unfollow-user', 'public/api/unfollow-user.php');
get('/api/get-trends', 'public/api/get-trends.php');
get('/api/get-who-to-follow', 'public/api/get-who-to-follow.php');

post('/bridges/create-post', 'public/bridges/create-post.php');
post('/bridges/login', 'public/bridges/login.php');
get('/bridges/logout', 'public/bridges/logout.php');
post('/bridges/sign-up', 'public/bridges/sign-up.php');

any('/404', 'views/404.php');
