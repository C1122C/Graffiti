<?php
require "./controller/user_info.php";
require "./controller/announce_info.php";
$user=new \mian\controller\user_info();
$announce=new \mian\controller\announce_info();

$name=$_COOKIE['name'];
$id=$_POST['aid'];
$mark=$_POST['mark'];

$result=$announce->mark_mission($name,$id,$mark);
if($result=="SUCCESS"){
    $partner=$announce->get_mission_partner($id);
    for($i=0;$i<count($partner);$i++){
        if($partner[$i]!=$name){
            $original=$user->basic_info_inq($partner[$i])['mark'];
            $original=$original*0.8+$mark*0.2;
            $user->change_mark($partner[$i],$original);
        }

    }
}
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