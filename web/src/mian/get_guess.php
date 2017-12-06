<?php
require "./controller/tag_info.php";

$tag=new \mian\controller\tag_info();


$name=$_COOKIE['name'];
$result=$tag->user_search($name);

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