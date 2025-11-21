<article class='articlePersonToFollow'>
    <img class='imgPersonToFollowAvatar' src="https://ui-avatars.com/api/?name=<?php muoEcho($user["user_name"]); ?>&background=random">
    <section class='sectionPersonToFollowNames'>
        <a class='aPersonToFollowFullName' href="/<?php muoEcho($user["user_handle"]); ?>">
            <?php muoEcho($user["user_name"]); ?>
        </a>
        <p class='pPersonToFollowHandle'>
            @<?php muoEcho($user["user_handle"]); ?>
        </p>
    </section>
    <button class='btnFollow' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">Follow</button>
    <button class='btnUnfollow hidden' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">Unfollow</button>
</article>