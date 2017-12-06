<?php
$id = $_POST['aid'];
require "./controller/announce_info.php";
$an=new \mian\controller\announce_info();
$result=$an->announce_del($id);
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