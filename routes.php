<?php

require_once __DIR__ . '/router.php';

get('/', 'views/index.php');
get('/home', 'views/home.php');
get('/$username', 'views/profile.php');
// get('/:username/status/:postId', 'views/post.php');

post('/api/like-post', 'api/like-post.php');
post('/api/search', 'api/search.php');
post('/api/add-comment', 'api/add-comment.php');
post('/api/follow-user', 'api/follow-user.php');
post('/api/unfollow-user', 'api/unfollow-user.php');
get('/api/get-trends', 'api/get-trends.php');
get('/api/get-who-to-follow', 'api/get-who-to-follow.php');

post('/bridges/create-post', 'bridges/create-post.php');
post('/bridges/login', 'bridges/login.php');
get('/bridges/logout', 'bridges/logout.php');
post('/bridges/sign-up', 'bridges/sign-up.php');


any('/404', 'views/404.php');
