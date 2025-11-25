<?php
session_start();
session_destroy();
header("Location: /?successToast=" . rawurlencode("Logged out successfully"));
exit();
