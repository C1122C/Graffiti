<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/23
 * Time: 13:34
 */

namespace mian\dao;


class announce_info_dao
{
    var $sql;

    function __construct()
    {
        require_once "sql_helper.php";
        $this->sql=new sql_helper();
    }

    function announce_inq($aid){
        require_once "../model/announce.php";
        $announce=[];
        $index=0;
        $query="SELECT * FROM ANNOUNCE WHERE ID=".$aid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $an=new announce();
            $an->id=$row['ID'];
            $an->announceType=$row['TYPE'];
            $an->author=$row['AUTHOR'];
            $an->state=$row['STATE'];
            $an->activityType=$row['ACT_TYPE'];
            $an->location=$row['LOCATION'];
            $an->fare=$row['FARE'];
            $an->ask=$row['ASK'];
            $an->date=$row['DTM'];
            $announce[$index]=$an;
            $index++;

        }
        return $announce;
    }

    function announce_del($aid){
        require_once "../model/announce.php";
        $announce="";
        $query="SELECT * FROM ANNOUNCE WHERE ID=".$aid.";";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $announce=$row['STATE'];
        }
        if($announce=="WAITING"){
            $sqlstr="DROP FROM ANNOUNCE WHERE ID=".$aid.";";
            $ret = $this->sql->exec($sqlstr);
            if(!$ret){
                return "FAIL";
            } else {
                return "SUCCESSFUL";
            }
        }
        else{
            return "FORBID";
        }

    }

    function announce_add($announce){
        $id=$this->get_anc_id();
        $sqlstr="INSERT INTO ANNOUNCE VALUES(".$id.",".$announce->announceType.",".$announce->author.",".$announce->state.",".$announce->activityType.",".$announce->location.",".$announce->fare.",".$announce->ask.",".$announce->date.");";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
        $this->announce_part($announce->author,$id);
    }

    function announce_part($userid,$aid){
        $sqlstr="INSERT INTO MISSION VALUES(".$userid.",".$aid.",0.0,0,'OWN');";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            $ret = $this->change_state($aid);
            return $ret;
        }
    }

    function change_state($aid,$state){
        $sqlstr="UPDATE ANNOUNCE SET STATE=".$state." WHERE ID=".$aid.";";
        $ret = $this->sql->exec($sqlstr);
        if(!$ret){
            return "FAIL";
        } else {
            return "SUCCESSFUL";
        }
    }

    function all_announce(){
        require_once "../model/announce.php";
        $announce=[];
        $index=0;
        $query="SELECT * FROM ANNOUNCE;";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $an=new announce();
            $an->id=$row['ID'];
            $an->announceType=$row['TYPE'];
            $an->author=$row['AUTHOR'];
            $an->state=$row['STATE'];
            $an->activityType=$row['ACT_TYPE'];
            $an->location=$row['LOCATION'];
            $an->fare=$row['FARE'];
            $an->ask=$row['ASK'];
            $an->date=$row['DTM'];
            $announce[$index]=$an;
            $index++;

        }
        return $announce;
    }

    function match_ask($ask){
        require_once "../model/announce.php";
        $announce=[];
        $index=0;
        $query="SELECT * FROM ANNOUNCE WHERE ASK LIKE '%".$ask."%';";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $an=new announce();
            $an->id=$row['ID'];
            $an->announceType=$row['TYPE'];
            $an->author=$row['AUTHOR'];
            $an->state=$row['STATE'];
            $an->activityType=$row['ACT_TYPE'];
            $an->location=$row['LOCATION'];
            $an->fare=$row['FARE'];
            $an->ask=$row['ASK'];
            $an->date=$row['DTM'];
            $announce[$index]=$an;
            $index++;

        }
        return $announce;
    }

    function get_anc_id(){
        $query="SELECT * FROM NEW_ID;";
        $id="";
        $result=$this->sql->query($query);
        while($row = $result->fetchArray(SQLITE3_ASSOC) ){
            $id=$row['ANNOUNCE'];
        }
        return $id;
    }
}