<?php

    if(function_exists($_GET['qr'])) {
        $_GET['qr']();
    }


    function fetch_sections() {
      require 'connection.php';

      $divID = $_GET['div'];
      $sql = "SELECT * FROM sections WHERE div_id = '$divID'";
      $result = $conn->query($sql);
      $rows = array();
      while($r = mysqli_fetch_assoc($result)) {
          $rows[] = $r;
      }

      echo json_encode($rows);
    }

    function fetch_sclassification() {
      require 'connection.php';

      $classID = $_GET['classification'];
      $sql = "SELECT * FROM sub_classifications WHERE class_id = '$classID'";
      $result = $conn->query($sql);
      $rows = array();
      while($r = mysqli_fetch_assoc($result)) {
          $rows[] = $r;
      }

      echo json_encode($rows);
    }

    function login() {
      require 'connection.php';

      $uname = $_POST['username'];
      $pword = $_POST['password'];
      
      $sql = "SELECT * FROM users WHERE username = '$uname' AND password = '$pword'";
      $result = $conn->query($sql);

      if (mysqli_num_rows($result) == 1) {
        echo 'User login successfully';
        $row = mysqli_fetch_assoc($result);
        session_start();
        $_SESSION['id'] = $row['id'];
        $_SESSION['name'] = $row['name'];
      } else {
        session_start();
        $_SESSION['flash'] = 'Incorrect username or password';
      }

      $newUrl = $_SERVER['SERVER_NAME'] . '/qrc_generator';

      header('Location: /qrc_generator');
      die();

    }

    function logout() {
      session_start();
      session_destroy();
      header('location: /qrc_generator');
    }


?>
