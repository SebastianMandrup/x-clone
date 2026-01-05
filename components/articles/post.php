<?php
require_once __DIR__ . '/../../x.php';
?>
<article class='articlePost' data-post-pk='<?php muoEcho($post["post_pk"]) ?>' data-author-handle='<?php muoEcho($post["user_handle"]) ?>'>
    <?php require_once __DIR__ . '/../../services/get-user-avatar.php'; ?>
    <img src="<?php muoEcho(getUserAvatar($post)); ?>" alt="Avatar" class='imgPostAvatar'>
    <section class='sectionPostOptions'>
        <button title="More options" class='buttonPostOptions'>
            <?php include __DIR__ . '/../icons/simple-more-icon.php' ?>
        </button>
        <div class='divMoreOptionsToolTip hidden'>
            <?php
            if ($post["user_handle"] === $_SESSION['user']["user_handle"]) {
            ?>
                <button class='buttonMoreOption buttonMoreOptionDeletePost'>
                    <?php muoEcho($translations['delete_post']) ?>
                </button>
            <?php
            } else {
            ?>
                <button class='buttonMoreOption buttonMoreOptionReportPost'>
                    <?php muoEcho($translations['report_post']) ?>
                </button>
            <?php
            }
            ?>
        </div>
    </section>
    <header class='headerPostUser'>
        <a class='aPostUserFullName' href='/user/<?php muoEcho($post["user_handle"]) ?>'>
            <?php muoEcho($post["user_name"]) ?>
        </a>
        <p class='pPostUserHandle'>
            @<?php muoEcho($post["user_handle"]) ?>
        </p>
        <p class='pPostDotSeparator'>
            &#8226;
        </p>
        <p class='pPostTime'>
            <?php
            $unixTimestamp = $post["post_created_at"];
            $diff = time() - $unixTimestamp;
            if ($diff < 60) {
                muoEcho($translations['just_now']);
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
        <?php muoEcho($post["post_content"]) ?>
    </p>
    <?php
    if ($post["post_image"] != "") {
    ?>
        <section class='sectionPostPicture'>
            <img src="<?php muoEcho('/uploads/posts/' . $post['post_image']); ?>">
        </section>
    <?php
    }
    if ($post["ref_post_pk"]) {
        include __DIR__ . '/repost.php';
    }
    ?>
    <footer class='footerPostActions'>
        <button class='buttonPostAction buttonPostActionComment 
            <?php
            if ($post["commented_by_user"] !== null) {
                echo "triggered";
            }
            ?>
        ' title='Comment'>
            <?php include __DIR__ . '/../icons/comment-icon.php'; ?>
            <span class='spanPostActionCount spanPostActionCommentCount'>
                <?php muoEcho($post["comment_count"]) ?>
            </span>
        </button>

        <?php if (!$post["ref_post_pk"]) { ?>
            <button class='buttonPostAction buttonPostActionRepost 
        <?php
            if ($post["reposted_by_user"] !== null && $post["repost_deleted_at"] === null) {
                echo "triggered";
            }
        ?>
            ' title='Repost'>
                <?php include __DIR__ . '/../icons/repost-icon.php'; ?>
                <span class='spanPostActionCount spanPostActionRepostCount'>
                    <?php muoEcho($post["repost_count"]) ?>
                </span>
            </button>
        <?php } ?>

        <button class='buttonPostAction buttonPostActionLike 
        <?php
        if ($post["liked_by_user"] !== null) {
            echo "triggered";
        }
        ?>' title='Like'>
            <?php include __DIR__ . '/../icons/like-icon.php'; ?>
            <span class='spanPostActionCount'>
                <?php muoEcho($post["like_count"]) ?>
            </span>
        </button>

        <button class='buttonPostAction buttonPostActionAnalytics' title='Analytics'>
            <?php include __DIR__ . '/../icons/analytics-icon.php'; ?>
        </button>

    </footer>
    <section class='sectionMorePostOptions'>
        <button title='Bookmark' class='btnBookmarkPost <?php
                                                        if ($post["bookmarked_by_user"] !== null) {
                                                            echo "triggered";
                                                        }
                                                        ?>'>
            <?php include __DIR__ . '/../icons/bookmark-icon.php'; ?>
        </button>
        <button title='Share' class='btnSharePost'>
            <?php include __DIR__ . '/../icons/share-icon.php'; ?>
        </button>
        <div class='divShareTooltip hidden'>
            <ul>
                <li>
                    <button class='buttonShareOption buttonShareOptionCopyLink'>
                        <?php muoEcho($translations['copy_link_to_post']) ?>
                    </button>
                </li>
                <li>
                    <button class='buttonShareOption buttonShareOptionEmbed'>
                        <?php muoEcho($translations['share_post_via']) ?>
                    </button>
                </li>
                <li>
                    <button class='buttonShareOption buttonShareOptionMessage'>
                        <?php muoEcho($translations['send_via_direct_message']) ?>
                    </button>
                </li>
            </ul>
        </div>
    </section>
</article>