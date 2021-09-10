<?php
include('../config/connection.php');
$request_method = $_SERVER["REQUEST_METHOD"];
switch ($request_method) {
    case "GET":
        $sql = "SELECT * from unit";      
        $query = mysqli_query($Con,$sql);
        $rc = mysqli_num_rows($query);
        // $sql[1] = "SELECT loc_id,";
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
    if ($ACTION == 'NewUnit') {
        $Unit_No = $_POST['Unit_No'];
        $Unit_Detail = $_POST['Unit_Detail'];

        $sql = " INSERT INTO unit (unit_id,unit_detail) VALUE ";
        $sql .= " ('".$Unit_No."','".$Unit_Detail."')";
        $result = mysqli_query($Con,$sql);
        mysqli_close($Con);
                
        if($result){
            header('Content-Type: application/json');
            echo json_encode('1');
        }else{
            header('Content-Type: application/json');
            echo json_encode('0');
        }
    }
    if ($ACTION == 'EditUnit') {
        $EdiUnit_No = $_POST['EdiUnit_No'];
        $EdiUnit_Detail = $_POST['EdiUnit_Detail'];

        $sql = " UPDATE unit SET ";
        $sql .= " unit_id = '".$EdiUnit_No."'," ;
        $sql .= " unit_detail = '".$EdiUnit_Detail."'";
        $sql .= " WHERE unit_id = '".$EdiUnit_No."'" ;
        // $sql = "UPDATE unit
        // SET unit_id = '".$EdiUnit_No."',unit_detail = '".$EdiUnit_Detail."'
        // WHERE unit_id = '".$EdiUnit_No."';";

        $result = mysqli_query($Con,$sql);
                mysqli_close($Con);
                if($result){
                    header('Content-Type: application/json');
                    echo json_encode('1');
                }else{
                    header('Content-Type: application/json');
                    echo json_encode('0');
                }
    }
    if ($ACTION == 'DelUnit') {
        $DelUnit_No = $_POST['DelUnit_No'];
        $sql = " DELETE FROM unit WHERE unit_id = $DelUnit_No ";
        $result = mysqli_query($Con,$sql);

        mysqli_close($Con);
        if($result){
            header('Content-Type: application/json');
            echo json_encode('1');
        }else{
            header('Content-Type: application/json');
            echo json_encode('0');
        }
    }
        break;
}
?>