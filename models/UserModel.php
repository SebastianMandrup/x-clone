<?php

class UserModel {

    private $_db;

    public function __construct() {
        $this->_db = require __DIR__ . '/../services/db_connector.php';
    }

    public function getByHandle($userHandle, $currentUserPk) {
        $sql = "
        SELECT 
            users.user_pk, 
            users.user_name, 
            users.user_email, 
            users.user_birthday, 
            users.user_handle,
            users.user_banner,
            COUNT(posts.post_pk) AS post_count,
            (SELECT COUNT(*) FROM follows WHERE followed_user_fk = users.user_pk AND follow_deleted_at IS NULL) AS followers_count,
            (SELECT COUNT(*) FROM follows WHERE following_user_fk = users.user_pk AND follow_deleted_at IS NULL) AS following_count,
            -- Check if session user is following this user
            CASE 
                WHEN :currentUserPk IS NOT NULL THEN 
                    EXISTS (SELECT 1 FROM follows 
                            WHERE following_user_fk = :currentUserPk 
                            AND followed_user_fk = users.user_pk 
                            AND follow_deleted_at IS NULL)
                ELSE FALSE
            END AS is_following
        FROM users 
        LEFT JOIN posts ON users.user_pk = posts.post_user_fk
        WHERE users.user_handle = :userHandle
        GROUP BY users.user_pk, users.user_name, users.user_email, users.user_birthday, users.user_handle, users.user_banner
        LIMIT 1;
";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(':userHandle', $userHandle);
        $stmt->bindValue(':currentUserPk', $currentUserPk ?? null, PDO::PARAM_INT);
        $stmt->execute();
        $user = $stmt->fetch();
        return $user;
    }

    public function getByEmailOrPhone($emailOrPhone) {
        $sql = "SELECT * FROM users WHERE user_email = :emailOrPhone OR user_phone = :emailOrPhone";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(":emailOrPhone", $emailOrPhone);
        $stmt->execute();
        $user = $stmt->fetch();
        return $user;
    }

    public function getByEmail($email) {
        $sql = "SELECT * FROM users WHERE user_email = :email";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(":email", $email);
        $stmt->execute();
        $user = $stmt->fetch();
        return $user;
    }

    public function getByPhone($phone) {
        $sql = "SELECT * FROM users WHERE user_phone = :phone";
        $stmt = $this->_db->prepare($sql);
        $stmt->bindValue(":phone", $phone);
        $stmt->execute();
        $user = $stmt->fetch();
        return $user;
    }

    public function createUser($name, $handle, $phone, $email, $hashedPassword, $birthday, $personalizedAds, $connectWithEmailPhone) {
        $sql = "INSERT INTO users (
                user_pk, 
                user_name,
                user_handle, 
                user_phone, 
                user_email, 
                user_password, 
                user_birthday, 
                user_personalized_ads, 
                user_connect_with_email_phone
            ) VALUES (
                :pk, :name, :handle, :phone, :email, :password, :birthday, :personalizedAds, :connectWithEmailPhone
            )";

        $stmt = $this->_db->prepare($sql);

        $userPk = bin2hex(random_bytes(25));

        $stmt->bindValue(":pk", $userPk);
        $stmt->bindValue(":name", $name);
        $stmt->bindValue(":handle", $handle);
        $stmt->bindValue(":phone", $phone);
        $stmt->bindValue(":password", $hashedPassword);
        $stmt->bindValue(":birthday", $birthday);
        $stmt->bindValue(":personalizedAds", $personalizedAds);
        $stmt->bindValue(":connectWithEmailPhone", $connectWithEmailPhone);
        $stmt->bindValue(":email", $email);

        $stmt->execute();

        return $userPk;
    }
}
