 <?php
    try {
        require_once __DIR__ . "/../x.php";

        session_start();

        if (!$_SESSION["user"]) {
            throw new Exception("Unauthorized", 401);
        }

        $postContent = validatePostContent();
        $postPk = bin2hex(random_bytes(25));
        $postUserFk = $_SESSION["user"]["user_pk"];

        require_once __DIR__ . "../../db_connector.php";

        $sql = "
        INSERT INTO posts (post_pk, post_content, post_user_fk) 
        VALUES (:postPk, :postContent, :postUserFk)
    ";
        $stmt = $_db->prepare($sql);
        $stmt->bindValue(":postPk", $postPk);
        $stmt->bindValue(":postContent", $postContent);
        $stmt->bindValue(":postUserFk", $postUserFk);
        $stmt->execute();

        header("Location: ../?successToast=" . rawurlencode("Succesfully added post."));
    } catch (Exception $ex) {
        http_response_code($ex->getCode() ? (int) $ex->getCode() : 500);
        header("Location: ../?errorToast=" . rawurlencode($ex->getMessage()));
    }
