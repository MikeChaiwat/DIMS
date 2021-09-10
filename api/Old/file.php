<?php
    include('../config/config.php');
    $DIR = DIR;
    $request_method = $_SERVER["REQUEST_METHOD"];
    switch ($request_method) {
        case "GET":
            $ACCESS_FOLDER = $_GET['ACCESS'];
            $dir = '';
            if($ACCESS_FOLDER == 'All'){
                $dir = $DIR;
            }else{
                $dir = $DIR.'/'.$ACCESS_FOLDER;
            }
            $file = array_diff(scandir($dir),array('.','..','.DS_Store'));
            $file_arr = array();
            foreach($file as $key=>$val){
                if(is_file($dir.'/'.$val)){
                    $directory['FileName'] = $val;
                    // $directory['DateModified'] = date ("d M Y H:i",filemtime($DIR.'/'.$val));
                    $directory['DateModified'] = date ("d M Y H:i",strtotime('+7 hour',filemtime($dir.'/'.$val)));
                    $directory['Size'] = human_filesize(filesize($dir.'/'.$val));
                    $directory['Extension'] = pathinfo($dir.'/'.$val, PATHINFO_EXTENSION);
                    array_push($file_arr,$directory);
                }
            }
            header('Content-Type: application/json');
            echo json_encode($file_arr);
            break;
        case "POST":
            $ACCESS_FOLDER = $_POST['ACCESS'];
            if($ACCESS_FOLDER == 'All'){
                if($_POST['folder'] == 'All' && $ACCESS_FOLDER == 'All'){
                    $dir = $DIR;
                    $file = array_diff(scandir($dir),array('.','..','.DS_Store'));
                    $file_arr = array();
                    foreach($file as $key=>$val){
                        if(is_file($dir.'/'.$val)){
                            $directory['FileName'] = $val;
                            // $directory['DateModified'] = date ("d M Y H:i",filemtime($DIR.'/'.$val));
                            $directory['DateModified'] = date ("d M Y H:i",strtotime('+7 hour',filemtime($dir.'/'.$val)));
                            $directory['Size'] = human_filesize(filesize($dir.'/'.$val));
                            $directory['Extension'] = pathinfo($dir.'/'.$val, PATHINFO_EXTENSION);
                            array_push($file_arr,$directory);
                        }
                    }
                    header('Content-Type: application/json');
                    echo json_encode($file_arr);
                }else{
                    $folder = substr($_POST['folder'],4);
                    $dir = $DIR.'/'.$folder;
                    $file = array_diff(scandir($dir),array('.','..','.DS_Store'));
                    $file_arr = array();
                    foreach($file as $key=>$val){
                        if(is_file($dir.'/'.$val)){
                            $directory['FileName'] = $val;
                            // $directory['DateModified'] = date ("d M Y H:i",filemtime($DIR.'/'.$val));
                            $directory['DateModified'] = date ("d M Y H:i",strtotime('+7 hour',filemtime($dir.'/'.$val)));
                            $directory['Size'] = human_filesize(filesize($dir.'/'.$val));
                            $directory['Extension'] = pathinfo($dir.'/'.$val, PATHINFO_EXTENSION);
                            array_push($file_arr,$directory);
                        }
                    }
                    header('Content-Type: application/json');
                    echo json_encode($file_arr);
                }
            }else{
                if($ACCESS_FOLDER == $_POST['folder']){
                    $dir = $DIR.'/'.$ACCESS_FOLDER;
                    $file = array_diff(scandir($dir),array('.','..','.DS_Store'));
                    $file_arr = array();
                    foreach($file as $key=>$val){
                        if(is_file($dir.'/'.$val)){
                            $directory['FileName'] = $val;
                            // $directory['DateModified'] = date ("d M Y H:i",filemtime($DIR.'/'.$val));
                            $directory['DateModified'] = date ("d M Y H:i",strtotime('+7 hour',filemtime($dir.'/'.$val)));
                            $directory['Size'] = human_filesize(filesize($dir.'/'.$val));
                            $directory['Extension'] = pathinfo($dir.'/'.$val, PATHINFO_EXTENSION);
                            array_push($file_arr,$directory);
                        }
                    }
                    header('Content-Type: application/json');
                    echo json_encode($file_arr);
                }else{
                    $dir = $DIR.'/'.$_POST['folder'];
                    $file = array_diff(scandir($dir),array('.','..','.DS_Store'));
                    $file_arr = array();
                    foreach($file as $key=>$val){
                        if(is_file($dir.'/'.$val)){
                            $directory['FileName'] = $val;
                            // $directory['DateModified'] = date ("d M Y H:i",filemtime($DIR.'/'.$val));
                            $directory['DateModified'] = date ("d M Y H:i",strtotime('+7 hour',filemtime($dir.'/'.$val)));
                            $directory['Size'] = human_filesize(filesize($dir.'/'.$val));
                            $directory['Extension'] = pathinfo($dir.'/'.$val, PATHINFO_EXTENSION);
                            array_push($file_arr,$directory);
                        }
                    }
                    header('Content-Type: application/json');
                    echo json_encode($file_arr);
                }  
            }
            break;
           
    }

    function human_filesize($bytes, $decimals = 2) {
        $sz = 'BKMGTP';
        $factor = floor((strlen($bytes) - 1) / 3);
        return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . @$sz[$factor];
    }
    // $response = array();
    // for($i = 0; $i < 6; $i++){
    //     array_push($response, array("Name"=>"Songpol", "Lastname"=>"Chalermpan"));
    // }
    // header('Content-Type: application/json');
    // echo json_encode($response);
?>

