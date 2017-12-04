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

    function __construct()
    {
        require_once '../dao/announce_info_dao.php';
        $this->announce_dao=new announce_info_dao();
        require_once './user_info.php';
        $this->user_con=new user_info();
        require_once './message_info.php';
        $this->message_con=new message_info();
    }

    function announce_inq($aid){
        $result=$this->announce_dao->announce_inq($aid);
        return $result;
    }

    function announce_del($userid,$aid){
        $result=$this->user_con->announce_del($userid,$aid);
        if($result){
            return $this->announce_dao->announce_del($aid);
        }
        return false;
    }

    function announce_add($userid,$announce){
        $result=$this->announce_dao->announce_add($announce);
        if($result!=null){
            return $this->user_con->announce_add($userid,$result);
        }
        return false;
    }

    function announce_part($userid,$aid){
        $result=$this->announce_dao->announce_part($userid,$aid);
        if($result){
            $this->message_con->part_done_inform($userid,$aid);
        }
    }

    function announce_search($announce){
        if($announce->ask==""){
            $list=$this->announce_dao->all_announce();
        }
        else{
            $list=$this->announce_dao->match_ask($announce->ask);
        }

        $result=[];
        $cursor=0;
        for($i=0;$i<count($list);$i++){
            if($list[$i]->announceType!=$announce->announceType){
                continue;
            }
            else if($list[$i]->activityType!=$announce->activityType){
                continue;
            }
            else if($announce->up_fare!=0||$announce->down_fare!=0){
                if($announce->up_fare<$list[$i]->fare||$announce->down_fare>$list[$i]->fare){
                    continue;
                }
            }

            if($announce->up_mark!=0||$announce->down_mark!=0){
                if($announce->up_mark<$list[$i]->anthor->mark||$announce->down_mark>$list[$i]->author->mark){
                    continue;
                }
            }
            $result[$cursor]=$list[$i];
            $cursor++;
        }
        return $result;
    }
}