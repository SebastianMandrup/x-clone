<?php
require_once __DIR__ . "/../services/x.php";
$translations = initTranslations();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./views/styling/home/home.css">
    <link rel="icon" href="https://abs.twimg.com/responsive-web/client-web/icon-ios.77d25eba.png">
    <script src='./views/scripts/home/home.js' type='module'></script>
    <title><?php muoEcho($translations['home']) ?> | MUO</title>
</head>

<body>

    <div id='divMainContainer'>

        <?php require_once __DIR__ . '/components/nav.php'; ?>

        <main>

            <?php
            require_once __DIR__ . '/components/sections/headerMain.php';
            ?>

            <?php require_once __DIR__ . '/components/sections/createPost.php'; ?>

            <?php
            $divName = 'divPostsFollowing';
            if ($isForYou) {
                $divName = 'divPostsForYou';
            }
            ?>

            <div id="<?php muoEcho($divName) ?>" data-page="1">
                <?php
                foreach ($posts as $post) {
                    require __DIR__ . '/components/articles/post.php';
                }
                ?>
            </div>

            <?php if (count($posts) === 0) : ?>
                <div class="divNoPosts">
                    <p>
                        <?php muoEcho($translations['no_posts_to_display']) ?>
                    </p>
                </div>
            <?php else: ?>
                <div class="circle-loader"></div>
            <?php endif; ?>
        </main>

        <?php require_once __DIR__ . '/components/aside.php'; ?>

    </div>

    <?php require_once __DIR__ . '/components/modals/commentOverlay.php'; ?>
    <?php require_once __DIR__ . '/components/modals/analyticsModal.php'; ?>

</body>

<?php require_once __DIR__ . '/components/templates/post.php'; ?>

</html>