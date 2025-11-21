<section class='sectionRepost'>
    <header class='headerRepostUser'>
        <img src="https://ui-avatars.com/api/?name=<?php muoEcho($post["ref_user_name"]) ?>&background=random" alt="Avatar" class='imgRepostAvatar'>
        <a class='aPostUserFullName' href='<?php muoEcho($post["ref_user_handle"]) ?>'>
            <?php muoEcho($post["ref_user_name"]) ?>
        </a>
        <p class='pPostUserHandle'>
            @<?php muoEcho($post["ref_user_handle"]) ?>
        </p>
        <p class='pPostDotSeparator'>
            &#8226;
        </p>
        <p class='pPostTime'>
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
        </p>
    </header>
    <p class='pPostContent'>
        <?php muoEcho($post["ref_post_content"]) ?>
    </p>

    <?php
    if ($post["ref_post_image"]) {
    ?>
        <section class='sectionRepostPicture'>
            <img src="<?php muoEcho($post['ref_post_image']); ?>">
        </section>
    <?php
    }
    ?>
</section>