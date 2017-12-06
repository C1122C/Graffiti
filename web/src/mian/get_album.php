<?php
require "./controller/picture_info.php";
$pic=new \mian\controller\picture_info();

$name=$_COOKIE['name'];

$result=$pic->get_album($name);

echo json_encode($result);
$size = ob_get_length();
header("Content-Length: $size");
header('Connection: close');
ob_end_flush();
ob_flush();
flush();
ignore_user_abort(true);
set_time_limit(0);
?>