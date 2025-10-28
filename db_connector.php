<?php

if ($_SERVER['HTTP_HOST'] == 'mvndrup.com') {
    require_once __DIR__ . '/server_db.php';
} else {
    require_once __DIR__ . '/db.php';
}
