<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/22
 * Time: 2:20
 */

namespace mian\controller;


use mian\dao\picture_info_dao;
use mian\dao\announce_info_dao;
use mian\model\announce;
use mian\model\announce_select;
use mian\model\comment;
use mian\model\message;
use mian\model\picture;
use mian\model\tag;
use mian\model\user;

class picture_info
{
    var $picture_dao;
    var $user_con;

    function __construct()
    {
        require_once '../dao/picture_info_dao.php';
        $this->picture_dao=new picture_info_dao();
        require_once './user_info.php';
        $this->user_con=new user_info();
    }

    function picture_inq($p_id){
        return $this->picture_dao->picture_inq($p_id);
    }

    function picture_add($picture){
        $id=$this->picture_dao->picture_add($picture);
        if($id!=null){
            return $this->user_con->upload_add($picture->author,$id,$picture->album);
        }
        return false;
    }

    function picture_del($userid,$picid){
        return $this->picture_dao->picture_del($picid);
    }

    function picture_search_key($key){
        $allkey=[];
        $cursor=0;
        $token=strtok($key,"，");
        while($token!=false){
            $allkey[$cursor]=$token;
            $cursor++;
            $token=strtok("，");
        }

        $all=$this->picture_dao->all_pic();
        $result=[];
        $cursor=0;
        for($i=0;$i<count($all);$i++){
            $pic=$all[$i];
            for($j=0;$j<count($allkey);$j++){
                $kn=$allkey[$j];
                if(stripos($pic->tag,$kn)!=false||stripos($pic->description,$kn)!=false){
                    $result[$cursor]=$pic;
                    $cursor++;
                    break;
                }
            }
        }
        return $result;
    }


    function picture_del_album($userid,$alid){
        return $this->picture_dao->album_del($userid,$alid);
    }

    function add_like($picid){
        return $this->picture_dao->add_like($picid);
    }

    function add_comment($pic,$com){
        return $this->picture_dao->add_comment($pic,$com);
    }

    function comment_inq($pic){
        return $this->picture_dao->comment_inq($pic);
    }

    function head_save($head,$userid){}

    function head_mod($head,$userid){}

}