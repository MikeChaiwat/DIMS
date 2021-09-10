<?php 
    include('config.php');
    $Con = mysqli_connect(SERVER ,USERNAME,PASSWORD,DB);
    if (!$Con){
        die('Could not connect: ' .mysql_error());
    }else{
        mysqli_query($Con,"SET character_set_results=utf8");
        mysqli_query($Con,"SET character_set_client=utf8");
        mysqli_query($Con,"SET character_set_connection=utf8");
    }
?>