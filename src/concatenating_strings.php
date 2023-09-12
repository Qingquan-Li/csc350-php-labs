<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  
<?php

$a = "Hello ";
$b = $a . "World!"; // now $b contains "Hello World!"
echo $b;

echo "<br>";

$a = "Hello ";
$a .= "World!";     // now $a contains "Hello World!"
echo $a;

echo "<br>";

$city= 'Seattle';
$state = 'Washington';
// $address = $city.$state;

// To improve upon this, you could write
$address = $city . ', ' . $state;
echo $address;

?>

</body>
</html>