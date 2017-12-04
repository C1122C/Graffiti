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
        if(count($tags)>20){
            $tags=array_slice($tags,0,20);
        }
        $tags=$this->tool->sort_by_times($tags);
        if(count($tags)>10){
            $tags=array_slice($tags,0,10);
        }
        $peo=[];
        $cursor=0;
        for($i=0;$i<count($tags)&&$i<10;$i++){
            $people=$this->tag_dao->get_by_publish($tags[$i]->tag);
            for($j=0;$j<count($people);$j++){
                $peo[$cursor]=$people[$j];
                $cursor++;
            }
        }
        $peo=$this->tool->sort_by_date($peo);
        if(count($peo)>20){
            $peo=array_slice($peo,0,20);
        }
        $peo=$this->tool->sort_by_times($peo);
        if(count($peo)>10){
            $peo=array_slice($peo,0,10);
        }
        $cursor=0;
        $result=[];
        for($i=0;$i<count($peo);$i++){
            $result[$cursor]=$peo[$i];
            $cursor++;
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

    function search_tag_add($tag){
        $this->tag_dao->search_tag_add($tag);
    }

    function publish_tag_add($tag){
        $this->tag_dao->publish_tag_add($tag);
    }

}