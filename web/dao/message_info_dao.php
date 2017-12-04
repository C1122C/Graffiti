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

    function add_info($userid,$info){
        $id=$this->get_message_id();
        $sqlstr="INSERT INTO MESSAGE VALUES(".$id.",".$info->type.",".$info->partner.",".$userid.",".$info->content.",0,".$info->date.");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function change_read($mid){
        $sqlstr="UPDATE MESSAGE SET ISREAD=1 WHERE ID=".$mid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function get_info($userid){
        require_once "../model/message.php";
        $message=[];
        $index=0;
        $query="SELECT * FROM MESSAGE WHERE DESTINATION_ID=".$userid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $an=new message();
            $an->type=$row['TYPE'];
            $an->partner=$row['PARTNER_ID'];
            $an->to=$row['DESTINATION_ID'];
            $an->content=$row['CONTENT'];
            $an->read=$row['ISREAD'];
            $an->date=$row['DTM'];
            $message[$index]=$an;
            $index++;

        }
        return $message;
    }

    function get_message_id(){
        $query="SELECT * FROM NEW_ID;";
        $id="";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $id=$row['MESSAGE'];
        }
        return $id;
    }
}