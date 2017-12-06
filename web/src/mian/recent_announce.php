<?php
require "./controller/announce_info.php";
$an=new \mian\controller\announce_info();
$res=$an->get_hot();
$index=0;
$result=[];
for($i=0;$i<count($res);$i++){
    $person=$user->basic_info_inq($res[$i]['author']);
    $result[$index]['head']=$person['head'];
    $result[$index]['author']=$person['id'];
    $result[$index]['mark']=$person['mark'];
    $result[$index]['aid']=$res[$i]['id'];
    $result[$index]['type']=$res[$i]['type'];
    $result[$index]['act']=$res[$i]['act_type'];
    $result[$index]['location']=$res[$i]['location'];
    $result[$index]['fare']=$res[$i]['fare'];
    $result[$index]['ask']=$res[$i]['ask'];
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