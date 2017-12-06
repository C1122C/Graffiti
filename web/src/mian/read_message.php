<?php
require "./controller/message_info.php";
$message=new \mian\controller\message_info();

$mes=$_POST['id'];
$result=$message->change_read($mes);
$res=array("answer"=>$result);
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