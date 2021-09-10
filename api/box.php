<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $sql = " SELECT * FROM boxes WHERE b_status_id = 's_b_0000' ";
            $query = mysqli_query($Con,$sql);
            $rc = mysqli_num_rows($query);
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
        case "POST":
        $ACTION = $_POST['ACTION'];
        $Borrow_Scan = $_POST['Borrow_Scan'];
        if ($ACTION == 'searching2') 
        {
            $sql = "SELECT * FROM boxes WHERE durable_id = '".$Borrow_Scan."' ";
            $query = mysqli_query($Con,$sql);
            $rc = mysqli_num_rows($query);
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