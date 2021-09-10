<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "POST":
            $ACTION = $_POST['ACTION'];
            $Borrow_Scan = $_POST['Borrow_Scan'];
            $Durable_no = $_POST['Durable_no'];

            if ($ACTION == 'DelBorrow') {
                $Durable_no = $_POST['Durable_no'];
                $sql = " DELETE FROM durable_borrowlist WHERE durable_id = '".$Durable_no."'
                AND confirm_status_id= 'c0002'";
                $result = mysqli_query($Con, $sql);
                if ($result) {
                    $sql2 = "UPDATE t_durable SET holding_id = '0000' 
                    WHERE durable_id = '".$Durable_no."' ";
                    $result2 = mysqli_query($Con, $sql2);
                    mysqli_close($Con);
                    if ($result2) {
                        header('Content-Type: application/json');
                        echo json_encode('1');
                    }
                } else {
                    header('Content-Type: application/json');
                    echo json_encode($sql);
                }
            }
            if ($ACTION == 'DelBorrowMaterial') {
                $Durable_no = $_POST['Durable_no'];

                $sql = " DELETE FROM material_borrowlist WHERE material_id = '".$Durable_no."' 
                AND confirm_status_id= 'c0002'";
                $result = mysqli_query($Con, $sql);
                if ($result) {
                    $sql2 = "UPDATE t_material SET status_id = '1' 
                    WHERE material_id = '".$Durable_no."' ";
                    $result2 = mysqli_query($Con, $sql2);
                    mysqli_close($Con);

                    if ($result2) {
                        header('Content-Type: application/json');
                        echo json_encode('1');
                    }
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
        break;
    }
