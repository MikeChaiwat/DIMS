<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = "SELECT DISTINCT product.product_name,product.product_detail,durable_picture.durable_image
            FROM t_durable 
            INNER JOIN product on t_durable.product_id = product.product_id
            INNER JOIN durable_picture on durable_picture.pic_id = t_durable.pic_id 
            ORDER BY product.product_name ASC";
            $query = mysqli_query($Con, $sql);
            $rc = mysqli_num_rows($query);
            // $sql = "SELECT loc_id,";
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
            break;
            case 'GET2':
                $sql = "SELECT * FROM build_room";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                if ($rc2 > 0) {
                    while ($row2 = mysqli_fetch_assoc($query2)) {
                        $rows[] = $row;
                    }
                    mysqli_close($Con);
                    header('Content-Type: application/json');
                    echo json_encode($rows);
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
                break;
        case "POST":
            $ACTION = $_POST['ACTION'];
            if ($ACTION == 'NewDurable') {
                $Durable_No = $_POST['Durable_No'];
                $Durable_Name = $_POST['Durable_Name'];
                $Durable_Detail = $_POST['Durable_Detail'];
                $Unit_No = $_POST['Unit_No'];
                $Type_No = $_POST['Type_No'];
                $Loc_no = 1;
                $Room_Detail = $_POST['Room_Detail'];
                $Status_No = $_POST['Status_No'];
                $Holding = "0000";
                $Pic_id = $_POST['Pic_id'];
                $Note = $_POST['Note'];

                $sql2 = " INSERT INTO product (product_id,product_name,product_detail,unit_id,types_id) 
                VALUE ('".$Durable_No."','".$Durable_Name."','".$Durable_Detail."','".$Unit_No."','".$Type_No."')";
                $result2 = mysqli_query($Con, $sql2);
                if ($result2) {
                    $sql = " INSERT INTO t_durable (durable_id,product_id,loc_id,room_id,status_id,holding_id,pic_id,modify_date,checkstatus_id,staff_id,note) 
                    VALUE ('".$Durable_No."','".$Durable_No."','".$Loc_no."','".$Room_Detail."','".$Status_No."','".$Holding."','".$Pic_id."','0000-00-00','0',0,'".$Note."')";
                    $result = mysqli_query($Con, $sql);
                    mysqli_close($Con);
                    if ($result) {
                        header('Content-Type: application/json');
                        echo json_encode('1');
                    }
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'EditDur') {
                $EditDurable_id = $_POST['EditDurable_id'];
                $EditDurable_Name = $_POST['EditDurable_Name'];
                $EditDurable_Detail = $_POST['EditDurable_Detail'];
                $EditType_No = $_POST['EditType_No'];
                $EditUnit_No = $_POST['EditUnit_No'];
                $EditLoc = $_POST['EditLoc'];
                $EditRoom = $_POST['EditRoom'];
                $EditStatus = $_POST['EditStatus'];
                // $EditCheckstatus = $_POST['EditCheckstatus'];

                
                $sql = " UPDATE t_durable t INNER JOIN product p ON p.product_id = t.product_id
                SET p.product_name = '".$EditDurable_Name."',
                p.product_detail = '".$EditDurable_Detail."',
                p.unit_id = '".$EditUnit_No."',
                p.types_id = '".$EditType_No."',
                t.loc_id = '".$EditLoc."',
                t.room_id = '".$EditRoom."',
                t.status_id = '".$EditStatus."'
                WHERE t.durable_id = '".$EditDurable_id."' ";

                $result = mysqli_query($Con, $sql);
                if ($result) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
                //mysqli_close($Con);
            }
            if ($ACTION == 'DelDurable') {
                $DEldurable_id = $_POST['DEldurable_id'];
                
                $sql2 = "DELETE FROM t_durable WHERE t_durable.durable_id = '".$DEldurable_id."' ";
                $result2 = mysqli_query($Con, $sql2);
                // mysqli_close($Con);
                if ($result2) {
                    $sql = "DELETE FROM product WHERE product.product_id = '".$DEldurable_id."' ";
                    $result = mysqli_query($Con, $sql);
                    mysqli_close($Con);
                    if ($result) {
                        header('Content-Type: application/json');
                        echo json_encode('1');
                    }
                } else {
                    header('Content-Type: application/json');
                    echo json_encode($sql2);
                }
            }
            if ($ACTION == 'search') {
                $Search = $_POST['Search'];
                
                $sql = "SELECT t_durable.product_id,product.product_name,locations.loc_id,locations.build_detail,build_room.room_id,build_room.room_detail,
                status_durable.status_detail,status_durable.status_id,holding.holding_name,product.product_detail,
                type_product.type_detail,type_product.types_id,unit.unit_id FROM t_durable 
                INNER JOIN status_durable on t_durable.status_id = status_durable.status_id 
                INNER JOIN product on t_durable.product_id = product.product_id
                INNER JOIN unit on unit.unit_id = product.unit_id
                INNER JOIN holding on t_durable.holding_id = holding.holding_id 
                INNER JOIN locations on locations.loc_id = t_durable.loc_id 
                INNER JOIN build_room on build_room.room_id = t_durable.room_id
                INNER JOIN type_product on product.types_id = type_product.types_id
                WHERE t_durable.product_id LIKE '%".$Search."%' OR product.product_name LIKE '%".$Search."%' ";

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
            if ($ACTION == 'NewLoc') {
                $Loc_id = $_POST['Loc_id'];
                $Loc_detail = $_POST['Loc_detail'];

                $sql = " INSERT INTO locations (loc_id,build_detail) VALUE ";
                $sql .= " ('".$Loc_id."','".$Loc_detail."')";
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
            if ($ACTION == 'NewRoom') {
                $Room_detail = $_POST['Room_detail'];
       
                $sql = " INSERT INTO build_room (room_id,room_detail) VALUE ";
                $sql .= " (NULL,'".$Room_detail."')";
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
            if ($ACTION == 'ShowDurable') {
                $Durable_name = $_POST['Durable_name'];
                $Durable_de = $_POST['Durable_de'];
                $sql = "SELECT DISTINCT product.product_name,product.product_detail,durable_picture.durable_image,
                product.product_id,holding.holding_name,locations.loc_id,locations.build_detail,build_room.room_id,build_room.room_detail,
                status_durable.status_detail,status_durable.status_id,type_product.type_detail,type_product.types_id,unit.unit_id
                FROM t_durable 
                INNER JOIN status_durable on t_durable.status_id = status_durable.status_id
                INNER JOIN product on t_durable.product_id = product.product_id
                INNER JOIN unit on unit.unit_id = product.unit_id
                INNER JOIN durable_picture on durable_picture.pic_id = t_durable.pic_id
                INNER JOIN holding on holding.holding_id = t_durable.holding_id
                INNER JOIN locations on locations.loc_id = t_durable.loc_id 
                INNER JOIN build_room on build_room.room_id = t_durable.room_id
                INNER JOIN type_product on product.types_id = type_product.types_id
                WHERE product.product_name = '".$Durable_name."' AND product.product_detail = '".$Durable_de."' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                // $sql = "SELECT loc_id,";
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
            }
            if ($ACTION == 'durableCheck') {
                $sql = "SELECT product.product_id,product.product_name,locations.build_detail,build_room.room_detail,
                status_durable.status_detail,holding.holding_name,checkstatus.checkstatus_name,
             	staff.staff_name,t_durable.modify_date FROM t_durable
                INNER JOIN product on t_durable.product_id = product.product_id
                INNER JOIN locations on locations.loc_id = t_durable.loc_id
                INNER JOIN status_durable on status_durable.status_id = t_durable.status_id
                INNER JOIN build_room on build_room.room_id = t_durable.room_id
                INNER JOIN holding on holding.holding_id = t_durable.holding_id
                INNER JOIN checkstatus on checkstatus.checkstatus_id = t_durable.checkstatus_id
                INNER JOIN staff on staff.staff_id = t_durable.staff_id
                ORDER BY t_durable.durable_id ASC";
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
            if ($ACTION == 'CheckLocationDurable') {
                $check_scan = $_POST['check_scan'];
                $sql = "SELECT product.product_name,product.product_detail,durable_picture.durable_image,product.product_id,holding.holding_name,locations.loc_id,locations.build_detail,build_room.room_detail,status_durable.status_detail,checkstatus.checkstatus_name
                FROM t_durable 
                INNER JOIN status_durable on t_durable.status_id = status_durable.status_id
                INNER JOIN product on t_durable.product_id = product.product_id
                INNER JOIN durable_picture on durable_picture.pic_id = t_durable.pic_id
                INNER JOIN holding on holding.holding_id = t_durable.holding_id
                INNER JOIN locations on locations.loc_id = t_durable.loc_id 
                INNER JOIN build_room on build_room.room_id = t_durable.room_id
                INNER JOIN checkstatus on t_durable.checkstatus_id = checkstatus.checkstatus_id
                WHERE t_durable.durable_id = '".$check_scan."'";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                // $sql = "SELECT loc_id,";
                if ($rc > 0) {
                    while ($row = mysqli_fetch_assoc($query)) {
                        $rows[] = $row;
                    }

                    header('Content-Type: application/json');
                    echo json_encode($rows);
                } else {
                    header('Content-Type: application/json');
                    echo json_encode("0");
                }
                mysqli_close($Con);
            }
            if ($ACTION == 'CheckLocDu') {
                $check_edt = $_POST['check_edt'];
                $sql = "SELECT product.product_name,product.product_detail,durable_picture.durable_image,
                product.product_id,holding.holding_name,locations.loc_id,locations.build_detail,build_room.room_id,build_room.room_detail,
                status_durable.status_detail,status_durable.status_id,type_product.type_detail,type_product.types_id,unit.unit_id
                FROM t_durable 
                INNER JOIN status_durable on t_durable.status_id = status_durable.status_id
                INNER JOIN product on t_durable.product_id = product.product_id
                INNER JOIN unit on unit.unit_id = product.unit_id
                INNER JOIN durable_picture on durable_picture.pic_id = t_durable.pic_id
                INNER JOIN holding on holding.holding_id = t_durable.holding_id
                INNER JOIN locations on locations.loc_id = t_durable.loc_id 
                INNER JOIN build_room on build_room.room_id = t_durable.room_id
                INNER JOIN type_product on product.types_id = type_product.types_id
                WHERE t_durable.product_id = '".$check_edt."' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                // $sql = "SELECT loc_id,";
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
            }
            if ($ACTION == 'SelectRoom') {
                $sql = "SELECT DISTINCT build_room.room_id,build_room.room_detail FROM build_room
                JOIN t_durable on build_room.room_id = t_durable.room_id";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                // $sql = "SELECT loc_id,";
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
            }
            if ($ACTION == 'FilterdurableCheck') {
                $Check_Room = $_POST['Check_Room'];
                $sql = "SELECT product.product_id,product.product_name,locations.build_detail,build_room.room_detail,
                status_durable.status_detail,holding.holding_name,checkstatus.checkstatus_name,
             	staff.staff_name,t_durable.modify_date FROM t_durable
                INNER JOIN product on t_durable.product_id = product.product_id
                INNER JOIN locations on locations.loc_id = t_durable.loc_id
                INNER JOIN status_durable on status_durable.status_id = t_durable.status_id
                INNER JOIN build_room on build_room.room_id = t_durable.room_id
                INNER JOIN holding on holding.holding_id = t_durable.holding_id
                INNER JOIN checkstatus on checkstatus.checkstatus_id = t_durable.checkstatus_id
                INNER JOIN staff on staff.staff_id = t_durable.staff_id
                WHERE build_room.room_id = '".$Check_Room."' ORDER BY t_durable.durable_id ASC  ";
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
            if ($ACTION == 'EditCheckRoom') {
                $edt_du_id = $_POST['edt_du_id'];
                $edt_room = $_POST['edt_room'];

                $sql = " UPDATE t_durable SET room_id = '".$edt_room."',modify_date = Now()
                WHERE durable_id = '".$edt_du_id."' ";

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
            if ($ACTION == 'SelectHolding') {
                $sql = "SELECT * FROM holding";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                // $sql = "SELECT loc_id,";
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
            }
            if ($ACTION == 'SelectName') {
                $sql = "SELECT DISTINCT product_name FROM product";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                // $sql = "SELECT loc_id,";
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
            }
            if ($ACTION == 'ShowSelectDuName') {
                $name_select = $_POST['name_select'];
                $sql = "SELECT DISTINCT product.product_name,product.product_detail,durable_picture.durable_image
                FROM t_durable 
                INNER JOIN product on t_durable.product_id = product.product_id
                INNER JOIN durable_picture on durable_picture.pic_id = t_durable.pic_id 
                ORDER BY product.product_name ASC WHERE product.product_name = '".$name_select."' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                // $sql = "SELECT loc_id,";
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
            if ($ACTION == 'SelectNameDurable') {
                $Room_Du = $_POST['Room_Du'];
                $sql = "SELECT DISTINCT p.product_name FROM t_durable t 
                INNER JOIN product p on p.product_id = t.durable_id WHERE t.room_id = '".$Room_Du."' ";
                $query = mysqli_query($Con, $sql);
                $rc = mysqli_num_rows($query);
                // $sql = "SELECT loc_id,";
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
            }
            if ($ACTION == 'FilterInRoomCheck') {
                $durable_check = $_POST['durable_check'];
                $Check_Room = $_POST['Check_Room'];
                $sql = "SELECT product.product_id,product.product_name,product.product_detail,durable_picture.durable_image,
                status_durable.status_detail,build_room.room_detail,t_durable.modify_date FROM t_durable 
                INNER JOIN product on t_durable.product_id = product.product_id
                INNER JOIN durable_picture on durable_picture.pic_id = t_durable.pic_id 
                INNER JOIN status_durable on status_durable.status_id = t_durable.status_id
                INNER JOIN build_room on build_room.room_id = t_durable.room_id
                WHERE product.product_name = '".$durable_check."' ORDER BY t_durable.durable_id ASC  ";
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
            if ($ACTION == 'ConfirmCheckDurable') {
                $id_durable = $_POST['id_durable'];
                $status = $_POST['status_id'];
                $holding = $_POST['holding_id'];
                $today = $_POST['today'];
                $staff_id = $_POST['staff_id'];
                $sql = "UPDATE t_durable SET checkstatus_id='1', status_id='".$status."', holding_id='".$holding."', modify_date='".$today."', staff_id=".$staff_id." WHERE durable_id='".$id_durable."'";
                $result = mysqli_query($Con, $sql);
                if ($result) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'ResetStatuscheck') {
                $sql = "UPDATE t_durable SET checkstatus_id='0', staff_id=0, modify_date='0000-00-00'";
                $result = mysqli_query($Con, $sql);
                if ($result) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'StatusOnChange') {
                $durable_id = $_POST['Durable_id'];
                $status = $_POST['Status'];
                $sql = "UPDATE t_durable SET status_id='".$status."' WHERE durable_id='".$durable_id."'";
                $result = mysqli_query($Con, $sql);
                if ($result) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'HoldingOnChange') {
                $durable_id = $_POST['Durable_id'];
                $holding = $_POST['Holding'];
                $sql = "UPDATE t_durable SET holding_id='".$holding."' WHERE durable_id='".$durable_id."'";
                $result = mysqli_query($Con, $sql);
                if ($result) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
            if ($ACTION == 'SelectImageChange') {
                $sql = "SELECT * FROM durable_picture";
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
            if ($ACTION == 'ChangeImage') {
                $img = $_POST["image"];
                $detail = $_POST["detail"];
                $name = $_POST['name'];
                $sql = "UPDATE t_durable INNER JOIN product on product.product_id = t_durable.product_id
                        SET pic_id=".$img."
                        WHERE product_name='".$name."' AND product_detail='".$detail."'";
                $query = mysqli_query($Con, $sql);
                if ($query) {
                    header('Content-Type: application/json');
                    echo json_encode('1');
                } else {
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
        break;
    }
