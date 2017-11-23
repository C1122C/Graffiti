<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/23
 * Time: 12:05
 */

namespace mian\controller;


use mian\dao\tag_info_dao;
use mian\dao\announce_info_dao;
use mian\model\announce;
use mian\model\announce_select;
use mian\model\comment;
use mian\model\message;
use mian\model\picture;
use mian\model\tag;
use mian\model\user;

class tag_info
{

    var $tag_dao;
    var $user_con;
    var $tool;

    function __construct()
    {
        require_once '../dao/tag_info_dao.php';
        $this->tag_dao=new tag_info_dao();
        require_once './user_info.php';
        $this->user_con=new user_info();
        require_once './tool.php';
        $this->tool=new tool();
    }

    function user_search($aid){
        $tags=$this->tag_dao->get_search_tag($aid);
        $tags=$this->tool->sort_by_date($tags);
        $result=[];
        $cursor=0;
        for($i=0;$i<count($tags)&&$i<10;$i++){
            $people=$this->tag_dao->get_by_publish($tags[$i]);
            for($j=0;$j<count($people);$j++){
                $result[$cursor]=$people[$j];
                $cursor++;
            }
        }
        array_unique($result);
        $fin=[];
        $cursor=0;
        for($k=0;$k<count($result);$k++){
            $person=$this->user_con->basic_info_inq($result[$k]);
            $fin[$cursor]=$person;
            $cursor++;
        }
        return $fin;
    }

    function tag_add($tag){
        $this->tag_dao->tag_add($tag);
    }

}