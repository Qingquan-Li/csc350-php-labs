<!--
1. make a mysqli_conncetion.php file for your server connection. 
2. Insert a new information into a users table. 
3. Take a screen shot of the new entry which has the today registration date
-->

<!--
mysql> SELECT * FROM users;
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
| user_id | first_name | last_name | email                | pass                                     | registration_date   |
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
|       1 | Jake       | Li        | jakeli@mail.com      | e727d1464ae12436e899a726da5b2f11d8381b26 | 2023-10-31 20:12:59 |
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
-->


<?php

require_once('mysqli-connect.php');

// Define the query:
$query = "INSERT INTO users (first_name, last_name, email, pass, registration_date)
VALUES ('Jennie', 'Kim', 'jkim@gmail.com', SHA1('password'), NOW() )";

// Execute the query:
if (@mysqli_query($dbc, $query)) {
    echo 'The user was added successfully!';
} else {
    echo 'The user could not be added!';
}

mysqli_close($dbc); // Close the connection.

?>

<!-- Run the code:
1. Open the browser and type the url: http://localhost/lab11.php
2. Check the database table users:
mysql> SELECT * FROM users;
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
| user_id | first_name | last_name | email                | pass                                     | registration_date   |
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
|       1 | Jake       | Li        | jakeli@mail.com      | e727d1464ae12436e899a726da5b2f11d8381b26 | 2023-10-31 20:12:59 |
|       2 | Jennie     | Kim       | jkim@gmail.com       | 5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8 | 2023-11-02 19:14:05 |
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
-->
