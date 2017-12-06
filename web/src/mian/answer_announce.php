<?php
require "./controller/announce_info.php";
require "./controller/message_info.php";
$announce=new \mian\controller\announce_info();
$message=new \mian\controller\message_info();

$name=$_COOKIE['name'];
$id=$_POST['aid'];

$result=$announce->announce_part($name,$id);
$new_mes=[];
if($result=="SUCCESS"){
    $a=$announce->announce_inq($id);
    $new_mes['type']="'ASK'";
    $new_mes['partner']=$name;
    $new_mes['destination_id']=$a['author'];
    $a_name=$user->basic_info_inq($name)['name'];
    $aid['content']="'".$a_name."请求揭榜您的公告。"."'";
    $aid['isread']=0;
    $aid['date']="'".time()."'";
    $result=$message->inform($aid);
}
?>