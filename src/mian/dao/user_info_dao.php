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

    function comment_inq($userid){}

    function mission_inq($userid){}

    function user_search($uservo){}

    function user_del($userid_s,$userid_d){}
}