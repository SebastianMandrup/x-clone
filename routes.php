<?php

require_once __DIR__ . '/router.php';


get('/', 'views/index.php');

get('/home', 'controllers/home.php');
get('/following', 'controllers/home-following.php');
get('/user/$handle/following', 'controllers/following.php');
get('/user/$handle/followers', 'controllers/followers.php');
get('/user/$handle', 'controllers/profile.php');
get('/user/$handle/posts/$postPk', 'controllers/post.php');

get('/uploads/avatars/$filename', 'api/get-avatar.php');
get('/uploads/banners/$filename', 'api/get-banner.php');

post('/api/repost', 'api/repost.php');
post('/api/like-post', 'api/like-post.php');
post('/api/like-comment', 'api/like-comment.php');
post('/api/search', 'api/search.php');
post('/api/add-comment', 'api/add-comment.php');
post('/api/follow-user', 'api/follow-user.php');
post('/api/unfollow-user', 'api/unfollow-user.php');
post('/api/bookmark-post', 'api/bookmark-post.php');

get('/api/get-topics', 'api/get-topics.php');
get('/api/get-who-to-follow', 'api/get-who-to-follow.php');
get('/api/get-posts', 'api/get-posts.php');
get('/api/get-posts-following', 'api/get-posts-following.php');
post('/api/add-comment-reply', 'api/add-comment-reply.php');

post('/bridges/create-post', 'bridges/create-post.php');
post('/bridges/login', 'bridges/login.php');
get('/bridges/logout', 'bridges/logout.php');
post('/bridges/sign-up', 'bridges/sign-up.php');
post('/bridges/edit-profile', 'bridges/edit-profile.php');

get('/404', 'views/404.php');
