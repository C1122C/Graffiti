<?php
require "./controller/message_info.php";
$log=new \mian\controller\message_info();

$name=$_COOKIE['name'];

$result=$log->get_inform($name);
$inf=0;
$ask=0;
for($i=0;$i<count($result);$i++){
    if($result[$i]['type']=="ASK"){
        $ask++;
    }
    else{
        $inf++;
    }
}
$res=array("inform"=>$inf,"ask"=>$ask);

echo json_encode($res);
$size = ob_get_length();
header("Content-Length: $size");
header('Connection: close');
ob_end_flush();
ob_flush();
flush();
ignore_user_abort(true);
set_time_limit(0);
?>