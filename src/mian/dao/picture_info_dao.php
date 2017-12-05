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

    //根据ID查询图片，已测试
    function picture_inq($p_id){
        $picture=[];
        $index=0;
        $query="SELECT * FROM PICTURE WHERE ID=".$p_id.";";
        $result=$this->sql->query($query);
        require_once "../model/picture.php";
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $picture[$index]['id']=$row['ID'];
            $picture[$index]['path']=$row['PATH'];
            $picture[$index]['user_id']=$row['USER_ID'];
            $picture[$index]['tag']=$row['TAG'];
            $picture[$index]['description']=$row['DESCRIPTION'];
            $picture[$index]['like']=$row['LIKE'];
            $picture[$index]['date']=$row['DTM'];
            $picture[$index]['album']=$row['ALBUM'];
            $index++;
        }
        return $picture;
    }

    //添加图片
    function picture_add($picture){
        $id=$this->get_pic_id();
        $path=$this->save_picture_infile($picture['pic'],$id,$picture['user_id']);
        $path="'".$path."'";
        $sqlstr="INSERT INTO PICTURE (ID,USERID,ALBUM,PATH,TAG,DESCRIPTION,LIKE,DTM) VALUES(".$id.",".$picture['user_id'].",".$picture['album'].",".$path.",".$picture['tag'].",".$picture['description'].",0,".$picture['date'].");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //删除图片
    function picture_del($picid){
        $sqlstr="DELETE FROM PICTURE WHERE ID=".$picid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            $sqlstr="DELETE FROM COLLECTION WHERE PIC_ID=".$picid.";";
            $ret = $this->sql->exec($sqlstr);
            if($ret){
                $sqlstr="DELETE FROM COMMENT WHERE PIC_ID=".$picid.";";
                $ret = $this->sql->exec($sqlstr);
                if($ret){
                    return "SUCCESS";
                }
            }
            return "FAIL";
        }
    }

    //获取所有图片
    function all_pic(){
        $picture=[];
        $index=0;
        $query="SELECT * FROM PICTURE;";
        $result=$this->sql->query($query);
        require_once "../model/picture.php";
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $picture[$index]['id']=$row['ID'];
            $picture[$index]['path']=$row['PATH'];
            $picture[$index]['user_id']=$row['USER_ID'];
            $picture[$index]['tag']=$row['TAG'];
            $picture[$index]['description']=$row['DESCRIPTION'];
            $picture[$index]['like']=$row['LIKE'];
            $picture[$index]['date']=$row['DTM'];
            $picture[$index]['album']=$row['ALBUM'];
            $index++;
        }
        return $picture;
    }

    //点赞
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
            return "SUCCESS";
        }
    }

    //评论
    function add_comment($pic,$com){
        $sqlstr="INSERT INTO COMMENT (PIC_ID,USER_ID,DES,DTM) VALUES (".$pic.",".$com['user_id'].",".$com['des'].",".$com['date'].");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //查看评论
    function comment_inq($pic){
        $comment=[];
        $index=0;
        $query="SELECT * FROM COMMENT WHERE PIC_ID=".$pic.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $comment[$index]['pic_id']=$row['PIC_ID'];
            $comment[$index]['date']=$row['DTM'];
            $comment[$index]['user_id']=$row['USER_ID'];
            $comment[$index]['des']=$row['DES'];
            $index++;
        }
        return $comment;
    }

    //获取新的图片ID
    function get_pic_id(){
        $query="SELECT * FROM NEW_ID;";
        $id="";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
           $id=$row['PIC'];
        }
        $newid=$id+1;
        $up="UPDATE NEW_ID SET PIC=".$newid.";";
        $ret = $this->sql->exec($up);
        return $id;
    }

    //删除相册
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
        $sqlstr="DELETE FROM ALBUM WHERE USER_ID=".$userid." AND ALBUM=".$alid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret) {
            return "FAIL";
        }
        return "SUCCESS";
    }

    //获取用户相册
    function get_album($userid){
        $album=[];
        $index=0;
        $query="SELECT * FROM ALBUM WHERE USER_ID=".$userid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ) {
            $album[$index] = $row['ALBUM'];
        }
        return $album;
    }

    //添加用户相册
    function add_album($userid,$name){
        $sqlstr="INSERT INTO ALBUM (USER_ID,ALBUM) VALUES(".$userid.",".$name.");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //保存图片
    function save_picture_infile($pic,$pid,$user_id){
        $uploaddir = "..../web/picture/";
        do
        {
            $uploadfile=$uploaddir.$pid.".jpg";
        }
        while(file_exists($uploadfile));

        if (move_uploaded_file($_FILES['file']['tmp_name'],$uploadfile))
        {
            if(!is_uploaded_file($_FILES['file']['tmp_name']))
            {
                return $uploadfile;
            }
        }

    }

}