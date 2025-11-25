<?php

if ($_SERVER['HTTP_HOST'] == 'mvndrup.com') {
    return require __DIR__ . '/server_db.php';
} else {
    return require __DIR__ . '/db.php';
}
