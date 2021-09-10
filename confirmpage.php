<?php

   
    ini_set('default_charset', 'utf-8');

    
?>
<?php
    // include('config/connection.php');
    // $Confirm_id = (isset($_POST['data_confirm'])) ? $_POST['data_confirm'] : '';
    // $b_id = (isset($_POST['b_id'])) ? $_POST['b_id'] : '';
    // $user_id = (isset($_POST['user_id'])) ? $_POST['user_id'] : '';

    // if($user_id != '' || $user_id != NULL){
    //     $sql = "UPDATE durable_borrowlist SET confirm_status_id = 'c0002'
    //             WHERE durable_id = '".$Confirm_id."' AND b_id = '".$b_id."' ";
    //     $result = mysqli_query($Con,$sql);
    //     // if($result){
    //     //     $sql2 = "UPDATE t_durable SET holding_id = '1111'
    //     //             WHERE durable_id = '".$Confirm_id."' ";
    //     //     $result2 = mysqli_query($Con,$sql2);
                   
    //         if($result)
    //         {
    //             $sql3 = " SELECT b.b_id,b.student_id,s.student_Fname,s.student_Lname,b.durable_id,p.product_name,b.loc_bor,
    //             b.borrow_date,b.return_date,s.email FROM durable_borrowlist b
    //             INNER JOIN student s on s.student_id = b.student_id
    //             INNER JOIN product p on p.product_id = b.durable_id WHERE b.student_id = '".$user_id."' " ;
    //             $query = mysqli_query($Con,$sql3);
    //             $rc = mysqli_num_rows($query);
    //             if($rc > 0){
    //                 while($row = mysqli_fetch_assoc($query)){
    //                     $Mail = $row['mail'];
    //                     $studen_F = $row['studen_Fname'];
    //                     $studen_L = $row['studen_Lname'];
    //                     $B_Date = $row['borrow_date'];
    //                     $R_Date = $row['return_date'];
    //                     $durable_N = $row['product_name'];
    //                     $user_id = $row['student_id'];
    //                 }
    //             }
    //             mysqli_close($Con);
    //             $Subject = 'Notice borrow durable';
    //             $email = $Mail;
    //             $strMessage = "";
    //             $strMessage .= "<br>ถึงคุณ ".$studen_F."  ".$studen_L." <br>";
    //             $strMessage .= "=================================<br>";
    //             $strMessage .= "คุณได้รับการยืนยันให้ยืมครุภัณฑ์ จากผู้ดูแลเป็นที่เรียบร้อยแล้ว<br>";
    //             $strMessage .= "สิ่งคุณได้ยืม : ".$durable_N."<br> เริ่มยืมตั้งแต่ : ".$B_Date."<br>กรุณาคืนก่อนวันที่ : ".$R_Date."<br>";
    //             $strMessage .= "=================================<br>";
    //             $strMessage .= "Contact Support : admin@itidims.co<br>";
    //             $strMessage .= "By ITIDIMS<br>";
    //             emailsend($email,$Subject,$strMessage);
    //         }
    // // }
    // }
?>



<!DOCTYPE html>
<html>

<head>
    
    <title>Unit List | DIMS</title>
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
    <link rel="stylesheet" href="lib/css/confirm.css">
    <script src="lib/js/CryptoJs.js"></script>
    <script src="lib/js/config.js"></script>
    <script src="lib/js/confirm.js?v=31"></script>
    <script src="lib/js/smtp.js"></script>
    <script src="lib/js/dw-qrscan.js"></script>

    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->

</head>

<body>
    <div class="main-panel">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        
                        <div style="position: relative;
                        display: -ms-flexbox;
                        display: flex;
                        -ms-flex-direction: column;
                        flex-direction: column;
                        min-width: 0;
                        width: 100%;
                        word-wrap: break-word;
                        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), 0 0 0 1px rgba(63, 63, 68, 0.1);
                        background-color: #FFFFFF;
                        background-clip: border-box;
                        border: 1px solid rgba(0,0,0,.125);
                        border-radius: .25rem;" >
                        
                            <div class="header" align="center">
                                <h4 class="title">คำร้องขอยืมครุภัณฑ์</h4>
                            </div>
                            <div style="padding-left: 2%; padding-right: 2%; padding-bottom: 5%;">
                                <div class="tbl_header Border Bold" style="margin-top: 2%;">
                                    <div class="tbl_content10 BorderRight paddingLeft5">รหัสผู้ยืม</div>
                                    <div class="tbl_content10 BorderRight paddingLeft5">ชื่อ</div>
                                    <div class="tbl_content10 BorderRight paddingLeft5">นามสกุล</div>
                                    <div class="tbl_content15 BorderRight paddingLeft5">หมายเลขครุภัณฑ์</div>
                                    <div class="tbl_content15 BorderRight paddingLeft5">ชื่อตั้งเบิก</div>
                                    <div class="tbl_content10 BorderRight paddingLeft5">สถานที่ยืม</div>
                                    <div class="tbl_content10 BorderRight paddingLeft5">วันที่ยืม</div>
                                    <div class="tbl_content10 BorderRight paddingLeft5">วันที่คืน</div>
                                    <div class="tbl_content10 BorderRight paddingLeft5">หมายเหตุ</div>
                                </div>
                                
                                    <div id="bor_list" class="tbl_ResultContainer Border "></div>
                                
                            </div>
                        </div>
                    </div>
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