<section class='sectionRepost'>
    <header class='headerRepostUser'>
        <img src="https://ui-avatars.com/api/?name=John+Doe&background=random" alt="Avatar" class='imgRepostAvatar'>
        <span class='spanPostUserFullName'>
            <?php muoEcho($post["ref_user_name"]) ?>
        </span>
        <span class='spanPostUserHandle'>
            @<?php muoEcho($post["ref_user_handle"]) ?>
        </span>
        <span class='spanPostDotSeparator'>
            &#8226;
        </span>
        <span class='spanPostTime'>
            <?php
            $unixTimestamp = $post["ref_post_created_at"];
            $diff = time() - $unixTimestamp;
            if ($diff < 60) {
                muoEcho($diff . "s ago");
            } elseif ($diff < 3600) {
                muoEcho(floor($diff / 60) . "m");
            } elseif ($diff < 86400) {
                muoEcho(floor($diff / 3600) . "h");
            } elseif ($diff < 604800) {
                muoEcho(floor($diff / 86400) . "d");
            } else {
                muoEcho(date("M j, Y", $unixTimestamp));
            }
            ?>
        </span>
    </header>
    <p class='pPostContent'>
        <?php muoEcho($post["ref_post_content"]) ?>
    </p>

    <?php
    if ($post["ref_post_image"]) {
        muoEcho("
            <section class='sectionRepostPicture'>
            <img src=" . $post['ref_post_image'] . ">
            </section>"
        );
    }
    ?>
</section>