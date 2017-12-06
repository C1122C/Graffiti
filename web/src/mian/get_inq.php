<?php
require "./controller/message_info.php";
$message=new \mian\controller\message_info();
$name=$_COOKIE['name'];
$type=$_POST['type'];
$result=$message->get_inform($name);
$res=[];
$index=0;
for($i=0;$i<count($result);$i++){
    $goon=0;
    if($type=="inq"){
        if($result[$i]['type']=="ASK"){
            $goon=1;
        }
    }
    else if($type=="inf"){
        if($result[$i]['type']=="INF"){
            $goon=1;
        }
    }
    if($goon==1){
        $person=$user->basic_info_inq($result[$i]['destination_id']);
        $res[$index]['head']=$person['head'];
        $res[$index]['pid']=$person['partner'];
        $res[$index]['pname']=$person['name'];
        $res[$index]['mid']=$result[$i]['id'];
        $res[$index]['content']=$result[$i]['content'];
        $res[$index]['isread']=$result[$i]['isread'];
    }

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