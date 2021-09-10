<!DOCTYPE html>
<html>
        <head>
                <title>DIMS</title>
                <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
            <script src="lib/jquery/jquery.min.js"></script>
            <script src="lib/bootstrap/js/bootstrap.min.js"></script>
            <script src="lib/jquery-validation/dist/jquery.validate.min.js"></script>
            <link href="vendors/pnotify/dist/pnotify.css" rel="stylesheet">
            <link href="vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
            <script src="vendors/pnotify/dist/pnotify.js"></script>
            <script src="vendors/pnotify/dist/pnotify.buttons.js"></script>
            <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.min.css">
            <link rel="stylesheet" href="lib/w3/w3.css">
            <link rel="stylesheet" href="lib/css/staff_main.css">
                <script src="lib/js/CryptoJs.js"></script>
                <script src="lib/js/config.js"></script>
                <script src="lib/js/usermain.js"></script>
                <script src="lib/js/jsQR.js"></script>
                <script src="lib/js/dw-qrscan.js"></script>

                <style>
                    input[type=text], input[type=password],input[type=email] {
                    width: 95%;
                    padding: 15px;
                    margin-left: 13px;
                    /* display: inline-block; */
                    border: none;
                    background: #f1f1f1;
                    }
                </style>
            </head>
<body>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="#">DIMS</a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="usermain.php?page=home">Home</a></li>
                    <li><a href="usermain.php?page=durablelist">รายการครุภัณฑ์</a></li>
                    <li><a href="usermain.php?page=materiallist">รายการวัสดุ</a></li>
                    <li><a href="usermain.php?page=borrowlist">รายการยืมครุภัณฑ์</a></li>
                    <li><a href="usermain.php?page=borrowlist2">รายการยืมวัสดุ</a></li>
                    
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#" data-toggle="modal" data-target="#userProfile" id="showInfoProfile"><div class="showFname"> User </div></a></li>
                    <li><a href="index.html" class="User_Out"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

        <div style="position:absolute; padding:8px; width:100%;">
            <?php
                switch ($_GET["page"]) {
                        // case "home":
                        //     include("Userhome.html");
                        // break;
                        case "borrow":
                            include("borrow-form.html");
                        break;
                        case "borrowlist":
                            include("durable_borrowlist.html");
                        break;
                        case "borrowlist2":
                            include("tools_borrowlist.html");
                        break;
                        case "durablelist":
                            include("list_durable.html");
                        break;
                        case "materiallist":
                            include("list_material.html");
                        break;
                        default:
                            // include("Userhome.html");
                    }
            ?>
        </div>

    <div id="userProfile" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">ประวัติส่วนตัว</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div id="showProfile"></div>
                            <input type="text" name="" id="member_id_info" hidden="hidden">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
    </div>
    <div id="ChangePass" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Change Password</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <label for="email"><b>&nbsp;&nbsp;&nbsp;รหัสผ่านใหม่</label>
                            <input type="password" placeholder="" name="oldpass" id="oldpass" required>
                            <label for="email"><b>&nbsp;&nbsp;&nbsp;รหัสผ่านใหม่ อีกครั้ง</label>
                            <input type="password" placeholder="" name="newpass" id="newpass" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success" id="SaveChange">Save</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
    </div>
    
    
    
</body>
</html>