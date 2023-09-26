<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>

<!-- Create a form -->
<form method="POST" action="">
  <label for="number">Enter a number:</label>
  <input type="text" name="number">
  <br><br>
  <input type="submit" value="Submit">
</form>

<!-- make a function in PHP  takes a numeric argument
and returns a string saying if it is even or odd -->
<?php
  function determineEvenOdd($number) {
    if (!is_numeric($number)) {
      echo "<p>Please enter a number</p>";
    }
    elseif ($number % 2 == 0) {
      echo "<p>The number is even</p>";
    } else {
      echo "<p>The number is odd</p>";
    }
  }

  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $number = $_POST["number"];
    determineEvenOdd($number);
  }
?>

</body>
</html>