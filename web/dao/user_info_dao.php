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

    function __construct()
    {
        require_once "sql_helper.php";
        $this->sql=new sql_helper();
    }

    function basic_info_inq($userid){
        require_once "../model/user.php";
        $user=new user();
        $query="SELECT * FROM USER WHERE ID=".$userid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $user->id=$row['ID'];
            $user->name=$row['NAME'];
            $user->special=$row['SPECIAL'];
            $user->interest=$row['INTEREST'];
            $user->location=$row['LOCATION'];
            $user->contact=$row['CONTACT'];
            $user->description=$row['DESCRIPTION'];
            $user->mark=$row['MARK'];
            $user->head=$row['HEAD'];
        }
        return $user;
    }

    function basic_info_add($id,$username,$special,$interest,$location,$contact,$description,$path){
        $this->
        $sqlstr="INSERT INTO USER VALUES(".$id.",".$username.",".$special.",".$interest.",".$location.",".$contact.",".$description.",3.0,".$path.");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function basic_info_mod($id,$username,$special,$interest,$location,$contact,$description){
        $sqlstr="UPDATE USER SET NAME=".$username.",SPECIAL=".$special.",INTEREST=".$interest.",LOCATION=".$location.",CONTACT=".$contact.",DESCRIPTION=".$description." WHERE ID=".$id.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function head_mod($path,$id){
        $sqlstr="UPDATE USER SET HEAD=".$path." WHERE ID=".$id.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

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
        $sqlstr="INSERT INTO FOLLOW VALUES(".$userid_s.",".$userid_f.",'".$group."');";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function follow_del($userid_s,$userid_f,$group){
        $sqlstr="DROP FROM FOLLOW WHERE USER_ID=".$userid_s." AND FOLLOW_ID=".$userid_f." AND GROUP_NAME='".$group.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

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
            return "SUCCESSFUL";
        }
    }

    function collect_del($userid,$picid){
        $sqlstr="DROP FROM COLLECTION WHERE USER_ID=".$userid." AND PIC_ID=".$picid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function own_announce_inq($userid){
        require_once "../model/announce.php";
        $announce=[];
        $index=0;
        $query="SELECT * FROM MISSION WHERE USER_ID=".$userid." AND TYPE='OWN';";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $an=new announce();
            $an->partner=$row['USER_ID'];
            $an->id=$row['ANNOUNCE_ID'];
            $an->mark=$row['MARK'];
            $an->marked=$row['MARKED'];
            $announce[$index]=$an;
            $index++;

        }
        return $announce;
    }

    function part_announce_inq($userid){
        require_once "../model/announce.php";
        $announce=[];
        $index=0;
        $query="SELECT * FROM MISSION WHERE USER_ID=".$userid." AND TYPE='PART';";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $an=new announce();
            $an->partner=$row['USER_ID'];
            $an->id=$row['ANNOUNCE_ID'];
            $an->mark=$row['MARK'];
            $an->marked=$row['MARKED'];
            $announce[$index]=$an;
            $index++;

        }
        return $announce;
    }


    function upload_inq($userid,$book){
        $upload=[];
        $index=0;
        $query="SELECT * FROM PICTURE WHERE USER_ID=".$userid." AND ALBUM_NAME=".$book.";";
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
            $upload[$index]=$pic;
            $index++;
        }
        return $upload;
    }

    function upload_inq_byid($userid){
        $upload=[];
        $index=0;
        $query="SELECT * FROM PICTURE WHERE USER_ID=".$userid.";";
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
            $upload[$index]=$pic;
            $index++;
        }
        return $upload;
    }

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

    function user_del($userid_d){
        $sqlstr="DROP FROM USER WHERE ID=".$userid_d.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

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
        $sqlstr="INSERT INTO TRANSMIT VALUES(".$userid.",".$picid.");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function del_transmit($userid,$picid){
        $sqlstr="DROP FROM TRANSMIT WHERE USER_ID=".$userid." AND PIC_ID=".$picid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }
}