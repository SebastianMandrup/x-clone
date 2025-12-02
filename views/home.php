<?php
require_once __DIR__ . "../../x.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styling/home/home.css">
    <link rel="icon" href="https://abs.twimg.com/responsive-web/client-web/icon-ios.77d25eba.png">
    <script src='./scripts/home/home.js' type='module'></script>
    <title>Home / MUO</title>
</head>

<body>

    <div id='divMainContainer'>

        <?php require __DIR__ . '/../components/nav.php'; ?>

        <main>

            <?php
            require_once __DIR__ . '/../components/sections/headerMain.php';
            ?>

            <?php require_once __DIR__ . '/../components/sections/createPost.php'; ?>

            <?php
            $divName = '';
            if ($isForYou) {
                $divName = 'divPostsForYou';
            } else {
                $divName = 'divPostsFollowing';
            }
            ?>

            <div id="<?php muoEcho($divName) ?>" data-page="1">
                <?php
                foreach ($posts as $post) {
                    require __DIR__ . '../../components/articles/post.php';
                }
                ?>
            </div>
            <div class="circle-loader"></div>
        </main>

        <?php require __DIR__ . '/../components/aside.php'; ?>

    </div>

    <?php require __DIR__ . '/../components/commentOverlay.php'; ?>

</body>

<?php require_once __DIR__ . '/../components/templates/post.php'; ?>


</html>