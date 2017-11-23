<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/22
 * Time: 1:45
 */

namespace mian\dao;


class user_info_dao
{
    function basic_info_inq($userid){}

    function basic_info_mod($uservo){}

    function follow_inq($userid,$group){}

    function follow_add($userid_s,$userid_f,$group){}

    function follow_del($userid_s,$userid_f,$group){}

    function collect_inq($userid){}

    function collect_add($userid,$picid){}

    function collect_del($userid,$picid){}

    function own_announce_inq($userid){}

    function part_announce_inq($userid){}

    function announce_add($userid,$announceid){}

    function announce_del($userid,$announceid){}

    function upload_inq($userid,$book){}

    function upload_add($userid,$picid,$book){}

    function upload_del($userid,$picid){}

    function album_inq($userid){}

    function album_add($userid,$albumid){}

    function album_del($userid,$albumid){}

    function adm_account(){}

    function user_del($userid_d){}

    function transmit_inq($userid){
    }

    function add_transmit($userid,$picid){
    }

    function del_transmit($userid,$picid){}
}