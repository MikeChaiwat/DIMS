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
        case "POST":
            $ACTION = $_POST['ACTION'];
            if ($ACTION == 'ShowDurableQR') {
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
           

            // no break
        default:
            break;
    }
