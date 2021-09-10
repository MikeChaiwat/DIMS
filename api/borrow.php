<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = " SELECT b.b_id,b.student_id,s.student_Fname,s.student_Lname,b.durable_id,p.product_name,b.loc_bor,
            b.borrow_date,b.return_date FROM durable_borrowlist b
            INNER JOIN student s on s.student_id = b.student_id  
            INNER JOIN product p on p.product_id = b.durable_id
            WHERE confirm_status_id = 'c0002 '";
            $query = mysqli_query($Con, $sql);
            $rc = mysqli_num_rows($query);
            if ($rc > 0) {
                while ($row = mysqli_fetch_assoc($query)) {
                    $rows[] = $row;
                }
                mysqli_close($Con);
                header('Content-Type: application/json');
                echo json_encode($rows);
            } else {
                header('Content-Type: application/json');
                echo json_encode($rows);
            }
        break;
        case "POST":
            $ACTION = $_POST['ACTION'];
            $Borrow_Scan = $_POST['Borrow_Scan'];
            if ($ACTION == 'searchingdurable') {
                $sql = "SELECT * FROM product WHERE product_id = '".$Borrow_Scan."' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                if ($rc > 0) {
                    while ($row = mysqli_fetch_assoc($query)) {
                        $rows[] = $row;
                    }
                    mysqli_close($Con);
                    header('Content-Type: application/json');
                    echo json_encode($rows);
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'searching2') {
                $Borrow_Scan = $_POST['Borrow_Scan'];
                $sql = "SELECT * FROM boxes WHERE box_id = '".$Borrow_Scan."' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                if ($rc > 0) {
                    while ($row = mysqli_fetch_assoc($query)) {
                        $rows[] = $row;
                    }
                    mysqli_close($Con);
                    header('Content-Type: application/json');
                    echo json_encode($rows);
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'searching3') {
                $Borrow_Scan = $_POST['Borrow_Scan'];
                $sql = "SELECT b.b_id,b.student_id,s.student_Fname,s.student_Lname,b.durable_id,p.product_name,b.loc_bor,
                b.borrow_date,b.return_date FROM durable_borrowlist b
                INNER JOIN student s on s.student_id = b.student_id  
                INNER JOIN product p on p.product_id = b.durable_id WHERE b.durable_id = '".$Borrow_Scan."' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                if ($rc > 0) {
                    while ($row = mysqli_fetch_assoc($query)) {
                        $rows[] = $row;
                    }
                    mysqli_close($Con);
                    header('Content-Type: application/json');
                    echo json_encode($rows);
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'searching4') {
                $Borrow_Scan = $_POST['Borrow_Scan'];
                $sql = "SELECT s.student_id,s.student_Fname,s.student_Lname,mb.material_id ,m.material_name,
                mb.loc_bor,mb.borrow_date,mb.return_date FROM material_borrowlist mb
                INNER JOIN student s on s.student_id = mb.student_id 
                INNER JOIN material m on m.material_id = mb.material_id 
                WHERE mb.material_id = '".$Borrow_Scan."'";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                if ($rc > 0) {
                    while ($row = mysqli_fetch_assoc($query)) {
                        $rows[] = $row;
                    }
                    mysqli_close($Con);
                    header('Content-Type: application/json');
                    echo json_encode($rows);
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'searchReTool') {
                $Borrow_Scan = $_POST['Borrow_Scan'];
                $sql = "SELECT * FROM tools_borrowlist  WHERE box_id = '".$Borrow_Scan."' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                if ($rc > 0) {
                    while ($row = mysqli_fetch_assoc($query)) {
                        $rows[] = $row;
                    }
                    mysqli_close($Con);
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'searchReturn') {
                $Borrow_Scan = $_POST['Borrow_Scan'];
                $sql = "SELECT * FROM durable_borrowlist WHERE durable_id = '".$Borrow_Scan."' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                if ($rc > 0) {
                    header('Content-Type: application/json');
                    echo json_encode('1'); // เจอครุภัณฑ์
                } else {
                    $sql2 = "SELECT * FROM material_borrowlist WHERE material_id = '".$Borrow_Scan."' ";
                    $query2 = mysqli_query($Con, $sql2);
                    $rc2 =   mysqli_num_rows($query2);
                    if ($rc2 > 0) {
                        header('Content-Type: application/json');
                        echo json_encode('2'); // เจอวัสดุ
                    } else {
                        header('Content-Type: application/json');
                        echo json_encode('0'); // ไม่เจออะไรเลย
                    }
                }
                mysqli_close($Con);
            }
            if ($ACTION == 'AddBorrow') {
                $User_no = $_POST['User_no'];
                $Durable_no = $_POST['Borrow_Scan'];
                $Borrow_Loc = $_POST['Borrow_Loc'];
                $Borrow_Time = $_POST['Borrow_Time'];
                $Return_Time = $_POST['Return_Time'];
                $sql = "INSERT INTO durable_borrowlist VALUE (NULL,'".$User_no."','".$Durable_no."','".$Borrow_Loc."','".$Borrow_Time."','".$Return_Time."','c0001')
                ";
                $query = mysqli_query($Con, $sql);
                if ($query) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
                mysqli_close($Con);
                // $User_no = $_POST['User_no'];
                // $Durable_no = $_POST['Durable_no'];
                // $Borrow_Loc = $_POST['Borrow_Loc'];
                // $Borrow_Time = $_POST['Borrow_Time'];
                // $Return_Time = $_POST['Return_Time'];
                // $Null = null;
                // $Stat = "c0001";

                // $sql = "INSERT INTO durable_borrowlist (b_id,student_id,durable_id,loc_bor,borrow_date,return_date,confirm_status_id)
                // VALUE ('".$Null."','".$User_no."','".$Durable_no."','".$Borrow_Loc."','".$Borrow_Time."','".$Return_Time."','".$Stat."')";
                // $result = mysqli_query($Con, $sql);
                // if ($result) {
                //     header('Content-Type: application/json');
                //     echo json_encode('1');
                // } else {
                //     header('Content-Type: application/json');
                //     echo json_encode('0');
                // }
                // mysqli_close($Con);
            }
            if ($ACTION == 'AddBorrowtools') {
                $User_no = $_POST['User_no'];
                $Durable_no = $_POST['Durable_no'];
                $Borrow_Loc = $_POST['Borrow_Loc'];
                $Borrow_Time = $_POST['Borrow_Time'];
                $Return_Time = $_POST['Return_Time'];
                $Null = null;
                $Stat = "c0001";

                $sql = "INSERT INTO tools_borrowlist (b_id, student_id, box_id, loc_bor, borrow_date, return_date, confirm_status_id)
                VALUE ('".$Null."','".$User_no."','".$Durable_no."','".$Borrow_Loc."','".$Borrow_Time."','".$Return_Time."','".$Stat."')";

                $result = mysqli_query($Con, $sql);
                mysqli_close($Con);
                if ($result) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
    break;
    }
