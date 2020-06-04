<?php 
  session_start();

  if (isset($_SESSION['id'])) {
    header('location: /qrc_generator');
  }
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>QRC GEN</title>

    <link rel="shortcut icon" type="image/ico" href="assets/images/logo.ico"/>
    <link rel="stylesheet" href="assets/fontawesome/css/all.css">
    <link rel="stylesheet" href="assets/css/custom.css">

  </head>
  <body>

    <div class="login-form">
      <div class="login-header">
        <i class="fas fa-qrcode"></i>
        <p>QR Code</p>
      </div>
      <p class="flash-msg">
        <?php
          if (isset($_SESSION['flash'])) {
            echo $_SESSION['flash'];
            unset($_SESSION['flash']);
            session_destroy();
          }
        ?>
      </p>
      <div class="login-body">
        <form class="" action="models/fetch_data.php?qr=login" method="post">
          <div class="login-input-area">
            <i class="fas fa-user"></i>
            <input type="text" name="username" placeholder="Username" required>
          </div>
          <div class="login-input-area">
            <i class="fas fa-key"></i>
            <input type="password" name="password" placeholder="Password" required>
          </div>
          <button type="submit" name="button">
            <i class="fas fa-sign-in-alt"></i>
            Login
          </button>
        </form>
      </div>
    </div>

    <script src="assets/js/jquery.min.js"></script>
  </body>
</html>
