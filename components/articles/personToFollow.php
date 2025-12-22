<article class='articlePersonToFollow'>
    <?php require_once __DIR__ . '/../../services/get-user-avatar.php'; ?>
    <img class='imgPersonToFollowAvatar' src="<?php muoEcho(getUserAvatar($user)); ?>" alt="User Avatar">
    <section class='sectionPersonToFollowNames'>
        <a class='aPersonToFollowFullName' href="/user/<?php muoEcho($user["user_handle"]); ?>">
            <?php muoEcho($user["user_name"]); ?>
        </a>
        <p class='pPersonToFollowHandle'>
            @<?php muoEcho($user["user_handle"]); ?>
        </p>
    </section>
    <button class='btnFollow' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">Follow</button>
    <button class='btnUnfollow hidden' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">Unfollow</button>
</article>