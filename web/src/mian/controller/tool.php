<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/22
 * Time: 14:58
 */

namespace mian\controller;


class tool
{
    function sort_by_date($array){
        $max=$array[0];
        $index=0;
        $all_done=false;
        $result=[];
        $cursor=0;
        while(!$all_done){
            for($i=0;$i<count($array);$i++){
                if($array[$i]!=0&&strtotime($array[$i]['date'])>strtotime($max['date'])){
                    $max=$array[$i];
                    $index=$i;
                }
            }
            if($cursor<count($array)){
                $result[$cursor]=$max;
                $cursor++;
                $array[$index]=0;
                $index=0;
                while($array[$index]==0){
                    $index++;
                }
                $max=$array[$index];
            }
            else{
                $all_done=true;
            }
        }
        return $result;
    }

    function sort_by_times($array){
        $max=$array[0];
        $index=0;
        $all_done=false;
        $result=[];
        $cursor=0;
        while(!$all_done){
            for($i=0;$i<count($array);$i++){
                if($array[$i]!=0&&$array[$i]['times']>$max['times']){
                    $max=$array[$i];
                    $index=$i;
                }
            }
            if($cursor<count($array)){
                $result[$cursor]=$max;
                $cursor++;
                $array[$index]=0;
                $index=0;
                while($array[$index]==0){
                    $index++;
                }
                $max=$array[$index];
            }
            else{
                $all_done=true;
            }
        }
        return $result;
    }

    function sort_by_like($array){
        $max=$array[0];
        $index=0;
        $all_done=false;
        $result=[];
        $cursor=0;
        while(!$all_done){
            for($i=0;$i<count($array);$i++){
                if($array[$i]!=0&&$array[$i]['like']>$max['like']){
                    $max=$array[$i];
                    $index=$i;
                }
            }
            if($cursor<count($array)){
                $result[$cursor]=$max;
                $cursor++;
                $array[$index]=0;
                $index=0;
                while($array[$index]==0){
                    $index++;
                }
                $max=$array[$index];
            }
            else{
                $all_done=true;
            }
        }
        return $result;
    }
}