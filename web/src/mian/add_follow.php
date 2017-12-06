<?php
require "./controller/user_info.php";
$user=new \mian\controller\user_info();

$name=$_COOKIE['name'];
$follow=$_POST['id'];
$group=$_POST['group'];

$result=$user->follow_add($name,$follow,$group);

$res=array("answer"=>$result);
echo json_encode($re);
$size = ob_get_length();
header("Content-Length: $size");
header('Connection: close');
ob_end_flush();
ob_flush();
flush();
ignore_user_abort(true);
set_time_limit(0);
?>