<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/22
 * Time: 1:45
 */

namespace mian\controller;


use mian\dao\user_info_dao;
use mian\dao\announce_info_dao;
use mian\model\announce;
use mian\model\announce_select;
use mian\model\comment;
use mian\model\message;
use mian\model\picture;
use mian\model\tag;
use mian\model\user;

class user_info
{
    var $user_dao;
    var $pic_con;
    var $announce_con;
    var $my_tool;
    var $tag_con;
    var $log_con;

    function __construct()
    {
        require_once '../dao/user_info_dao.php';
        $this->user_dao=new user_info_dao();
        require_once './picture_info.php';
        $this->pic_con=new picture_info();
        require_once './announce_info.php';
        $this->announce_con=new announce_info();
        require_once './tool.php';
        $this->my_tool=new tool();
        require_once './tag_info.php';
        $this->tag_con=new tag_info();
        require_once './log_related.php';
        $this->log_con=new log_related();
    }

    function basic_info_inq($userid){
        $user=$this->user_dao->basic_info_inq($userid);
        return $user;
    }

    function basic_info_mod($id,$username,$special,$interest,$location,$contact,$description){
        return $this->user_dao->basic_info_mod($id,$username,$special,$interest,$location,$contact,$description);
    }

    function basic_info_add($id,$username,$special,$interest,$location,$contact,$description,$head){
        $path=$this->pic_con->head_save($head,$id);
        return $this->user_dao->basic_info_add($id,$username,$special,$interest,$location,$contact,$description,$path);
    }

    function head_mod($userid,$head){
        $path=$this->pic_con->head_mod($head,$userid);
        return $this->user_dao->head_mod($path,$userid);
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
            $this->pic_con->add_like($picid);
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

    function announce_inq($userid,$type){
        if($type=="own"){
            $tempstr=$this->user_dao->own_announce_inq($userid);
        }
        else{
            $tempstr=$this->user_dao->part_announce_inq($userid);
        }

        $mission=array();
        for($i=0;$i<count($tempstr);$i++){
            $mis=$this->mission_con->announce_inq($tempstr[$i]->id);
            $mis->mark=$tempstr[$i]->mark;
            $mis->marked=$tempstr[$i]->marked;
            $mission[$i]=$mis;
        }
        $result=$this->my_tool->sort_by_date($mission);
        return $result;
    }


    function upload_inq($userid,$book){
        $tempstr=$this->user_dao->upload_inq($userid,$book);
        return $tempstr;
    }

    function upload_inq_idonly($userid){
        return $this->user_dao->upload_inq_byid($userid);
    }


    function transmit_inq($userid){
        $tempstr=$this->user_dao->transmit_inq($userid);
        $mission=array();
        for($i=0;$i<count($tempstr);$i++){
            $mis=$this->pic_con->picture_inq($tempstr[$i]);
            $mission[$i]=$mis;
        }
        $result=$this->my_tool->sort_by_date($mission);
        return $result;
    }

    function add_transmit($userid,$picid){
        return $this->user_dao->add_transmit($userid,$picid);
    }

    function del_transmit($userid,$picid){
        $tempstr=$this->user_dao->transmit_inq($userid);
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
            return $this->user_dao->del_transmit($userid,$picid);
        }
    }



    function user_search($userid){
        return $this->tag_con->user_search($userid);
    }

    function user_del($userid_s,$userid_d){
        $account=$this->user_dao->adm_account();
        $can=false;
        for($i=0;$i<count($account);$i++){
            if($account[$i]==$userid_s);
            $can=true;
            break;
        }
        if($can){
            $result = $this->user_dao->user_del($userid_d);
            if($result=="SUCCESSFUL"){
                return $this->log_con->del_account($userid_d);
            }
        }
        else{
            return false;
        }
    }
}