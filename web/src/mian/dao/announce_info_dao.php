<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/23
 * Time: 13:34
 */

namespace mian\dao;


use mian\model\announce;

class announce_info_dao
{
    var $sql;

    function __construct()
    {
        require_once 'sql_helper.php';
        $this->sql=new \mian\dao\sql_helper();
    }

    //通过ID获取公告信息，已测试
    function announce_inq($aid){
        require_once "../model/announce.php";
        $announce=[];
        $index=0;
        $query="SELECT * FROM ANNOUNCE WHERE ID=".$aid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $announce[$index]['id']=$row['ID'];
            $announce[$index]['type']=$row['TYPE'];
            $announce[$index]['author']=$row['AUTHOR'];
            $announce[$index]['state']=$row['STATE'];
            $announce[$index]['act_type']=$row['ACT_TYPE'];
            $announce[$index]['location']=$row['LOCATION'];
            $announce[$index]['fare']=$row['FARE'];
            $announce[$index]['ask']=$row['ASK'];
            $announce[$index]['dtm']=$row['DTM'];
            $index++;
        }
        return $announce;
    }

    //通过ID删除公告，已测试
    function announce_del($aid){
        $announce="";
        $query="SELECT * FROM ANNOUNCE WHERE ID=".$aid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $announce=$row['STATE'];
        }
        if($announce=="WAITING"){
            $sqlstr="DELETE FROM ANNOUNCE WHERE ID=".$aid.";";
            $ret = $this->sql->exec($sqlstr);
            if(!$ret){
                return "FAIL";
            } else {
                return "SUCCESS";
            }
        }
        else{
            return "FORBID";
        }

    }

    function mark_mission($userid,$aid,$mark){
        $sqlstr="UPDATE MISSION SET Mark=".$mark.", MARKED=0 WHERE USER_ID=".$userid." AND ANNOUNCE_ID=".$aid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    function get_mission_partner($aid){
        $query="SELECT USER_ID FROM MISSION WHERE ANNOUNCE_ID=".$aid.";";
        $result=$this->sql->query($query);
        return $result;
    }

    //添加公告，已测试
    function announce_add($announce){
        $id=$this->get_anc_id();
        $sqlstr="INSERT INTO ANNOUNCE (ID,TYPE,AUTHOR,STATE,ACT_TYPE,LOCATION,FARE,ASK,DTM) VALUES (".$id.",".$announce['type'].",".$announce['author'].",".$announce['state'].",".$announce['act_type'].",".$announce['location'].",".$announce['fare'].",".$announce['ask'].",".$announce['date'].");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            $type="OWN";
            $type="'".$type."'";
            $this->announce_part($announce['author'],$id,$type);
            return "SUCCESS";
        }

    }

    //添加任务，已测试
    function announce_part($userid,$aid,$type){
        $sqlstr="INSERT INTO MISSION (USER_ID,ANNOUNCE_ID,MARK,MARKED,TYPE) VALUES (".$userid.",".$aid.",0.0,0,$type);";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            $ret = $this->change_state($aid);
            return $ret;
        }
    }

    //修改公告状态，已测试
    function change_state($aid,$state){
        $sqlstr="UPDATE ANNOUNCE SET STATE=".$state." WHERE ID=".$aid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESS";
        }
    }

    //返回所有公告
    function all_announce(){
        require_once "../model/announce.php";
        $announce=[];
        $index=0;
        $query="SELECT * FROM ANNOUNCE;";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $announce[$index]['id']=$row['ID'];
            $announce[$index]['type']=$row['TYPE'];
            $announce[$index]['author']=$row['AUTHOR'];
            $announce[$index]['state']=$row['STATE'];
            $announce[$index]['act_type']=$row['ACT_TYPE'];
            $announce[$index]['location']=$row['LOCATION'];
            $announce[$index]['fare']=$row['FARE'];
            $announce[$index]['ask']=$row['ASK'];
            $announce[$index]['dtm']=$row['DTM'];
            $index++;
        }
        return $announce;
    }

    //要求匹配，已测试
    function match_ask($ask){
        require_once "../model/announce.php";
        $announce=[];
        $index=0;
        $result=$this->all_announce();
        for($i=0;$i<count($result);$i++){
            if(strpos($result[$i],$ask)>=0){
                $announce[$index]['id']=$result[$i]['id'];
                $announce[$index]['type']=$result[$i]['type'];
                $announce[$index]['author']=$result[$i]['author'];
                $announce[$index]['state']=$result[$i]['state'];
                $announce[$index]['act_type']=$result[$i]['act_type'];
                $announce[$index]['location']=$result[$i]['location'];
                $announce[$index]['fare']=$result[$i]['fare'];
                $announce[$index]['ask']=$result[$i]['ask'];
                $announce[$index]['dtm']=$result[$i]['dtm'];
                $index++;
            }
        }
        return $announce;
    }

    //获取下一个公告ID，已测试
    function get_anc_id(){
        $query="SELECT * FROM NEW_ID;";
        $id="";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $id=$row['ANNOUNCE'];
        }
        $newid=$id+1;
        $up="UPDATE NEW_ID SET ANNOUNCE=".$newid.";";
        $ret = $this->sql->exec($up);
        return $id;
    }
}