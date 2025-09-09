<?php
$title = 'Search';
require_once __DIR__ . '/_header.php';
?>

<main>

    <?php
    $q = $_GET['q'] ?? '';
    ?>

    <h1>
        <?php
        if ($q == '') {
            echo 'No query given';
        } else {
            echo "Searching for - $q";
        }
        ?>
    </h1>


    <form action="bridge-search" method="post">
        <input type="text" name='user_name'>
        <button>
            Search
        </button>
    </form>


</main>

<?php require_once __DIR__ . '/_footer.php' ?>