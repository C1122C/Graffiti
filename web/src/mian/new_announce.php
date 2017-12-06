<?php
require "./controller/announce_info.php";
$announce=new \mian\controller\announce_info();

$an=[];
$type = $_POST['type'];
$act = $_POST['act_type'];
$ask = $_POST['ask'];
$location = $_POST['location'];
$fare = $_POST['fare'];
$mark = $_POST['mark'];
$name=$_COOKIE['name'];
$an['type']="'".$type."'";
$an['author']=$author;
$an['state']="'WAITING'";
$an['act_type']="'".$act_type."'";
$an['location']="'".$location."'";
$an['fare']=$fare;
$an['ask']=$ask;
$an['date']="'".time()."'";
$result=$announce->announce_add($an);
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