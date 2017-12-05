<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/22
 * Time: 0:42
 */

namespace mian\dao;


class log_related_dao
{
    var $sql;

    function __construct()
    {
        require_once "sql_helper.php";
        $this->sql=new sql_helper();
    }

    //获取密码，已测试
    function  get_password($username){
        $query="SELECT PASSWD FROM LOGIN WHERE ID=".$username.";";
        $result=$this->sql->query($query);
        $passwd="";
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $passwd=$row['PASSWD'];
        }
        return $passwd;
    }

    //注册，已测试
    function register($contact,$pswd){
        $query="SELECT * FROM USER WHERE CONTACT=".$contact.";";
        $result=$this->sql->query($query);
        $index=0;
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $index++;
        }
        if($index>0){
            return "CONTACT USED.";
        }
        $query="SELECT * FROM NEW_ID;";
        $id="";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $id=$row['USER'];
        }
        $newid=$id+1;
        $up="UPDATE NEW_ID SET USER=".$newid.";";
        $ret = $this->sql->exec($up);
        $sqlstr="INSERT INTO LOGIN(ID,PASSWD) VALUES (".$id.",".$pswd.");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return $id;
        }
    }

    //删除用户，已测试
    function del_account($userid){
        $sqlstr="DELETE FROM LOGIN WHERE ID=".$userid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }
}