<article class='articlePersonToFollow'>
    <!-- TODO: impl avatar images on users -->
    <img src="https://ui-avatars.com/api/?name=<?php muoEcho($user["user_name"]); ?>&background=random" class='imgPersonToFollowAvatar'>
    <div class='divPersonToFollowNames'>
        <span class='spanPersonToFollowFullName'>
            <?php muoEcho($user["user_name"]); ?>
        </span>
        <span class='spanPersonToFollowUserName'>
            @<?php muoEcho($user["user_handle"]); ?>
        </span>
    </div>
    <button class='btnFollow'>Follow</button>
</article>