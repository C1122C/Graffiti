<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/23
 * Time: 21:54
 */

namespace mian\dao;


use mian\model\tag;

class tag_info_dao
{
    var $sql;

    function __construct()
    {
        require_once "sql_helper.php";
        $this->sql=new sql_helper();
    }

    function get_search_tag($userid){
        require_once "../model/tag.php";
        $tags=[];
        $index=0;
        $query="SELECT * FROM SEARCH_TAG WHERE USER_ID=".$userid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $tag=new tag();
            $tag->userid=$row['USER_ID'];
            $tag->tag=$row['TAG'];
            $tag->date=$row['DTM'];
            $tag->times=$row['TIMES'];
            $tags[$index]=$tag;
            $index++;

        }
        return $tags;
    }

    function get_by_publish($tag){
        $tags=[];
        $index=0;
        $query="SELECT * FROM PUBLISH_TAG WHERE TAG LIKE'%".$tag."%';";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $tag=new tag();
            $tag->userid=$row['USER_ID'];
            $tag->tag=$row['TAG'];
            $tag->date=$row['DTM'];
            $tag->times=$row['TIMES'];
            $tags[$index]=$tag;
            $index++;

        }
        return $tags;
    }

    function search_tag_add($tag){
        $sqlstr="INSERT INTO SEARCH_TAG VALUES(".$tag->userid.",".$tag->tag.",".$tag->date.",".$tag->times.");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function publish_tag_add($tag){
        $sqlstr="INSERT INTO PUBLISH_TAG VALUES(".$tag->userid.",".$tag->tag.",".$tag->date.",".$tag->times.");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }
}