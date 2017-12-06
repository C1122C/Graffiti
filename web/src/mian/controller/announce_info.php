<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/22
 * Time: 14:54
 */

namespace mian\controller;


use mian\dao\announce_info_dao;
use mian\model\announce;
use mian\model\announce_select;
use mian\model\comment;
use mian\model\message;
use mian\model\picture;
use mian\model\tag;
use mian\model\user;


class announce_info
{
    var $announce_dao;
    var $user_con;
    var $message_con;
    var $tool;

    function __construct()
    {
        require '../dao/announce_info_dao.php';
        $this->announce_dao=new announce_info_dao();
        require './user_info.php';
        $this->user_con=new user_info();
        require './message_info.php';
        $this->message_con=new message_info();
        require "./tool.php";
        $this->tool=new tool();
    }

    function get_hot(){
        $all=$this->announce_dao->all_announce();
        if(count($all)<=20){
            return $all;
        }
        $all=$this->tool->sort_by_date($all);
        $result=[];
        for($i=0;$i<=20;$i++){
            $result[$i]=$all[$i];
        }
        return $result;
    }

    function announce_inq($aid){
        $result=$this->announce_dao->announce_inq($aid);
        return $result;
    }

    function announce_del($aid){
        return $this->announce_dao->announce_del($aid);
    }

    function announce_add($announce){
        return $result=$this->announce_dao->announce_add($announce);
    }

    function announce_part($userid,$aid){
        return $this->announce_dao->announce_part($userid,$aid,"'PART'");
    }

    function mark_mission($userid,$aid,$mark){
        return $this->announce_dao->mark_mission($userid,$aid,$mark);
    }

    function get_mission_partner($aid){
        return $this->announce_dao->get_mission_partner($aid);
    }

    function announce_search($announce){
        if($announce['ask']==""){
            $list=$this->announce_dao->all_announce();
        }
        else{
            $list=$this->announce_dao->match_ask($announce['ask']);
        }

        $result=[];
        $cursor=0;
        for($i=0;$i<count($list);$i++){
            if($list[$i]['type']!=$announce['type']){
                continue;
            }
            else if($list[$i]['act_type']!=$announce['act_type']){
                continue;
            }
            else if($list[$i]['location']!=$announce['location']){
                continue;
            }
            else if($announce['up_fare']!=0||$announce['down_fare']!=0){
                if($announce['up_fare']<$list[$i]['fare']||$announce['down_fare']>$list[$i]['fare']){
                    continue;
                }
            }

            if($announce['up_mark']!=0||$announce['down_mark']!=0){
                $id=$list[$i]['author'];
                $mark=$this->user_con->basic_info_inq($id)['mark'];
                if($announce['up_mark']<$mark||$announce['down_mark']>$mark){
                    continue;
                }
            }
            $result[$cursor]=$list[$i];
            $cursor++;
        }
        return $result;
    }
}