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

    function announce_del($aid){}

    function announce_add($announce){}

    function announce_part($userid,$aid){}

    function all_announce(){}

    function match_ask($ask){}
}