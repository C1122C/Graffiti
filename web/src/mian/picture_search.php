<?php
require "./controller/picture_info.php";
require  "./controller/user_info.php";
$user=new \mian\controller\user_info();
$pic=new \mian\controller\picture_info();
$key = $_POST['key'];

$result=$pic->picture_search_key($key);
$res=[];
$index=0;
for($i=0;$i<count($result);$i++){
    $person=$user->basic_info_inq($result[$i]['user_id']);
    $res[$index]['head']=$person['head'];
    $res[$index]['id']=$person['id'];
    $res[$index]['name']=$person['name'];
    $res[$index]['picid']=$result[$i]['id'];
    $res[$index]['hot']=$result[$i]['like'];
    $res[$index]['pic']=$result[$i]['path'];
    $res[$index]['des']=$result[$i]['description'];
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