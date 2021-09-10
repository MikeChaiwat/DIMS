<?php
    include('../config/connection.php');
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case 'GET':
            $sql = "SELECT pic_id,durable_image FROM durable_picture ";
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
        case 'POST':
            $ACTION = $_POST['ACTION'];
            if($ACTION == 'LoadImage'){
                $Pic_Id = $_POST['Pic_Id'];
                $sql = " SELECT durable_image FROM durable_picture WHERE pic_id = '".$Pic_Id."' ";
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
                    echo json_encode($Pic_Id);
                }
            }
        break;
    }
?>