<html>
<head>
  <title>Vagrant Multi-Macchina</title>
</head>
<body>
<?php
  $dbServer = "10.10.20.11";
  $dbUser = "dbuser";
  $dbPass = "password";
  $dbName = "vagrantdb";

  $connection = new mysqli($dbServer, $dbUser, $dbPass, $dbName);

  if ($connection->connect_error) {
    die("connection failed: " . $connection->connect_error);
  }
  echo "Connected successfully";
  echo "<hr>";

  // Prepare the SQL statement to select a single row from the table
  $query = "SELECT * FROM prova";
  $stmt = $connection->prepare($query);

  if ($stmt) {
    // Execute the prepared statement and bind the result variable
    $stmt->execute();
    $stmt->bind_result($id, $name, $surname);
    echo "<h1>Tabella di prova</h1>";
    echo "<table style='border: 2px solid black;'>";
    echo "<tr>";
    echo "<th>Id</th>";
    echo "<th>Nome</th>";
    echo "<th>Cognome</th>";
    echo "</tr>";
    while($row = $stmt->fetch()){
      echo "<tr>";
      echo "<td>" . $id . "</td>";
      echo "<td>" . $name . "</td>";
      echo "<td>" . $surname . "</td>";
      echo "</tr>";
    }
    echo "</table>";
    echo "<br><hr>";
  } else {
    echo "Error preparing statement: " . $connection->error;
  }

// Close the database connection
$stmt->close();
$connection->close();
?>
</body>
</html>