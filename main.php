<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="lib/boots/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>DIMS</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="lib/boots/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="lib/boots/css/animate.min.css" rel="stylesheet" />

    <!--  Light Bootstrap Table core CSS    -->
    <link href="lib/boots/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="lib/boots/css/pe-icon-7-stroke.css" rel="stylesheet" />

    <!-- original -->
    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
    <script src="lib/jquery/jquery.min.js"></script>
    <!-- <script src="lib/bootstrap/js/bootstrap.min.js"></script> -->
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
    <script src="lib/js/main.js"></script>
    <script src="lib/js/durable.js"></script>
    <script src="lib/js/borrow.js"></script>

</head>

<body>

    <nav class="navbar navbar-default navbar-fixed">
        <div class="container-fluid">
            <div class="navbar-header">
                <!-- <button type="button" class="navbar-toggle" data-toggle="collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button> -->
            </div>
            <div class="collapse navbar-collapse">

                <ul class="nav navbar-nav navbar-right">
                <li><a href="#" data-toggle="modal" data-target="#"><div class="user_show">  </div></a></li>
                </ul>
            </div>
        </div>
    </nav>
    <?php
    switch ($_GET["page"]) {
        case "home":
            include("home.html");
            break;
        case "durable":
            include("durable.html");
            break;
        case "member":
            include("memberpage.php");
            break;
        case "borrowlist":
            include("borrowlist.html");
            break;
        case "borrowlist_material":
            include("borrowlist_material.html");
            break;
        case "material":
            include("material.html");
            break;
        case "genQR":
            include("genqr.html");
            break;
        case "genQRmaterial":
            include("genqrmaterial.html");
            break;
        case "import":
            include("importcsv.html");
            break;
        case "importmat":
            include("importmaterialcsv.html");
            break;
        default:
            include("home.html");
    }
    ?>
    <div class="main-panel">
        <div class="wrapper">
            <div class="sidebar" data-color="purple" data-image="lib/boots/img/sidebar-5.jpg">

                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="" class="simple-text">
                            DIMS
                        </a>
                    </div>

                    <ul class="nav">
                        <li class="active">
                            <a href="main.php?page=home">
                                <i class="pe-7s-home"></i>
                                <p>หน้าแรก</p>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?page=durable">
                                <i class="pe-7s-note2"></i>
                                <p>รายการครุภัณฑ์</p>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?page=material">
                                <i class="pe-7s-tools"></i>
                                <p>รายการวัสดุ</p>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?page=member">
                                <i class="pe-7s-users"></i>
                                <p>รายการผู้ใช้งาน</p>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?page=borrowlist">
                                <i class="pe-7s-cart"></i>
                                <p>รายการยืมครุภัณฑ์</p>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?page=borrowlist_material">
                                <i class="pe-7s-cart"></i>
                                <p>รายการยืมวัสดุ</p>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?page=genQR">
                                <i class="fa fa-qrcode"></i>
                                <p>สร้าง QR-CODE ครุภัณฑ์</p>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?page=genQRmaterial">
                                <i class="fa fa-qrcode"></i>
                                <p>สร้าง QR-CODE วัสดุ</p>
                            </a>
                        </li>

                        <li style="background-color: rgba(191,128,255,0.3); border-radius: 10px; position: absolute; width: 85%;
                                                     margin-left: 7.5%; bottom: 10px; margin-right: 7.5%;">
                            <a href="" id="log_out">
                                <i class="pe-7s-back"></i>
                                <p>Logout</p>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
</body>

<!--   Core JS Files   -->
<!-- <script src="lib/boots/js/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="lib/boots/js/bootstrap.min.js" type="text/javascript"></script> -->

<!--  Charts Plugin -->
<!-- <script src="lib/boots/js/chartist.min.js"></script> -->

<!--  Notifications Plugin    -->
<!-- <script src="lib/boots/js/bootstrap-notify.js"></script> -->

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<!-- <script src="lib/boots/js/light-bootstrap-dashboard.js?v=1.4.0"></script> -->

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<!-- <script src="lib/boots/js/demo.js"></script> -->


</html> 