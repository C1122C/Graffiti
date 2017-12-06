<?php
require "./controller/user_info.php";
require "./controller/picture_info.php";
$user=new \mian\controller\user_info();
$pic=new \mian\controller\picture_info();

$name=$_COOKIE['name'];
$picture=$_POST['id'];
$act=$_POST['act'];

if($act=="up"){
    $result=$user->collect_add($name,$picture);
    if($result=="SUCCESS"){
        $result=$pic->add_like($picture);
    }
}
else{
    $result=$user->collect_del($name,$picture);
}

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