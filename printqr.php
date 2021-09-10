<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
    <script src="lib/jquery/jquery.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="lib/jquery-validation/dist/jquery.validate.min.js"></script>
    <link href="vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <script src="vendors/pnotify/dist/pnotify.js"></script>
    <script src="vendors/pnotify/dist/pnotify.buttons.js"></script>
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="lib/w3/w3.css">
    <link rel="stylesheet" href="lib/css/durable.css">
    <script src="lib/js/CryptoJs.js"></script>
    <script src="lib/js/config.js"></script>
    <title>Document</title>
</head>
<body>
<?php
    $param = $_GET['id'];
    echo '<a href="main.php?page=genQR" class="btn btn-success btn-fill" >
    <i class="fa fa-arrow-left " aria-hidden="true"><span> ย้อนกลับ</span></i>
    </a>';
    echo "<div align='center'>";
    echo '<img src="qr_generate.php?id='.$param.'" />';
    echo '<p>'.$param.'</p>';
    echo "<div>";
    ?>
</body>
</html>

