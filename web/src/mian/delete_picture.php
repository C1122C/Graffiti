<?php
$id = $_POST['picid'];
require "./controller/picture_info.php";
$pic=new \mian\controller\picture_info();
$result=$pic->picture_del($id);
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