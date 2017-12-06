<?php
require "./controller/picture_info.php";
$pic=new \mian\controller\picture_info();

$name=$_COOKIE['name'];
$picture=$_POST['id'];
$com=$_POST['comment'];
$comment=[];
$comment['picture']=$pic;
$comment['des']="'".$com."'";
$comment['user_id']=$name;
$comment['date']="'".time()."'";
$result=$pic->add_comment($pic,$com);

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