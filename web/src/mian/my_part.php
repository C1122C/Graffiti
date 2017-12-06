<?php
require "./controller/user_info.php";
$user=new \mian\controller\user_info();
require "./controller/announce_info.php";
$an=new \mian\controller\announce_info();

$name=$_COOKIE['visit_name'];

$result1=$user->announce_inq($name,"'OWN'");
$result2=$user->announce_inq($name,"'PART'");

$index=0;
$result=[];
$person=$user->basic_info_inq($name);
for($i=0;$i<count($result1);$i++){
    $result[$index]['head']=$person['head'];
    $result[$index]['author']=$person['id'];
    $result[$index]['mark']=$person['mark'];
    $result[$index]['id']=$result1[$i]['id'];
    $result[$index]['type']=$result1[$i]['type'];
    $result[$index]['act']=$result1[$i]['act_type'];
    $result[$index]['location']=$result1[$i]['location'];
    $result[$index]['fare']=$result1[$i]['fare'];
    $result[$index]['ask']=$result1[$i]['ask'];
    $index++;
}
for($i=0;$i<count($result2);$i++){
    $result[$index]['head']=$person['head'];
    $result[$index]['author']=$person['id'];
    $result[$index]['mark']=$person['mark'];
    $result[$index]['id']=$result1[$i]['id'];
    $result[$index]['type']=$result1[$i]['type'];
    $result[$index]['act']=$result1[$i]['act_type'];
    $result[$index]['location']=$result1[$i]['location'];
    $result[$index]['fare']=$result1[$i]['fare'];
    $result[$index]['ask']=$result1[$i]['ask'];
    $index++;
}

echo json_encode($result);
$size = ob_get_length();
header("Content-Length: $size");
header('Connection: close');
ob_end_flush();
ob_flush();
flush();
ignore_user_abort(true);
set_time_limit(0);
?>