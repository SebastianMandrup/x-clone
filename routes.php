<?php

require_once __DIR__ . '/router.php';

get('/', 'views/index.php');
get('/home', 'views/home.php');

post('/api/like-post', 'api/like-post.php');
post('/api/search', 'api/search.php');

post('/bridges/createPost', 'bridges/createPost.php');
post('/bridges/login', 'bridges/login.php');
get('/bridges/logout', 'bridges/logout.php');
post('/bridges/signUp', 'bridges/signUp.php');

any('/404', 'views/404.php');
