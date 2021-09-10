<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = "SELECT DISTINCT product_name FROM product";
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
        break;
    }
?>