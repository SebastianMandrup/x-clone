<?php
require_once __DIR__ . "/../services/protect-route.php";
require_once __DIR__ . "/../x.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styling/profile/profile.css">
    <link rel="icon" href="https://abs.twimg.com/responsive-web/client-web/icon-ios.77d25eba.png">
    <script src='../scripts/profile/profile.js' type='module'></script>
    <title> PROFILE / <?php muoEcho($handle); ?></title>
</head>

<body>

    <div id='divMainContainer'>

        <?php require_once __DIR__ . '/../components/nav.php'; ?>

        <main>

            <?php require_once __DIR__ . '/../components/sections/profileHeader.php'; ?>
            <?php require_once __DIR__ . '/../components/sections/profileBanner.php'; ?>


            <?php
            foreach ($posts as $post) {
                require __DIR__ . '../../components/articles/post.php';
            }
            ?>


            <div class="circle-loader"></div>
        </main>

        <?php require_once __DIR__ . '/../components/aside.php'; ?>

    </div>

    <?php require_once __DIR__ . '/../components/commentOverlay.php'; ?>


    <?php
    if ($user["user_pk"] === $_SESSION["user"]["user_pk"]) {
        require_once __DIR__ . '/../components/editProfileOverlay.php';
    }
    ?>

</body>

</html>