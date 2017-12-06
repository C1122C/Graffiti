<?php
require "./controller/log_related.php";
$log=new \mian\controller\log_related();

$name = $_POST['id'];
$password = $_POST['pwd'];
$result=$log->login_check($name,$password);
$res=array("answer"=>"Fail");
if($result==true){
    setcookie('name',$name,time()+3600);
    setcookie('password',$password,time()+3600);
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