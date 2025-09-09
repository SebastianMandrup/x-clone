<?php
$password = $_POST["password"] ?? '';
echo $password;
$hashed_password = password_hash($password, PASSWORD_DEFAULT);
echo "<br>$hashed_password";

// $password = "12345";

if(password_verify($password,$hashed_password)){
    echo "<br>Password verified";
} else {
    echo "<br>Password not verified";
}
?>