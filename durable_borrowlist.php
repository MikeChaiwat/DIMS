<!DOCTYPE html>
<html>

<head>
    
<?php
        include('config/connection.php');
        $status_id = (isset($_POST['status_id'])) ? $_POST['status_id'] : '';

        // $sql = "SELECT * FROM confirm_status WHERE confirm_status_id = 'c0002' ";
        // $result2 = mysqli_query($Con,$sql);
        if($status_id != ''){
    
        $sql = "SELECT * FROM durable_borrowlist WHERE confirm_status_id = 'c0002' ";
        $result = mysqli_query($Con,$sql);
        if($result){  
            // $sql2 = " SELECT student_id,student_Fname,student_Lname,id_card_number,email,username,passwords FROM student WHERE email = '".$Email."' ";
            $query = mysqli_query($Con," SELECT b.b_id,b.student_id,s.student_Fname,s.student_Lname,b.durable_id,p.product_name,b.loc_bor,b.borrow_date,b.return_date,s.email 
            FROM durable_borrowlist b
            INNER JOIN student s on s.student_id = b.student_id  
            INNER JOIN product p on p.product_id = b.durable_id WHERE b.student_id = '".$user_id."' ");
            $rc = mysqli_num_rows($query);
            while ($row=mysqli_fetch_array($query)){
                $Email = $row['email'];
                $student_Fname = $row['student_Fname'];
                $student_Lname = $row['student_Lname'];
                $borrow_date = $row['borrow_date'];
                $return_date = $row['return_date'];
                $product_name = $row['product_name'];
                $student_id = $row['student_id'];
            }
        }
            mysqli_close($Con);
            $Subject = 'Notice borrow durable';
            $email = $Mail;
            $strMessage = "";
            $strMessage .= "<br>ถึงคุณ ".$student_Fname."  ".$student_Lname." <br>";
            $strMessage .= "=================================<br>";
            $strMessage .= "คุณได้รับการยืนยันให้ยืมครุภัณฑ์ จากผู้ดูแลเป็นที่เรียบร้อยแล้ว<br>";
            $strMessage .= "สิ่งคุณได้ยืม : ".$product_name."<br> เริ่มยืมตั้งแต่ : ".$borrow_date."<br>กรุณาคืนก่อนวันที่ : ".$return_date."<br>";
            $strMessage .= "รหัสสมาชิกของคุณคือ : ".$student_id."<br>";
            $strMessage .= "=================================<br>";
            $strMessage .= "Contact Support : admin@itidims.co<br>";
            $strMessage .= "By ITIDIMS<br>";
            emailsend($email,$Subject,$strMessage);
                header("Location:/staff_main.php");
            if($success == TRUE){
                // header('Content-Type: application/json');
                // echo json_encode('1');
                //echo '<script type="text/javascript">alert("Email Sended");</script>';
                //header("Location:/userlogin.php");
            }    
            else{
                // header('Content-Type: application/json');
                // echo json_encode('0');
                echo 'erorr';
            }
        }
    ?> 
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
        <link rel="stylesheet" href="lib/css/borrow2.css">
        <script src="lib/js/CryptoJs.js?updated=9999999999"></script>
        <script src="lib/js/config.js?updated=9999999999"></script>
        <script src="lib/js/user_borrow.js?v=3"></script>
        <script src="lib/js/usermain.js?v=15"></script>

         <!-- Bootstrap core CSS     -->
    <link href="lib/boots/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="lib/boots/css/animate.min.css" rel="stylesheet" />

    <!--  Light Bootstrap Table core CSS    -->
    <link href="lib/boots/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet" />

</head>
<body>
    <div class="main-panel" style="position: absolute; z-index: 2; width: 100%;">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <!-- card -->
                        <div class="card ">
                            <div class="header" align="center">
                                <h4 class="title">รายการยืมครุภัณฑ์</h4>
                            </div>
                            <div style="padding-left: 2%; padding-right: 2%; padding-bottom: 5%;">
                                    <div class="tbl_header Border Bold" style="margin-top: 2%;">
                                        <div class="tbl_content20 BorderRight paddingLeft5 txt_overflo">หมายเลขครุภัณฑ์</div>
                                        <div class="tbl_content20 BorderRight paddingLeft5 txt_overflo">ชื่อตั้งเบิก</div>
                                        <div class="tbl_content20 BorderRight paddingLeft5 txt_overflo">สถานที่ยืม</div>
                                        <div class="tbl_content20 BorderRight paddingLeft5 txt_overflo">สถานะ</div>
                                    </div>
                                    <form action="" method="post" enctype="multipart/form-data" id="">
                                        <div id="borList" class="tbl_ResultContainer Border "></div>
                                    </form>
                            </div>
                        </div>
                        <div></div>
                    </div>
                    <!--  -->
                </div>
            </div>
        </div>
    </div>
</body>
<!--   Core JS Files   -->
<script src="lib/boots/js/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="lib/boots/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Charts Plugin -->
<script src="lib/boots/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="lib/boots/js/bootstrap-notify.js"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="lib/boots/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="lib/boots/js/demo.js"></script>
</html>