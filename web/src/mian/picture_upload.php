<?php
session_start();
require "./dao/picture_info_dao.php";
$dao=new \mian\dao\picture_info_dao();
$name=$_COOKIE['name'];
$tag = $_POST['tag'];
$album = $_POST['album'];
$description = $_POST['description'];
$picture=[];

if ($_FILES["file"]["error"] > 0)
{
    echo "Return Code: " . $_FILES["file"]["error"] . "<br />";
}
else
{

    $id=$dao->get_pic_id();

    $array=$_FILES["file"]["type"];
    $array=explode("/",$array);
    $newfilename=$id."";
    $_FILES["file"]["name"]=$newfilename.".".$array[1];

    if (!is_dir("./picture/".$name))
    {
        mkdir("./picture/".$name);
    }
    $url="./picture/".$name."/";
    if (file_exists($url.$_FILES["file"]["name"]))
    {
        echo $_FILES["file"]["name"] . " already exists. ";
    }
    else
    {
        $url=$url.$newfilename;
        move_uploaded_file($_FILES["file"]["tmp_name"],$url);
        $picture['user_id']=$name;
        $picture['album']="'".$album."'";
        $picture['tag']="'".$tag."'";
        $picture['description']="'".$description."'";
        $picture['like']=0;
        $picture['date']="'".time()."'";
        $dao->picture_add($picture,$id,$url);
    }
}
?>