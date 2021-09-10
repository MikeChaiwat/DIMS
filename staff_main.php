<!DOCTYPE html>
<html>
    <head>
        <title>DIMS</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <link rel="stylesheet" href="lib/css/staff_main.css">
        <script src="lib/js/CryptoJs.js"></script>
        <script src="lib/js/config.js"></script>
        <script src="lib/js/staff_main.js"></script>
        <script src="lib/js/jsQR.js"></script>
        <script src="lib/js/dw-qrscan.js"></script>
<style>
    /* .badge {
   position:relative;
} */
.badge {
    position: absolute;
    top: 0px;
    right: -10px;
    padding: 5px 8px;
    border-radius: 100%;
    background: red;
    color: white;
}
</style>
<style type="text/css">
img.resize  {
	width: 32px;
	height: 32px;
	border: 0;
}
img:hover.resize  {
	width: 128px;
	height: 128px;
	border: 0;
    border-radius: 50%;
}
</style>
    </head>
<body>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header"> 
          <div class="navbar-brand" style="margin-top:0%;"><div id="showpic"></div></div>
          <div class="navbar-brand" href="#" style="margin-left:25%;margin-bottom:-40%;margin-top:-40%;"> <center>DIMS</center></div>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button> 
            <div class="navbar-brand" href="#" style="margin-left:25%;margin-bottom:-40%;"> <center>DIMS</center></div>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="staff_main.php?page=home">Home</a></li>
                    <li><a href="staff_main.php?page=checkdurable">ตรวจสอบครุภัณฑ์</a></li>
                    <li><a href="staff_main.php?page=confirm"><i class="glyphicon glyphicon-bell" aria-hidden="true" data-toggle="tooltip" title="แจ้งเตือนคำร้องขอยืมครุภัณฑ์"></i>
                    คำร้องขอยืมครุภัณฑ์<span class="badge"   id="notice" style="margin-right:5%;">0</span></a></li>
                    <li><a href="staff_main.php?page=confirm2"><i class="glyphicon glyphicon-bell" aria-hidden="true" data-toggle="tooltip" title="แจ้งเตือนคำร้องขอยืมเครื่องมือ"></i>
                    คำร้องขอยืมเครื่องมือ<span class="badge"  id="notice2" style="margin-right:5%;">0</span></a></li>
                </ul>
            <ul class="nav navbar-nav navbar-right">
                    
              <li><a href="#"><div><div id="showuser"> </div> </div></a></li>
              <li><a href="" id="User_Out"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
            </ul>
          </div>
        </div>
      </nav>
        
        <div class="">
            <center><button class="btn btn-info btn-lg" data-toggle="modal" data-target="#ScanQR" data-toggle="tooltip" title="Scan QR Code" id="scan"><i class="fa fa-qrcode" aria-hidden="true"></i> รับคืน </button></center>
            <br>
            
            <div style="width:100%;">
            <?php
                switch ($_GET["page"]) {
                        case "home":
                            include("staff_home.html");
                        break;
                        case "confirm":
                            include("confirmpage.php");
                        break;
                        case "confirm2":
                            include("confirmpage2.html");
                        break;
                        case "checkdurable":
                            include("checkdurable.html");
                        break;
                        default:
                            // include("Userhome.html");
                    }
            ?>
        </div>
      </div>
      
      <div id="ScanQR" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="ScanQR">คืนครุภัณฑ์หรือวัสดุ</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                        <center>
                            <!-- <i class="fa fa-qrcode" aria-hidden="true" style="cursor: pointer; font-size: 300px;"></i> -->
                        <div class="well" style="position: relative;display: inline-block;">
                            <canvas id="qr_canvas" width="320" height="240"></canvas>
                            <div class="scanner-laser laser-rightBottom" style="opacity: 0.5;"></div>
                            <div class="scanner-laser laser-rightTop" style="opacity: 0.5;"></div>
                            <div class="scanner-laser laser-leftBottom" style="opacity: 0.5;"></div>
                            <div class="scanner-laser laser-leftTop" style="opacity: 0.5;"></div>
                        </div>
                        <div><button id="scan" type="button" class=""><i class="fa fa-refresh" aria-hidden="true"></i></button></div>
                        </center>
                        </div>
                        <h3><center>หรือ</center></h3>
                        <div>
                            <center><input type="text" name="" id="borrow_scan" placeholder="ใส่หมายเลขครุภัณฑ์หรือรหัสวัสดุ">
                            <button id="durable_re_btn" type="button" class="btn btn-success">ยืนยัน</button>
                        </center>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    
    <div id="Borrow" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><center>รายการคืนครุภัณฑ์/วัสดุ</h4>
                    </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="usr"class="control-label col-sm-10">รหัสนักศึกษา/บุคลากร</label>
                                <input type="text" name="" id="user_no" class="form-control">
                            </div>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="usr"class="control-label col-sm-6">ชื่อ</label>
                                <input type="text" name="" id="user_name" class="form-control">
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="usr"class="control-label col-sm-6">นามสกุล</label>
                                    <input type="text" name="" id="user_lastname" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="usr"class="control-label col-sm-10">หมายเลขครุภัณฑ์/วัสดุ</label>
                                <input type="text" name="" id="durable_no" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="usr"class="control-label col-sm-6">ชื่อครุภัณฑ์/วัสดุ</label>
                                <textarea name="" id="durable_name" class="form-control" type="text"></textarea>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="usr"class="control-label col-sm-6">สถานที่ยืม</label>
                                <textarea name="" id="local" class="form-control" type="text"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="usr"class="control-label col-sm-6">วันที่ยืม</label>
                                <input type="date" name="" id="borrow_time" class="form-control">
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for="usr"class="control-label col-sm-6">วันที่คืน</label>
                                <input type="date" name="" id="return" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="text" name="" id="res" hidden="hidden">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                        <button id="durable_submit_btn" type="button" class="btn btn-success">รับคืน</button>
                    </div>
                </div>
            </div>
    </div>

    <!-- <div id="return_material" class="modal fade" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><center>รายการคืนวัสดุ</h4>
                    </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for=""class="control-label col-sm-10">รหัสนักศึกษา</label>
                                <input type="text" name="" id="mat_user_no" class="form-control">
                            </div>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for=""class="control-label col-sm-6">ชื่อ</label>
                                <input type="text" name="" id="mat_user_name" class="form-control">
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for=""class="control-label col-sm-6">นามสกุล</label>
                                    <input type="text" name="" id="mat_user_lastname" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for=""class="control-label col-sm-10">รหัสวัสดุ</label>
                                <input type="text" name="" id="return_material_id" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for=""class="control-label col-sm-6">ชื่อวัสดุ</label>
                                <textarea name="" id="return_material_name" class="form-control" type="text"></textarea>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-">
                                <label for="usr"class="control-label col-sm-6">สถานที่ยืม</label>
                                <textarea name="" id="return_material_local" class="form-control" type="text"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for=""class="control-label col-sm-6">วันที่ยืม</label>
                                <input type="date" name="" id="mat_borrow_time" class="form-control">
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-10 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label for=""class="control-label col-sm-6">วันที่คืน</label>
                                <input type="date" name="" id="mat_return" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
                        <button id="material_submit_btn" type="button" class="btn btn-success">รับคืน</button>
                    </div>
                </div>
            </div>
    </div> -->
    
</body>
</html>