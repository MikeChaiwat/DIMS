<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "POST":
            $ACTION = $_POST['ACTION'];
            if($ACTION =='fil_durable')
            {
                $Search = $_POST['Search'];
                $sql = "SELECT DISTINCT product.product_name,product.product_detail,durable_picture.durable_image
                FROM t_durable 
                INNER JOIN product on t_durable.product_id = product.product_id
                INNER JOIN durable_picture on durable_picture.pic_id = t_durable.pic_id 
                WHERE product.product_name LIKE '%".$Search."%'";
                $query = mysqli_query($Con,$sql);
                $rc = mysqli_num_rows($query);
                // $sql = "SELECT loc_id,";
                if($rc > 0){
                    while($row = mysqli_fetch_assoc($query)){
                        $rows[] = $row;
                    }
                    mysqli_close($Con);
                    header('Content-Type: application/json');
                    echo json_encode($rows);

                }else{
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
            }
        break;
    }
?>