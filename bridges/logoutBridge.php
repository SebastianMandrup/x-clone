<?php
session_start();
session_destroy();
header("Location: /../?successToast=" . urlencode("Logged out successfully"));
exit();
?>