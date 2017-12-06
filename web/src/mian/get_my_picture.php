<?php
require "./controller/user_info.php";
$user=new \mian\controller\user_info();

$name=$_COOKIE['name'];
$album = $_POST['album'];
$my_pic=$user->upload_inq($name,$album);
$self=$user->basic_info_inq($name);
for($k=0;$k<count($my_pic);$k++){
    $pics[$index]['head']=$self['head'];
    $pics[$index]['id']=$self['id'];
    $pics[$index]['name']=$self['name'];
    $pics[$index]['picid']=$my_pic[$k]['id'];
    $pics[$index]['tag']=$my_pic[$k]['tag'];
    $pics[$index]['hot']=$my_pic[$k]['like'];
    $pics[$index]['pic']=$my_pic[$k]['path'];
    $pics[$index]['des']=$my_pic[$k]['description'];
    $pics[$index]['time']=$my_pic[$k]['date'];
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