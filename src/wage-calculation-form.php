<!DOCTYPE html>
<html>
<head>
    <title>Wage Calculator</title>
</head>
<body>

<h1>Wage Calculator</h1>

<form method="POST" action="">
    <label for="hours_worked">Number of Hours Worked:</label>
    <input type="text" name="hours_worked"><br><br>

    <label for="hourly_rate">Hourly Rate:</label>
    <input type="text" name="hourly_rate"><br><br>

    <input type="submit" value="Calculate Wage">
</form>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $hours_worked = isset($_POST['hours_worked']) ? (float)$_POST['hours_worked'] : 0;
    $hourly_rate = isset($_POST['hourly_rate']) ? (float)$_POST['hourly_rate'] : 0;

    $wage = $hours_worked * $hourly_rate;
    echo "<br>";
    echo "Your wage is: $wage";
}
?>

</body>
</html>
