<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/23
 * Time: 12:24
 */

namespace mian\dao;


use mian\model\comment;

class picture_info_dao
{
    var $sql;

    function __construct()
    {
        require_once "sql_helper.php";
        $this->sql=new sql_helper();
    }

    function picture_inq($p_id){
        $picture=[];
        $index=0;
        $query="SELECT * FROM PICTURE WHERE ID=".$p_id.";";
        $result=$this->sql->query($query);
        require_once "../model/picture.php";
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $pic=new picture();
            $pic->id=$row['ID'];
            $pic->pic=$row['PATH'];
            $pic->author=$row['USER_ID'];
            $pic->tag=$row['TAG'];
            $pic->description=$row['DESCRIPTION'];
            $pic->like-$row['LIKE'];
            $pic->date=$row['DTM'];
            $pic->album=$row['ALBUM'];
            $picture[$index]=$pic;
            $index++;
        }
        return $picture;
    }

    function picture_add($picture){
        $id=$this->get_pic_id();
        $path=$this->save_picture_infile($picture);
        $sqlstr="INSERT INTO PICTURE VALUES(".$id.",".$picture->author.",'".$picture->album."',".$picture->date.",'".$path."',".$picture->tag.",'".$picture->description."',0);";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function picture_del($picid){
        $sqlstr="DROP FROM PICTURE WHERE ID=".$picid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            $sqlstr="DROP FROM COLLECTION WHERE PIC_ID=".$picid.";";
            $ret = $this->sql->exec($sqlstr);
            if($ret){
                $sqlstr="DROP FROM COMMENT WHERE PIC_ID=".$picid.";";
                $ret = $this->sql->exec($sqlstr);
                if($ret){
                    return "SUCCESSFUL";
                }
            }
            return "FAIL";
        }
    }

    function all_pic(){
        $picture=[];
        $index=0;
        $query="SELECT * FROM PICTURE;";
        $result=$this->sql->query($query);
        require_once "../model/picture.php";
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $pic=new picture();
            $pic->id=$row['ID'];
            $pic->pic=$row['PATH'];
            $pic->author=$row['USER_ID'];
            $pic->tag=$row['TAG'];
            $pic->description=$row['DESCRIPTION'];
            $pic->like-$row['LIKE'];
            $pic->date=$row['DTM'];
            $pic->album=$row['ALBUM'];
            $picture[$index]=$pic;
            $index++;
        }
        return $picture;
    }

    function add_like($picid){
        $query="SELECT * FROM PICTURE WHERE ID=".$picid.";";
        $result=$this->sql->query($query);
        $original=0;
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $original=$row['LIKE'];
        }
        $original++;
        $sqlstr="UPDATE PICTURE SET LIKE=".$original." WHERE ID=".$picid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function add_comment($pic,$com){
        $sqlstr="INSERT INTO COMMENT VALUES(".$pic.",".$com->author.",".$com->des.",".$com->date.");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function comment_inq($pic){
        $comment=[];
        $index=0;
        $query="SELECT * FROM COMMENT WHERE PIC_ID=".$pic.";";
        $result=$this->sql->query($query);
        require_once "../model/comment.php";
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $com=new comment();
            $com->picture=$row['PIC_ID'];
            $com->date=$row['DTM'];
            $com->author=$row['USER_ID'];
            $com->des=$row['DESCRIPTION'];
            $comment[$index]=$com;
            $index++;
        }
        return $comment;
    }

    function get_pic_id(){
        $query="SELECT * FROM NEW_ID;";
        $id="";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
           $id=$row['PIC'];
        }
        return $id;
    }

    function album_del($userid,$alid){
        $sqlstr="SELECT * FROM PICTURE WHERE USER_ID=".$userid." AND ALBUM_NAME=".$alid.";";
        $id=[];
        $index=0;
        $result=$this->sql->query($sqlstr);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $id[$index]=$row['ID'];
            $index++;
        }
        for($i=0;$i<count($id);$i++){
            $res=$this->picture_del($id[$i]);
            if($res=="FAIL"){
                return $res;
            }
        }
        return "SUCCESSFUL";
    }

    function save_picture_infile($pic){
        $uploaddir = "..../picture/";
        $type=array("jpg","gif","bmp","jpeg","png");

    }

    function head_save($head,$userid){}

    function head_mod($head,$userid){}
}