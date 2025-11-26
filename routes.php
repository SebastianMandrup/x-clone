<?php

require_once __DIR__ . '/router.php';

get('/', 'views/index.php');
get('/home', 'controllers/home.php');
get('/following', 'controllers/following.php');
get('/$handle', 'controllers/profile.php');
get('/$handle/posts/$postPk', 'controllers/post.php');

post('/api/repost', 'api/repost.php');
post('/api/like-post', 'api/like-post.php');
post('/api/like-comment', 'api/like-comment.php');
post('/api/search', 'api/search.php');
post('/api/add-comment', 'api/add-comment.php');
post('/api/follow-user', 'api/follow-user.php');
post('/api/unfollow-user', 'api/unfollow-user.php');
get('/api/get-topics', 'api/get-topics.php');
get('/api/get-who-to-follow', 'api/get-who-to-follow.php');

post('/bridges/create-post', 'bridges/create-post.php');
post('/bridges/login', 'bridges/login.php');
get('/bridges/logout', 'bridges/logout.php');
post('/bridges/sign-up', 'bridges/sign-up.php');
post('/bridges/edit-profile', 'bridges/edit-profile.php');
post('/bridges/add-comment-reply', 'bridges/add-comment-reply.php');

any('/404', 'views/404.php');
