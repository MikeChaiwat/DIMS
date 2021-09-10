<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "POST":
            $ACTION = $_POST['ACTION'];
            if ($ACTION == 'listdurable') {
                $sql = "SELECT product.product_id, product.product_name, product.product_detail, room_detail, durable_image 
                        FROM t_durable 
                        JOIN product on product.product_id = t_durable.product_id
                        JOIN build_room on build_room.room_id = t_durable.room_id
                        JOIN durable_picture on durable_picture.pic_id = t_durable.pic_id
                        ORDER BY product.product_name ASC";
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
           

            break;
    }
