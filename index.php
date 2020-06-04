<?php
  require 'models/connection.php';

  session_start();

  if (!isset($_SESSION['id'])) {
    header('location: /qrc_generator/login.php');
  }

  $sql = "SELECT * FROM divisions";
  $result = $conn->query($sql);

  $sql1 = "SELECT * FROM classifications";
  $result1 = $conn->query($sql1);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QR CODE GEN</title>
    <link rel="stylesheet" href="assets/css/bootstrap.grid.min.css">
    <link rel="stylesheet" href="assets/fontawesome/css/all.css">
    <link rel="stylesheet" href="assets/css/jquery-ui.min.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="shortcut icon" type="image/ico" href="assets/images/logo.ico"/>
    <input type="hidden" id="base-url" value="<?php echo "http://" . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']; ?>">
</head>
<body>
    <div class="qr-form">
        <div class="qr-form-header">
          <i class="fas fa-qrcode"></i>
          <p>QR Code Generator</p>
        
          <div class="logout-area">
              <a href="models/fetch_data.php?qr=logout"><?php echo $_SESSION['name'] ?></a>
              <i class="fas fa-sign-out-alt ml-auto"></i>
          </div>
        </div>
        <div class="qr-error">
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="qr-input">
                    <div class="qr-input-area">
                        <div class="form-control control-div">
                            <label for="division">Division:</label>
                            <div class="custom-select division">
                                <select id="division">
                                    <option value="0">Select Division:</option>
                                    <?php
                                        while($row = $result->fetch_assoc()) {
                                            echo "<option data-id='".$row['div_id']."' value='".$row['div_code']."'>".$row['div_description']."</option>";
                                        }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-control">
                            <label for="section">Section:</label>
                            <div class="custom-select section">
                                <select id="section">
                                    <option value="0">Select Section:</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-control">
                            <label for="classification">Classification:</label>
                            <div class="custom-select classification">
                                <select id="classification">
                                    <option value="0">Select Classification:</option>
                                    <?php
                                        while($row1 = $result1->fetch_assoc()) {
                                            echo "<option data-id='".$row1['class_id']."' value='".$row1['class_code']."'>".$row1['class_description']."</option>";
                                        }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-control">
                            <label for="sub-class">Sub-class:</label>
                            <div class="custom-select sub-class">
                                <select id="sub-class">
                                    <option value="0">Select Sub-class:</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-control">
                            <label for="year">Year | Month:</label>
                            <input type="text" id="startDate" class="date-picker year-month" placeholder="Input Year & Month" readonly>
                            <i class="far fa-calendar-alt"></i>
                        </div>
                        <button id="generate-btn" class="generate-btn" type="button">
                          <i class="fas fa-arrow-alt-circle-right"></i>
                          Generate
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="qr-field">
                    <div class="qr-img">
                        <div id="qrcode">
                        </div>
                    </div>
                    <p id="qr-text" class="qr-txt">16-XXXX-XXXX-X-XXXX-XXXX-XXX-XXXXXX</p>
                    <button id="download-btn" class="download-btn" type="button" disabled>
                      <i class="fas fa-arrow-alt-circle-down"></i>
                      Download
                    </button>
                </div>
            </div>
        </div>
    </div>
    <canvas id="qr-canvas" width="290" height="216">

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery-ui.min.js"></script>
    <script src="assets/js/qrcode.min.js"></script>
    <script src="assets/js/custom.js"></script>
</body>
</html>
