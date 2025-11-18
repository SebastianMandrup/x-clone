<?php
require_once __DIR__ . "../../x.php";
muoNoCache();
session_start();
if (!isset($_SESSION["user"])) {
    header("Location: /");
    exit();
}
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
        <nav id='navMain'>
            <a href="/home" id='aXLogo'>
                <span id='spanXLogo'>
                    &#120132;
                </span>
            </a>
            <a href="/home" id='aSelectedNav'>

                <span>
                    <!-- Home Icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="28"
                        height="28" aria-hidden="true">
                        <path
                            d="M21.591 7.146L12.52 1.157c-.316-.21-.724-.21-1.04 0l-9.071 5.99c-.26.173-.409.456-.409.757v13.183c0 .502.418.913.929.913H9.14c.51 0 .929-.41.929-.913v-7.075h3.909v7.075c0 .502.417.913.928.913h6.165c.511 0 .929-.41.929-.913V7.904c0-.301-.158-.584-.408-.758z" />
                    </svg>

                    Home
                </span>
            </a>
            <a href='/explore'>
                <span>
                    <!-- Search Icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="28"
                        height="28" aria-hidden="true">
                        <path
                            d="M10.25 3.75c-3.59 0-6.5 2.91-6.5 6.5s2.91 6.5 6.5 6.5c1.795 0 3.419-.726 4.596-1.904 1.178-1.177 1.904-2.801 1.904-4.596 0-3.59-2.91-6.5-6.5-6.5zm-8.5 6.5c0-4.694 3.806-8.5 8.5-8.5s8.5 3.806 8.5 8.5c0 1.986-.682 3.815-1.824 5.262l4.781 4.781-1.414 1.414-4.781-4.781c-1.447 1.142-3.276 1.824-5.262 1.824-4.694 0-8.5-3.806-8.5-8.5z" />
                    </svg>

                    Explore
                </span>
            </a>
            <a href="/notification" id='aNotification'>
                <span>
                    <!-- Notifications Icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="28"
                        height="28" aria-hidden="true">
                        <path
                            d="M19.993 9.042C19.48 5.017 16.054 2 11.996 2s-7.49 3.021-7.999 7.051L2.866 18H7.1c.463 2.282 2.481 4 4.9 4s4.437-1.718 4.9-4h4.236l-1.143-8.958zM12 20c-1.306 0-2.417-.835-2.829-2h5.658c-.412 1.165-1.523 2-2.829 2zm-6.866-4l.847-6.698C6.364 6.272 8.941 4 11.996 4s5.627 2.268 6.013 5.295L18.864 16H5.134z" />
                    </svg>

                    Notifications
                </span>
            </a>
            <a href="/messages" id='aMessages'>
                <span>
                    <!-- Outlined Messages -->
                    <svg class="icon-messages-active" viewBox="0 0 24 24" fill="currentColor" width="28" height="28"
                        aria-hidden="true">
                        <path
                            d="M1.998 5.5c0-1.381 1.119-2.5 2.5-2.5h15c1.381 0 2.5 1.119 2.5 2.5v13c0 1.381-1.119 2.5-2.5 2.5h-15c-1.381 0-2.5-1.119-2.5-2.5v-13zm2.5-.5c-.276 0-.5.224-.5.5v2.764l8 3.638 8-3.636V5.5c0-.276-.224-.5-.5-.5h-15zm15.5 5.463l-8 3.636-8-3.638V18.5c0 .276.224.5.5.5h15c.276 0 .5-.224.5-.5v-8.037z" />
                    </svg>
                    Messages
                </span>
            </a>
            <a href="/grok">
                <span>
                    <!-- Tweet Icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 33 32" fill="currentColor" width="28"
                        height="28" aria-hidden="true">
                        <path
                            d="M12.745 20.54l10.97-8.19c.539-.4 1.307-.244 1.564.38 1.349 3.288.746 7.241-1.938 9.955-2.683 2.714-6.417 3.31-9.83 1.954l-3.728 1.745c5.347 3.697 11.84 2.782 15.898-1.324 3.219-3.255 4.216-7.692 3.284-11.693l.008.009c-1.351-5.878.332-8.227 3.782-13.031L33 0l-4.54 4.59v-.014L12.743 20.544m-2.263 1.987c-3.837-3.707-3.175-9.446.1-12.755 2.42-2.449 6.388-3.448 9.852-1.979l3.72-1.737c-.67-.49-1.53-1.017-2.515-1.387-4.455-1.854-9.789-.931-13.41 2.728-3.483 3.523-4.579 8.94-2.697 13.561 1.405 3.454-.899 5.898-3.22 8.364C1.49 30.2.666 31.074 0 32l10.478-9.466" />
                    </svg>

                    MUOOK
                </span>
            </a>
            <a href="/communities" id='aCommunities'>
                <span>
                    <!-- Profile Icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="28"
                        height="28" aria-hidden="true">
                        <path
                            d="M7.501 19.917L7.471 21H.472l.029-1.027c.184-6.618 3.736-8.977 7-8.977.963 0 1.95.212 2.87.672-.444.478-.851 1.03-1.212 1.656-.507-.204-1.054-.329-1.658-.329-2.767 0-4.57 2.223-4.938 6.004H7.56c-.023.302-.05.599-.059.917zm15.998.056L23.528 21H9.472l.029-1.027c.184-6.618 3.736-8.977 7-8.977s6.816 2.358 7 8.977zM21.437 19c-.367-3.781-2.17-6.004-4.938-6.004s-4.57 2.223-4.938 6.004h9.875zm-4.938-9c-.799 0-1.527-.279-2.116-.73-.836-.64-1.384-1.638-1.384-2.77 0-1.93 1.567-3.5 3.5-3.5s3.5 1.57 3.5 3.5c0 1.132-.548 2.13-1.384 2.77-.589.451-1.317.73-2.116.73zm-1.5-3.5c0 .827.673 1.5 1.5 1.5s1.5-.673 1.5-1.5-.673-1.5-1.5-1.5-1.5.673-1.5 1.5zM7.5 3C9.433 3 11 4.57 11 6.5S9.433 10 7.5 10 4 8.43 4 6.5 5.567 3 7.5 3zm0 2C6.673 5 6 5.673 6 6.5S6.673 8 7.5 8 9 7.327 9 6.5 8.327 5 7.5 5z" />
                    </svg>

                    Communities
                </span>
            </a>
            <a href="/premium" id='aPremium'>
                <span>
                    <!-- Bookmarks Icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="28"
                        height="28" aria-hidden="true">
                        <path
                            d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
                    </svg>

                    Premium
                </span>
            </a>
            <a href="/verified-orgs">
                <span>
                    <!-- Lists Icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="28"
                        height="28" aria-hidden="true">
                        <path
                            d="M7.323 2h11.443l-3 5h6.648L6.586 22.83 7.847 14H2.523l4.8-12zm1.354 2l-3.2 8h4.676l-.739 5.17L17.586 9h-5.352l3-5H8.677z" />
                    </svg>

                    Verified Orgs
                </span>
            </a>
            <a href="/profile">
                <span>
                    <!-- Spaces Icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="28"
                        height="28" aria-hidden="true">
                        <path
                            d="M5.651 19h12.698c-.337-1.8-1.023-3.21-1.945-4.19C15.318 13.65 13.838 13 12 13s-3.317.65-4.404 1.81c-.922.98-1.608 2.39-1.945 4.19zm.486-5.56C7.627 11.85 9.648 11 12 11s4.373.85 5.863 2.44c1.477 1.58 2.366 3.8 2.632 6.46l.11 1.1H3.395l.11-1.1c.266-2.66 1.155-4.88 2.632-6.46zM12 4c-1.105 0-2 .9-2 2s.895 2 2 2 2-.9 2-2-.895-2-2-2zM8 6c0-2.21 1.791-4 4-4s4 1.79 4 4-1.791 4-4 4-4-1.79-4-4z" />
                    </svg>

                    Profile
                </span>
            </a>
            <a href="/more">
                <span>
                    <!-- More Icon -->
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="28"
                        height="28" aria-hidden="true">
                        <path
                            d="M3.75 12c0-4.56 3.69-8.25 8.25-8.25s8.25 3.69 8.25 8.25-3.69 8.25-8.25 8.25S3.75 16.56 3.75 12zM12 1.75C6.34 1.75 1.75 6.34 1.75 12S6.34 22.25 12 22.25 22.25 17.66 22.25 12 17.66 1.75 12 1.75zm-4.75 11.5c.69 0 1.25-.56 1.25-1.25s-.56-1.25-1.25-1.25S6 11.31 6 12s.56 1.25 1.25 1.25zm9.5 0c.69 0 1.25-.56 1.25-1.25s-.56-1.25-1.25-1.25-1.25.56-1.25 1.25.56 1.25 1.25 1.25zM13.25 12c0 .69-.56 1.25-1.25 1.25s-1.25-.56-1.25-1.25.56-1.25 1.25-1.25 1.25.56 1.25 1.25z" />
                    </svg>

                    More
                </span>
            </a>
            <button id='btnPost'>
                Post
            </button>
            <button id='btnPostMobile'>
                <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" width="20" height="20" aria-hidden="true">
                    <path
                        d="M12.745 20.54l10.97-8.19c.539-.4 1.307-.244 1.564.38 1.349 3.288.746 7.241-1.938 9.955-2.683 2.714-6.417 3.31-9.83 1.954l-3.728 1.745c5.347 3.697 11.84 2.782 15.898-1.324 3.219-3.255 4.216-7.692 3.284-11.693l.008.009c-1.351-5.878.332-8.227 3.782-13.031L33 0l-4.54 4.59v-.014L12.743 20.544m-2.263 1.987c-3.837-3.707-3.175-9.446.1-12.755 2.42-2.449 6.388-3.448 9.852-1.979l3.72-1.737c-.67-.49-1.53-1.017-2.515-1.387-4.455-1.854-9.789-.931-13.41 2.728-3.483 3.523-4.579 8.94-2.697 13.561 1.405 3.454-.899 5.898-3.22 8.364C1.49 30.2-.334 31.074-.999 32l10.478-9.466" />
                </svg>
            </button>
            <section id='sectionUserActions' class='hidden'>
                <button>
                    Add an existing account
                </button>
                <button id='btnLogout'>
                    Log out
                    <?php muoEcho($_SESSION["user"]["user_name"]); ?>
                </button>
            </section>
            <section id='sectionUserInfo'>
                <img src="https://ui-avatars.com/api/?name=<?php echo urlencode($_SESSION['user']['user_name']); ?>&background=random"
                    alt="Avatar" id='imgUserAvatar'>
                <div id='divUserNames'>
                    <span id='spanUserFullName'>
                        <?php muoEcho($_SESSION["user"]["user_name"]); ?>
                    </span>
                    <span id='spanUserHandle'>
                        @<?php muoEcho($_SESSION["user"]["user_handle"]); ?>
                    </span>
                </div>
                <div id='divMoreOptions'>
                    <span id='spanMoreOptions'>
                        ...
                    </span>
                </div>
            </section>
        </nav>

        <nav id='navMobile'>
            <section id='sectionUserInfoMobile'>
                <img src="https://ui-avatars.com/api/?name=<?php muoEcho(urlencode($_SESSION['user']['user_name'])); ?>&background=random"
                    alt="Avatar" id='imgUserAvatarMobile'>
            </section>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true">
                <path
                    d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
            </svg>
        </nav>

        <main>
            <header id='headerMain'>
                <button class='selectedHeaderButton'>
                    <span>
                        For you
                    </span>
                </button>
                <button>
                    <span>
                        Following
                    </span>
                </button>
            </header>
            <section id='sectionCreatePost'>
                <form action="./bridges/createPost" method='POST' id='formCreatePost'>
                    <section id='sectionCreatePostInputs'>
                        <img src="https://ui-avatars.com/api/?name=<?php muoEcho(urlencode($_SESSION['user']['user_name'])); ?>&background=random"
                            alt="Avatar" id='imgCreatePostAvatar'>
                        <input name="post_content" type="text" placeholder="What's happening?" id='inputCreatePost'>
                    </section>

                    <section id='sectionCreatePostTypes'>
                        <!-- Photo/Image Icon -->
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="20"
                                height="20" aria-hidden="true">
                                <path
                                    d="M3 5.5C3 4.119 4.119 3 5.5 3h13C19.881 3 21 4.119 21 5.5v13c0 1.381-1.119 2.5-2.5 2.5h-13C4.119 21 3 19.881 3 18.5v-13zM5.5 5c-.276 0-.5.224-.5.5v9.086l3-3 3 3 5-5 3 3V5.5c0-.276-.224-.5-.5-.5h-13zM19 15.414l-3-3-5 5-3-3-3 3V18.5c0 .276.224.5.5.5h13c.276 0 .5-.224.5-.5v-3.086zM9.75 7C8.784 7 8 7.784 8 8.75s.784 1.75 1.75 1.75 1.75-.784 1.75-1.75S10.716 7 9.75 7z" />
                            </svg>
                        </div>
                        <!-- GIF Icon -->
                        <div>

                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="20"
                                height="20" aria-hidden="true">
                                <path
                                    d="M3 5.5C3 4.119 4.12 3 5.5 3h13C19.88 3 21 4.119 21 5.5v13c0 1.381-1.12 2.5-2.5 2.5h-13C4.12 21 3 19.881 3 18.5v-13zM5.5 5c-.28 0-.5.224-.5.5v13c0 .276.22.5.5.5h13c.28 0 .5-.224.5-.5v-13c0-.276-.22-.5-.5-.5h-13zM18 10.711V9.25h-3.74v5.5h1.44v-1.719h1.7V11.57h-1.7v-.859H18zM11.79 9.25h1.44v5.5h-1.44v-5.5zm-3.07 1.375c.34 0 .77.172 1.02.43l1.03-.86c-.51-.601-1.28-.945-2.05-.945C7.19 9.25 6 10.453 6 12s1.19 2.75 2.72 2.75c.85 0 1.54-.344 2.05-.945v-2.149H8.38v1.032H9.4v.515c-.17.086-.42.172-.68.172-.76 0-1.36-.602-1.36-1.375 0-.688.6-1.375 1.36-1.375z" />
                            </svg>
                        </div>
                        <!-- Tweet / Compose Icon -->
                        <div>

                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 33 32" fill="currentColor" width="20"
                                height="20" aria-hidden="true">
                                <path
                                    d="M12.745 20.54l10.97-8.19c.539-.4 1.307-.244 1.564.38 1.349 3.288.746 7.241-1.938 9.955-2.683 2.714-6.417 3.31-9.83 1.954l-3.728 1.745c5.347 3.697 11.84 2.782 15.898-1.324 3.219-3.255 4.216-7.692 3.284-11.693l.008.009c-1.351-5.878.332-8.227 3.782-13.031L33 0l-4.54 4.59v-.014L12.743 20.544m-2.263 1.987c-3.837-3.707-3.175-9.446.1-12.755 2.42-2.449 6.388-3.448 9.852-1.979l3.72-1.737c-.67-.49-1.53-1.017-2.515-1.387-4.455-1.854-9.789-.931-13.41 2.728-3.483 3.523-4.579 8.94-2.697 13.561 1.405 3.454-.899 5.898-3.22 8.364C1.49 30.2.666 31.074 0 32l10.478-9.466" />
                            </svg>
                        </div>
                        <!-- Poll Icon -->
                        <div>

                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="20"
                                height="20" aria-hidden="true">
                                <path
                                    d="M6 5c-1.1 0-2 .895-2 2s.9 2 2 2 2-.895 2-2-.9-2-2-2zM2 7c0-2.209 1.79-4 4-4s4 1.791 4 4-1.79 4-4 4-4-1.791-4-4zm20 1H12V6h10v2zM6 15c-1.1 0-2 .895-2 2s.9 2 2 2 2-.895 2-2-.9-2-2-2zm-4 2c0-2.209 1.79-4 4-4s4 1.791 4 4-1.79 4-4 4-4-1.791-4-4zm20 1H12v-2h10v2zM7 7c0 .552-.45 1-1 1s-1-.448-1-1 .45-1 1-1 1 .448 1 1z" />
                            </svg>
                        </div>
                        <!-- Emoji Icon (26x26) -->
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="20"
                                height="20" aria-hidden="true">
                                <path
                                    d="M8 9.5C8 8.119 8.672 7 9.5 7S11 8.119 11 9.5 10.328 12 9.5 12 8 10.881 8 9.5zm6.5 2.5c.828 0 1.5-1.119 1.5-2.5S15.328 7 14.5 7 13 8.119 13 9.5s.672 2.5 1.5 2.5zM12 16c-2.224 0-3.021-2.227-3.051-2.316l-1.897.633c.05.15 1.271 3.684 4.949 3.684s4.898-3.533 4.949-3.684l-1.896-.638c-.033.095-.83 2.322-3.053 2.322zm10.25-4.001c0 5.652-4.598 10.25-10.25 10.25S1.75 17.652 1.75 12 6.348 1.75 12 1.75 22.25 6.348 22.25 12zm-2 0c0-4.549-3.701-8.25-8.25-8.25S3.75 7.451 3.75 12s3.701 8.25 8.25 8.25 8.25-3.701 8.25-8.25z" />
                            </svg>
                        </div>
                        <!-- Schedule / Calendar Icon (26x26) -->
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="20"
                                height="20" aria-hidden="true">
                                <path
                                    d="M6 3V2h2v1h6V2h2v1h1.5C18.88 3 20 4.119 20 5.5v2h-2v-2c0-.276-.22-.5-.5-.5H16v1h-2V5H8v1H6V5H4.5c-.28 0-.5.224-.5.5v12c0 .276.22.5.5.5h3v2h-3C3.12 20 2 18.881 2 17.5v-12C2 4.119 3.12 3 4.5 3H6zm9.5 8c-2.49 0-4.5 2.015-4.5 4.5s2.01 4.5 4.5 4.5 4.5-2.015 4.5-4.5-2.01-4.5-4.5-4.5zM9 15.5C9 11.91 11.91 9 15.5 9s6.5 2.91 6.5 6.5-2.91 6.5-6.5 6.5S9 19.09 9 15.5zm5.5-2.5h2v2.086l1.71 1.707-1.42 1.414-2.29-2.293V13z" />
                            </svg>
                        </div>
                        <!-- Location / Map Pin Icon (26x26) -->
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="20"
                                height="20" aria-hidden="true">
                                <path
                                    d="M12 7c-1.93 0-3.5 1.57-3.5 3.5S10.07 14 12 14s3.5-1.57 3.5-3.5S13.93 7 12 7zm0 5c-.827 0-1.5-.673-1.5-1.5S11.173 9 12 9s1.5.673 1.5 1.5S12.827 12 12 12zm0-10c-4.687 0-8.5 3.813-8.5 8.5 0 5.967 7.621 11.116 7.945 11.332l.555.37.555-.37c.324-.216 7.945-5.365 7.945-11.332C20.5 5.813 16.687 2 12 2zm0 17.77c-1.665-1.241-6.5-5.196-6.5-9.27C5.5 6.916 8.416 4 12 4s6.5 2.916 6.5 6.5c0 4.073-4.835 8.028-6.5 9.27z" />
                            </svg>
                        </div>
                        <button id='btnSubmitPost' type='submit'>
                            Post
                        </button>
                    </section>
                </form>

            </section>
            <section id='sectionLoadMorePosts'>
                <button id='btnLoadMorePosts'>
                    Show 140 Posts
                </button>
            </section>


            <?php
            require_once __DIR__ . '../../db_connector.php';

            $sql = "SELECT 
                    p.post_pk,
                    p.post_content,
                    p.post_image,
                    p.post_created_at,
                    u.user_pk,
                    u.user_name,
                    u.user_handle,
                    
                    -- referenced post fields
                    rp.post_pk AS ref_post_pk,
                    rp.post_content AS ref_post_content,
                    rp.post_image AS ref_post_image,
                    rp.post_created_at AS ref_post_created_at,
                    ru.user_pk AS ref_user_pk,
                    ru.user_name AS ref_user_name,
                    ru.user_handle AS ref_user_handle,

                    -- like information
                    phl.user_fk AS liked_by_user,
                    phl.like_deleted_at,
                    -- like count
                    (SELECT COUNT(*) FROM post_has_likes WHERE post_fk = p.post_pk AND like_deleted_at IS NULL) AS like_count

                    FROM posts p
                    INNER JOIN users u 
                        ON p.post_user_fk = u.user_pk

                    -- self join to bring in the referenced post
                    LEFT JOIN posts rp 
                        ON p.post_reference = rp.post_pk
                    LEFT JOIN users ru 
                        ON rp.post_user_fk = ru.user_pk

                    -- check if current user liked this post
                    LEFT JOIN post_has_likes phl 
                        ON p.post_pk = phl.post_fk 
                        AND phl.user_fk = :current_user_pk
                        AND phl.like_deleted_at IS NULL

                    ORDER BY p.post_created_at DESC";
            $stmt = $_db->prepare($sql);
            $stmt->bindValue(':current_user_pk', $_SESSION['user']['user_pk']);
            $stmt->execute();

            $posts = $stmt->fetchAll();
            foreach ($posts as $post) {
                require __DIR__ . '../../components/articlePost.php';
            }

            ?>

            <div class="circle-loader"></div>
        </main>

        <aside>
            <section id='sectionSearch'>
                <form action="/api/search.php" method="POST" id='formSearch'>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16"
                        fill="currentColor" aria-hidden="true" class="search-icon">
                        <title>Search</title>
                        <g>
                            <path
                                d="M10.25 3.75c-3.59 0-6.5 2.91-6.5 6.5s2.91 6.5 6.5 6.5c1.795 0 3.419-.726 4.596-1.904 1.178-1.177 1.904-2.801 1.904-4.596 0-3.59-2.91-6.5-6.5-6.5zm-8.5 6.5c0-4.694 3.806-8.5 8.5-8.5s8.5 3.806 8.5 8.5c0 1.986-.682 3.815-1.824 5.262l4.781 4.781-1.414 1.414-4.781-4.781c-1.447 1.142-3.276 1.824-5.262 1.824-4.694 0-8.5-3.806-8.5-8.5z" />
                        </g>
                    </svg>
                    <input type="text" placeholder='Search'>
                </form>
            </section>

            <section id='sectionSubscribe'>
                <header>
                    Subscribe to Premium
                </header>
                <p>
                    Subscribe to unlock new features and if eligible, receive a share of revenue.
                </p>
                <button>
                    Subscribe
                </button>
            </section>

            <div id='divTrends'>
                <section id='sectionWhatsHappening'>
                    <header>
                        What's happening
                    </header>

                    <?php
                    require_once __DIR__ . '../../db_connector.php';

                    $sql = 'SELECT topic_pk, topic_name, topic_field, topic_count, topic_rank FROM topics ORDER BY topic_rank DESC LIMIT 3;';
                    $stmt = $_db->prepare($sql);
                    $stmt->execute();

                    $topics = $stmt->fetchAll();
                    foreach ($topics as $topic) {
                        require __DIR__ . '../../components/articleTrendItem.php';
                    }
                    ?>

                    <button class='btnShowMore'>
                        Show more
                    </button>
                </section>
                <section id='sectionWhoToFollow'>
                    <header>
                        Who To Follow
                    </header>

                    <?php

                    require_once __DIR__ . '../../db_connector.php';

                    $sql = "SELECT user_pk, user_name, user_handle FROM users WHERE user_pk != :userPk ORDER BY RAND() LIMIT 3;";
                    $stmt = $_db->prepare($sql);
                    $stmt->bindValue(':userPk', $_SESSION['user']['user_pk']);
                    $stmt->execute();

                    $users = $stmt->fetchAll();
                    foreach ($users as $user) {
                        require __DIR__ . '../../components/articlePersonToFollow.php';
                    }

                    ?>
                    <button class='btnShowMore'>
                        Show more
                    </button>
                </section>
            </div>

            <footer>
                <a href="#">Terms of Service</a>
                <span>|</span>
                <a href="#">Privacy Policy</a>
                <span>|</span>
                <a href="#">Cookie Policy</a>
                <a href="#">Accessibility</a>
                <span>|</span>
                <a href="#">Ads info</a>
                <span>|</span>
                <a href="#">More</a>
                <span>|</span>
                <div id="divFooterCopy">
                    © 2025 MUO Corp.
                </div>
            </footer>
        </aside>
    </div>

</body>

</html>