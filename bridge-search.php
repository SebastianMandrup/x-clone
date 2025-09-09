<?php
$title = 'Search Form';
require_once __DIR__ . '/_header.php';
?>

<main>

    <?php
    $name = $_POST['user_name'] ?? '';
    $id = bin2hex(random_bytes(50));
    echo "Searching for - $name";
    ?>

    <form action="/delete-user" method='POST'>
        <input name="user_id" type="text" value="<?php echo $id ?>">
        <button>
            Delete
        </button>
    </form>

</main>

<?php require_once __DIR__ . '/_footer.php' ?>