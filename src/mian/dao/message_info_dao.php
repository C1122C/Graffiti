<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/23
 * Time: 20:46
 */

namespace mian\dao;


use mian\model\message;

class message_info_dao
{
    var $sql;

    function __construct()
    {
        require_once "sql_helper.php";
        $this->sql=new sql_helper();
    }

    //添加消息，已测试
    function add_info($userid,$info){
        $id=$this->get_message_id();
        $sqlstr="INSERT INTO MESSAGE (ID,TYPE,PARTNER_ID,DESTINATION_ID,CONTENT,ISREAD,DTM) VALUES(".$id.",".$info['type'].",".$info['partner'].",".$userid.",".$info['content'].",0,".$info['date'].");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //改变消息状态为已读
    function change_read($mid){
        $sqlstr="UPDATE MESSAGE SET ISREAD=1 WHERE ID=".$mid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //取得用户的消息
    function get_info($userid){
        require_once "../model/message.php";
        $message=[];
        $index=0;
        $query="SELECT * FROM MESSAGE WHERE DESTINATION_ID=".$userid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $message[$index]['type']=$row['TYPE'];
            $message[$index]['partner']=$row['PARTNER_ID'];
            $message[$index]['destination_id']=$row['DESTINATION_ID'];
            $message[$index]['content']=$row['CONTENT'];
            $message[$index]['isread']=$row['ISREAD'];
            $message[$index]['date']=$row['DTM'];
            $index++;

        }
        return $message;
    }

    //获取新的消息ID
    function get_message_id(){
        $query="SELECT * FROM NEW_ID;";
        $id="";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $id=$row['MESSAGE'];
        }
        $newid=$id+1;
        $up="UPDATE NEW_ID SET MESSAGE=".$newid.";";
        $ret = $this->sql->exec($up);
        return $id;
    }
}