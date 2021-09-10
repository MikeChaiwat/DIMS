<?php
    include('../config/config.php');
    $DIR = DIR;
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            if(empty($_GET['ACCESS'])){
                $dir = $DIR;
                $file = array_diff(scandir($dir),array('.','..','.DS_Store'));
                foreach($file as $key=>$val){
                    if(is_dir($dir.'/'.$val)){
                        $directory[] = $val;
                    }
                }
                header('Content-Type: application/json');
                echo json_encode($directory);
            }else{
                $ACCESS_FOLDER = $_GET['ACCESS'];
                $dir = '';
                if($ACCESS_FOLDER == 'All'){
                    $directory[] = '';
                    header('Content-Type: application/json');
                    echo json_encode($directory);
                }else{
                    $directory[] = $ACCESS_FOLDER;
                    header('Content-Type: application/json');
                    echo json_encode($directory);
                }
            }
            break;
        case "POST":
            $ACCESS_FOLDER = $_POST['ACCESS'];
            if($ACCESS_FOLDER == 'All'){
                $folder = $_POST['folder'];
                if($ACCESS_FOLDER == 'All' && $folder == 'All'){
                    $dir = $DIR;
                    $file = array_diff(scandir($dir),array('.','..','.DS_Store'));
                    foreach($file as $key=>$val){
                        if(is_dir($dir.'/'.$val)){
                            $directory[] = $val;
                        }
                    }
                    header('Content-Type: application/json');
                    echo json_encode($directory);
                }else{
                    $folder = substr($_POST['folder'],4);
                    $dir = $DIR.'/'.$folder;
                    $file = array_diff(scandir($dir),array('.','..','.DS_Store'));
                    foreach($file as $key=>$val){
                        if(is_dir($dir.'/'.$val)){
                            $directory[] = $val;
                        }
                    }
                    header('Content-Type: application/json');
                    echo json_encode($directory);
                }
            }else{
                $folder = $_POST['folder'];
                if($ACCESS_FOLDER == $folder){
                    $dir = $DIR.'/'.$ACCESS_FOLDER;
                    $file = array_diff(scandir($dir),array('.','..','.DS_Store'));
                    foreach($file as $key=>$val){
                        if(is_dir($dir.'/'.$val)){
                            $directory[] = $val;
                        }
                    }
                    header('Content-Type: application/json');
                    echo json_encode($directory);
                }else{
                    $dir = $DIR.'/'.$ACCESS_FOLDER.'/'.$folder;
                    $file = array_diff(scandir($dir),array('.','..','.DS_Store'));
                    foreach($file as $key=>$val){
                        if(is_dir($dir.'/'.$val)){
                            $directory[] = $val;
                        }
                    }
                    header('Content-Type: application/json');
                    echo json_encode($directory);
                }
            }
            break;
    }
?>