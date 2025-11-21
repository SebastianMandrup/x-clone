<article class='articlePersonToFollow'>
    <img src="https://ui-avatars.com/api/?name=<?php muoEcho($user["user_name"]); ?>&background=random" class='imgPersonToFollowAvatar'>
    <div class='divPersonToFollowNames'>
        <span class='spanPersonToFollowFullName'>
            <?php muoEcho($user["user_name"]); ?>
        </span>
        <span class='spanPersonToFollowUserName'>
            @<?php muoEcho($user["user_handle"]); ?>
        </span>
    </div>
    <button class='btnFollow' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">Follow</button>
    <button class='btnUnfollow hidden' data-user-pk="<?php muoEcho($user["user_pk"]); ?>">Unfollow</button>
</article>