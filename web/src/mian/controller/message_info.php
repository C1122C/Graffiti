<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/23
 * Time: 13:47
 */

namespace mian\controller;


use mian\dao\message_info_dao;
use mian\model\message;
use mian\dao\announce_info_dao;
use mian\model\announce;
use mian\model\announce_select;
use mian\model\comment;
use mian\model\picture;
use mian\model\tag;
use mian\model\user;

class message_info
{
    var $message;
    var $announce_con;
    var $user_con;
    var $message_dao;
    var $tool;

    function __construct()
    {
        require_once '../model/message.php';
        $this->message=new message();
        require_once './announce_info.php';
        $this->announce_con=new announce_info();
        require_once './user_info.php';
        $this->user_con=new user_info();
        require_once '../dao/message_info_dao.php';
        $this->message_dao=new message_info_dao();
        require_once './tool.php';
        $this->tool=new tool();
    }

    function part_done_inform($userid,$a){
        $aid=$this->get_inf($a);
        $aid['type']="'INF'";
        $part=$aid['partner'];
        $aid['partner']=$aid['destination_id'];
        $aid['destination_id']=$part;
        $a_name=$this->user_con->basic_info_inq($aid['partner'])['name'];
        $a_contact=$this->user_con->basic_info_inq($aid['partner'])['contact'];
        $aid['content']="'".$a_name."已同意您的揭榜，请通过：".$a_contact." 联系他。"."'";
        $aid['isread']=0;
        $aid['date']="'".time()."'";
        return $this->inform($this->message);
    }

    function inform($info){
        return $this->message_dao->add_info($info->to,$info);
    }

    function change_read($mid){
        return $this->message_dao->change_read($mid);
    }

    function get_inf($mid){
        return $this->get_inf($mid);
    }

    function get_inform($userid){
        $all=$this->message_dao->get_info($userid);
        $result=$this->tool->sort_by_date($all);
        return $result;
    }

}