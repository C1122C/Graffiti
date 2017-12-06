<?php
require "./controller/log_related.php";
$log=new \mian\controller\log_related();

$name = $_POST['name'];
$pwd=$_POST['pwd'];
$special=$_POST['special'];
$interest=$_POST['interest'];
$location=$_POST['location'];
$contact=$_POST['contact'];
$des=$_POST['des'];
$res=array("answer"=>"Fail");
$ressult=$log->register("'".$name."'",$pwd,"'".$special."'","'".$interest."'","'".$location."'","'".$contact."'","'".$des."'");
if($ressult=="FAIL"){
    $res=array("answer"=>"Fail");
}
else{
    $res=array("answer"=>$ressult);
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
