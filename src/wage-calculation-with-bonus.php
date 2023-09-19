<!DOCTYPE html>
<html>
<head>
    <title>Wage Calculator</title>
</head>
<body>

<h1>Wage Calculator</h1>

<?php
// Initialize the variables.
$hours_worked = '';
$hourly_rate = '';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  // $hours_worked = $_POST['hours_worked'];
  // $hourly_rate = $_POST['hourly_rate'];
  // Make a sticky form, so that the values are not lost when the form is submitted.
  // If the values are not set, then assign them to 0.
  $hours_worked = isset($_POST['hours_worked']) ? (float)$_POST['hours_worked'] : 0;
  $hourly_rate = isset($_POST['hourly_rate']) ? (float)$_POST['hourly_rate'] : 0;
}
?>

<form method="POST" action="">
    <label for="hours_worked">Number of Hours Worked:</label>
    <!-- <input type="text" name="hours_worked"><br><br> -->
    <!-- Make a sticky form -->
    <input
      type="text"
      name="hours_worked"
      value="<?php echo $hours_worked ?>"
    >
    <br><br>

    <label for="hourly_rate">Hourly Rate:</label>
    <input
      type="text"
      name="hourly_rate"
      value="<?php echo $hourly_rate ?>"
    >
    <br><br>

    <input type="submit" value="Calculate Wage">
</form>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // If the number of hours exceeds 40 hours then assign a 5% bonus to the wage,
    // if it's between 30-40 assign 3% bonus to the wage.
    if ($hours_worked > 40) {
        $wage = ($hours_worked * $hourly_rate) * 1.05;
    } else if ($hours_worked >= 30 && $hours_worked <= 40) {
        $wage = ($hours_worked * $hourly_rate) * 1.03;
    } else {
        $wage = $hours_worked * $hourly_rate;
    }
    echo "<p>Your wage is: $wage</p>";
    echo "<p>Note: If the number of hours exceeds 40 hours then assign a 5% bonus to the wage,<br>
    if it's between 30-40 assign 3% bonus to the wage.</p>";
}
?>

</body>
</html>
