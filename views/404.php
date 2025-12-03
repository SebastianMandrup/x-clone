<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styling/404.css">
    <title>404 - Page not found</title>
</head>

<body>

    <div id='divMainContainer'>
        <main>

            <?php require_once __DIR__ . '/../components/sections/header404.php'; ?>
            <div id='div404Container'>
                <div id='divLogoContainer'>
                    &#120132;
                </div>
                <section id='section404Content'>
                    <h2>404 - Page not found</h2>
                    <?php if (isset($_GET['error'])): ?>
                        <p><?php echo htmlspecialchars($_GET['error']); ?></p>
                    <?php else: ?>
                        <p>The page you are looking for does not exist.</p>
                    <?php endif; ?>
                </section>
            </div>

        </main>
    </div>
</body>

</html>