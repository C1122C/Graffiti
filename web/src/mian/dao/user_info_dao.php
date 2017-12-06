<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/22
 * Time: 1:45
 */

namespace mian\dao;


use mian\model\announce;
use mian\model\picture;

class user_info_dao
{
    var $sql;
    var $an;

    function __construct()
    {
        require_once "sql_helper.php";
        require "announce_info_dao.php";
        $this->sql=new sql_helper();
        $this->an=new announce_info_dao();
    }

    //获取基本信息
    function basic_info_inq($userid){
        $user=[];
        $query="SELECT * FROM USER WHERE ID=".$userid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $user['id']=$row['ID'];
            $user['name']=$row['NAME'];
            $user['special']=$row['SPECIAL'];
            $user['interest']=$row['INTEREST'];
            $user['location']=$row['LOCATION'];
            $user['contact']=$row['CONTACT'];
            $user['description']=$row['DESCRIPTION'];
            $user['mark']=$row['MARK'];
            $user['head']=$row['HEAD'];
        }
        return $user;
    }

    //添加用户
    function basic_info_add($id,$username,$special,$interest,$location,$contact,$description,$path){
        $this->
        $sqlstr="INSERT INTO USER (ID,NAME,SPECIALL,INTEREST,LOCATION,CONTACT,DESCRIPTION,MARK,HEAD) VALUES(".$id.",".$username.",".$special.",".$interest.",".$location.",".$contact.",".$description.",3.0,"."'./img/IMG_0004.JPG'".");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //用户信息修改
    function basic_info_mod($id,$username,$special,$interest,$location,$contact,$description){
        $sqlstr="UPDATE USER SET NAME=".$username.",SPECIAL=".$special.",INTEREST=".$interest.",LOCATION=".$location.",CONTACT=".$contact.",DESCRIPTION=".$description." WHERE ID=".$id.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    function change_mark($userid,$mark){
        $sqlstr="UPDATE USER SET MARK=".$mark." WHERE ID=".$userid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //关注查询和修改
    function follow_inq($userid,$group){
       $follow=[];
       $index=0;
       $query="SELECT FOLLOW_ID FROM FOLLOW WHERE USER_ID=".$userid." AND GROUP_NAME=".$group.";";
       $result=$this->sql->query($query);
       while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $follow[$index]=$row['FOLLOW_ID'];
            $index++;

       }
       return $follow;
    }

    function all_group($userid){
        $follow=[];
        $index=0;
        $query="SELECT DISTINCT GROUP FROM FOLLOW WHERE USER_ID=".$userid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $follow[$index]=$row['GROUP'];
            $index++;

        }
        return $follow;
    }

    function all_follow($userid){
        $follow=[];
        $index=0;
        $query="SELECT FOLLOW_ID FROM FOLLOW WHERE USER_ID=".$userid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $follow[$index]['group']=$row['FOLLOW_ID'];
            $index++;

        }
        return $follow;
    }

    function follow_add($userid_s,$userid_f,$group){
        $follow=[];
        $index=0;
        $query="SELECT GROUP_NAME FROM FOLLOW WHERE USER_ID=".$userid_s." AND FOLLOW_ID=".$userid_f.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $follow[$index]=$row['GROUP_NAME'];
            $index++;

        }
        if(count($follow)>0){
            return "ALREADY EXISTS IN GROUP ".$result[0].".";
        }
        $sqlstr="INSERT INTO FOLLOW (USER_ID,FOLLOW_ID,GROUP_NAME) VALUES (".$userid_s.",".$userid_f.",'".$group."');";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    function follow_del($userid_s,$userid_f,$group){
        $sqlstr="DELETE FROM FOLLOW WHERE USER_ID=".$userid_s." AND FOLLOW_ID=".$userid_f." AND GROUP_NAME=".$group.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //收藏查看和修改
    function collect_inq($userid){
        $collect=[];
        $index=0;
        $query="SELECT PIC_ID FROM COLLECTION WHERE USER_ID=".$userid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $collect[$index]=$row['PIC_ID'];
            $index++;

        }
        return $collect;
    }

    function collect_add($userid,$picid){
        $collect=[];
        $index=0;
        $query="SELECT * FROM COLLECTION WHERE USER_ID=".$userid." AND PIC_ID=".$picid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $collect[$index]=$row['PIC_ID'];
            $index++;

        }
        if(count($collect)>0){
            return "ALREADY EXISTS.";
        }
        $sqlstr="INSERT INTO COLLECTION VALUES(".$userid.",".$picid.");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    function collect_del($userid,$picid){
        $sqlstr="DELETE FROM COLLECTION WHERE USER_ID=".$userid." AND PIC_ID=".$picid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //发布的公告
    function own_announce_inq($userid){
        $announce=[];
        $id=[];
        $index=0;
        $query="SELECT * FROM MISSION WHERE USER_ID=".$userid." AND TYPE='OWN';";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $id[$index]=$row['ANNOUNCE_ID'];
            $index++;
        }
        $index=0;
        for($i=0;$i<count($id);$i++){
            $announce[$index]=$this->an->announce_inq($id[$i]);
            $index++;
        }
        return $announce;
    }

    //参与的公告
    function part_announce_inq($userid){
        $announce=[];
        $id=[];
        $index=0;
        $query="SELECT * FROM MISSION WHERE USER_ID=".$userid." AND TYPE='PART';";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $id[$index]=$row['ANNOUNCE_ID'];
            $index++;
        }
        $index=0;
        for($i=0;$i<count($id);$i++){
            $announce[$index]=$this->an->announce_inq($id[$i]);
            $index++;
        }
        return $announce;
    }

    //查询某一相册的图片
    function upload_inq($userid,$book){
        $upload=[];
        $index=0;
        $query="SELECT * FROM PICTURE WHERE USER_ID=".$userid." AND ALBUM_NAME=".$book.";";
        $result=$this->sql->query($query);
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
        return $upload;
    }

    //查询用户的所有图片
    function upload_inq_byid($userid){
        $picture=[];
        $index=0;
        $query="SELECT * FROM PICTURE WHERE USER_ID=".$userid.";";
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

    //管理员账号
    function adm_account(){
        $adm=[];
        $index=0;
        $query="SELECT * FROM LOGIN WHERE USER_ID<100000;";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $adm[$index]=$row['ID'];
            $index++;
        }
        return $adm;
    }

    //用户删除
    function user_del($userid_d){
        $sqlstr="DELETE FROM USER WHERE ID=".$userid_d.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //转发查询
    function transmit_inq($userid){
        $trans=[];
        $index=0;
        $query="SELECT PIC_ID FROM TRANSMIT WHERE USER_ID=".$userid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $trans[$index]=$row['PIC_ID'];
            $index++;

        }
        return $trans;
    }

    //转发添加
    function add_transmit($userid,$picid){
        $trans=[];
        $index=0;
        $query="SELECT * FROM TRANSMIT WHERE USER_ID=".$userid." AND PIC_ID=".$picid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $trans[$index]=$row['PIC_ID'];
            $index++;
        }
        if(count($trans)>0){
            return "ALREADY EXISTS.";
        }
        $sqlstr="INSERT INTO TRANSMIT (USER_ID,PIC_ID) VALUES (".$userid.",".$picid.");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //删除转发
    function del_transmit($userid,$picid){
        $sqlstr="DELETE FROM TRANSMIT WHERE USER_ID=".$userid." AND PIC_ID=".$picid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }
}