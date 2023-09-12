<?php
try {
    $pdo = new PDO('mysql:host=db;dbname=my_database', 'user', 'userpassword');
    echo 'Connection successful!';
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}
?>
