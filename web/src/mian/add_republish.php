<?php
require "./controller/user_info.php";
$user=new \mian\controller\user_info();

$name=$_COOKIE['name'];
$picture=$_POST['pid'];
$result=$user->add_transmit($name,$picture);


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