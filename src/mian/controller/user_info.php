<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/22
 * Time: 1:45
 */

namespace mian\controller;


use mian\dao\user_info_dao;

class user_info
{
    var $user_dao;
    var $pic_con;

    function __construct()
    {
        require_once '../dao/user_info_dao.php';
        $this->user_dao=new user_info_dao();
        require_once './picture_info.php';
        $this->pic_con=new picture_info();
    }

    function basic_info_inq($userid){
        $user=$this->user_dao->basic_info_inq($userid);
        return $user;
    }

    function basic_info_mod($uservo){
        $this->user_dao->basic_info_mod($uservo);
    }

    function follow_inq($userid,$group){
        $tempstr=$this->user_dao->follow_inq($userid,$group);
        $follow=array();
        for($i=0;$i<count($tempstr);$i++){
            $user=$this->user_dao->basic_info_inq($tempstr[$i]);
            $follow[$i]=$user;
        }
        return $follow;
    }

    function follow_add($userid_s,$userid_f,$group){
        $tempstr=$this->user_dao->follow_inq($userid_s);
        $already=false;
        for($i=0;$i<count($tempstr);$i++){
            if($tempstr[$i]==$userid_f){
                $already=true;
                break;
            }
        }
        if($already==true){
            return false;
        }
        else{
            $this->user_dao->follow_add($userid_s,$userid_f,$group);
            return true;
        }
    }

    function follow_del($userid_s,$userid_f,$group){
        $tempstr=$this->user_dao->follow_inq($userid_s,$group);
        $have=false;
        for($i=0;$i<count($tempstr);$i++){
            if($tempstr[$i]==$userid_f){
                $have=true;
                break;
            }
        }
        if($have==true){
            $this->user_dao->follow_del($userid_s,$userid_f,$group);
            return true;
        }
        else{
            return false;
        }
    }

    function collect_inq($userid){
        $tempstr=$this->user_dao->collect_inq($userid);
        $collect=array();
        for($i=0;$i<count($tempstr);$i++){
            $pic=$this->pic_con->picture_inq($tempstr[$i]);
            $collect[$i]=$pic;
        }
        return $collect;
    }

    function collect_add($userid,$picid){
        $tempstr=$this->user_dao->collect_inq($userid);
        $have=false;
        for($i=0;$i<count($tempstr);$i++){
            if($tempstr[$i]==$picid){
                $have=true;
                break;
            }
        }
        if($have==true){
            return false;
        }
        else{
            $this->user_dao->collect_add($userid,$picid);
            return true;
        }
    }

    function collect_del($userid,$picid){
        $tempstr=$this->user_dao->collect_inq($userid);
        $have=false;
        for($i=0;$i<count($tempstr);$i++){
            if($tempstr[$i]==$picid){
                $have=true;
                break;
            }
        }
        if($have==false){
            return false;
        }
        else{
            $this->user_dao->collect_del($userid,$picid);
            return true;
        }
    }

    function comment_inq($userid){}

    function mission_inq($userid){}

    function user_search($uservo){}

    function user_del($userid_s,$userid_d){}
}