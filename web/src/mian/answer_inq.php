<?php
require "./controller/message_info.php";
require "./controller/user_info.php";
$message=new \mian\controller\message_info();
$user=new \mian\controller\user_info();

$mes=$_POST['id'];
$ans=$_POST['answer'];

if($act==1){
    $aid=$message->get_inf($mes);
    $aid['type']="'INF'";
    $part=$aid['partner'];
    $aid['partner']=$name;
    $aid['destination_id']=$part;
    $a_name=$user->basic_info_inq($name)['name'];
    $a_contact=$user->basic_info_inq($name)['contact'];
    $aid['content']="'".$a_name."已同意您的揭榜，请通过：".$a_contact." 联系他。"."'";
    $aid['isread']=0;
    $aid['date']="'".time()."'";
    $result=$message->inform($aid);
}
else{
    $aid=$message->get_inf($mes);
    $aid['type']="'INF'";
    $part=$aid['partner'];
    $aid['partner']=$name;
    $aid['destination_id']=$part;
    $a_name=$user->basic_info_inq($name)['name'];
    $aid['content']="'".$a_name."拒绝了您的揭榜。"."'";
    $aid['isread']=0;
    $aid['date']="'".time()."'";
    $result=$message->inform($aid);
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