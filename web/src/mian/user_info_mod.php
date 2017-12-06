<?php
require "./controller/user_info.php";
$log=new \mian\controller\user_info();

$name = $_POST['name'];
$pwd=$_POST['pwd'];
$special=$_POST['special'];
$interest=$_POST['interest'];
$location=$_POST['location'];
$contact=$_POST['contact'];
$des=$_POST['des'];
$res=array("answer"=>"Fail");
$ressult=$log->basic_info_mod("'".$name."'",$pwd,"'".$special."'","'".$interest."'","'".$location."'","'".$contact."'","'".$des."'");
if($ressult=="FAIL"){
    $res=array("answer"=>"Fail");
}
else{
    $res=array("answer"=>"Success");
}
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