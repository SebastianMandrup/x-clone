<template id="templatePost">
	<article class='articlePost'>
		<img class='imgPostAvatar'>
		<section class='sectionPostOptions'>
			<button title="More options">
				<?php include __DIR__ . '/../icons/simple-more-icon.php' ?>
			</button>
		</section>
		<header class='headerPostUser'>
			<a class='aPostUserFullName' href=''>
			</a>
			<p class='pPostUserHandle'>
			</p>
			<p class='pPostDotSeparator'>
				&#8226;
			</p>
			<p class='pPostTime'>
			</p>
		</header>
		<p class='pPostContent'>
		</p>
		<section class='sectionPostPicture'>
			<img src="">
		</section>
		<section class='sectionRepost'>
			<header class='headerRepostUser'>
				<img alt="Avatar" class='imgRepostAvatar'>
				<a class='aPostUserFullName'>
				</a>
				<p class='pPostUserHandle'>
				</p>
				<p class='pPostDotSeparator'>
					&#8226;
				</p>
				<p class='pPostTime'>
				</p>
			</header>
			<p class='pRepostContent'>
			</p>

			<section class='sectionRepostPicture'>
				<img>
			</section>
		</section>

		<footer class='footerPostActions'>

			<button class='buttonPostAction buttonPostActionComment' title='Comment'>
				<?php include __DIR__ . '/../icons/comment-icon.php' ?>
				<span class='spanPostActionCount spanPostActionCommentCount'>
				</span>
			</button>

			<button class='buttonPostAction buttonPostActionRepost' title='Repost'>
				<?php include __DIR__ . '/../icons/repost-icon.php' ?>
				<span class='spanPostActionCount spanPostActionRepostCount'>
				</span>
			</button>

			<button class='buttonPostAction buttonPostActionLike' title='Like'>
				<?php include __DIR__ . '/../icons/like-icon.php' ?>
				<span class='spanPostActionCount spanPostActionLikeCount'>
				</span>
			</button>

			<button class='buttonPostAction buttonPostActionAnalytics' title='Analytics'>
				<?php include __DIR__ . '/../icons/analytics-icon.php' ?>
			</button>

		</footer>
		<section class='sectionMorePostOptions'>
			<button title='Bookmark' class='btnBookmarkPost'>
				<?php include __DIR__ . '/../icons/bookmark-icon.php' ?>
			</button>
			<button title='Share' class='btnSharePost'>
				<?php include __DIR__ . '/../icons/share-icon.php' ?>
					</path>
				</svg>
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
</template>