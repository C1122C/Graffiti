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

    //获得搜索标签
    function get_search_tag($userid){
        $tags=[];
        $index=0;
        $query="SELECT * FROM SEARCH_TAG WHERE USER_ID=".$userid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $tags[$index]['user_id']=$row['USER_ID'];
            $tags[$index]['tag']=$row['TAG'];
            $tags[$index]['date']=$row['DTM'];
            $tags[$index]['times']=$row['TIMES'];
            $index++;

        }
        return $tags;
    }

    //获得相关发布标签
    function get_by_publish($tag){
        $tags=[];
        $index=0;
        $query="SELECT * FROM PUBLISH_TAG;";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            if(strpos($row['TAG'],$tag)>=0){
                $tags[$index]['user_id']=$row['USER_ID'];
                $tags[$index]['tag']=$row['TAG'];
                $tags[$index]['date']=$row['DTM'];
                $tags[$index]['times']=$row['TIMES'];
                $index++;
            }
        }
        return $tags;
    }

    //添加搜索标签
    function search_tag_add($tag){
        $sqlstr="INSERT INTO SEARCH_TAG VALUES(".$tag['userid'].",".$tag['tag'].",".$tag['date'].",".$tag['times'].");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //添加发布标签
    function publish_tag_add($tag){
        $sqlstr="INSERT INTO PUBLISH_TAG VALUES(".$tag['userid'].",".$tag['tag'].",".$tag['date'].",".$tag['times'].");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }
}