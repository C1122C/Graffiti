<?php
require "./controller/user_info.php";
require "./controller/picture_info.php";
require "./controller/tool.php";
$user=new \mian\controller\user_info();
$pic=new \mian\controller\picture_info();
$tool=new \mian\controller\tool();

$name=$_COOKIE['visit_name'];

$result=$user->all_follow($name);
$pics=[];
$index=0;
for($i=0;$i<count($result);$i++){
    $id=$result[$i]['id'];
    $f_pic=$user->upload_inq_idonly($id);
    for($j=0;$j<count($f_pic);$j++){
        $pics[$index]['head']=$result[$i]['head'];
        $pics[$index]['id']=$result[$i]['id'];
        $pics[$index]['name']=$result[$i]['name'];
        $pics[$index]['picid']=$f_pic[$j]['id'];
        $pics[$index]['tag']=$result[$i]['tag'];
        $pics[$index]['hot']=$result[$i]['like'];
        $pics[$index]['pic']=$result[$i]['path'];
        $pics[$index]['des']=$result[$i]['description'];
        $pics[$index]['time']=$result[$i]['date'];
        $index++;
    }
}
$my_pic=$user->upload_inq_idonly($name);
$self=$user->basic_info_inq($name);
for($k=0;$k<count($my_pic);$k++){
    $pics[$index]['head']=$self['head'];
    $pics[$index]['id']=$self['id'];
    $pics[$index]['name']=$self['name'];
    $pics[$index]['picid']=$f_pic[$k]['id'];
    $pics[$index]['tag']=$result[$k]['tag'];
    $pics[$index]['hot']=$result[$k]['like'];
    $pics[$index]['pic']=$result[$k]['path'];
    $pics[$index]['des']=$result[$k]['description'];
    $pics[$index]['time']=$result[$k]['date'];
    $index++;
}
$pics=$tool->sort_by_date($pics);

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