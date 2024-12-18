<?php 
$host = 'localhost';
$username = 'user';
$password = 'password123';
$dbname = 'dolphin_crm';

if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    $conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $pword = isset($_POST['password']) ? $_POST['password'] : '';

    $stmt = $conn->query("SELECT firstname, email, password FROM users" );
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach($results as $row){
        if(($row['email'] == $email)){
            if(password_verify($pword, $row['password'])){
                session_start();
                $_SESSION['user'] = $row['email'];
                echo htmlentities($row["email"]);
            }
        }
    }
}

?>