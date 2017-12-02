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

    function basic_info_mod($uservo){}

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

    function follow_add($userid_s,$userid_f,$group){}

    function follow_del($userid_s,$userid_f,$group){}

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

    function collect_add($userid,$picid){}

    function collect_del($userid,$picid){}

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

    function announce_add($userid,$announceid){}

    function announce_del($userid,$announceid){}

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
        return $result;
    }

    function upload_add($userid,$picid,$book){}

    function upload_del($userid,$picid){}

    function adm_account(){}

    function user_del($userid_d){}

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
    }

    function del_transmit($userid,$picid){}
}