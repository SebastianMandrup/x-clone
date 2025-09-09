<?php 
$title = 'Welcome';
require_once __DIR__ . '/_header.php';
?>
<main>

    <?php 
    $letters = ['a', 'b', 'c', 'd', 'e'];
    ?>

    <h1>
        Index
    </h1>

    <?php 
    foreach($letters as $letter){
    echo "<p>.$letter.</p>";
    }
    ?>

    <?php
    foreach($letters as $letter):
        echo "<div>.$letter.</div>";
    endforeach
    ?>

    <?php 
    require_once __DIR__."/db.php";
    ?>


</main>
<?php require_once __DIR__ . '/_footer.php' ?>