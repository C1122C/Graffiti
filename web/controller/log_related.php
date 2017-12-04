<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/22
 * Time: 0:40
 */

namespace mian\controller;


use mian\dao\log_related_dao;
use mian\dao\announce_info_dao;
use mian\model\announce;
use mian\model\announce_select;
use mian\model\comment;
use mian\model\message;
use mian\model\picture;
use mian\model\tag;
use mian\model\user;

class log_related
{
    var $log_dao;
    var $user;

    function __construct()
    {
        require_once '../dao/log_related_dao.php';
        $this->log_dao=new log_related_dao();
        require_once './user_info.php';
        $this->user=new user_info();
    }

    function login_check($username,$password)
    {
        $input_psd=$this->encipher($password);
        $real_psd=$this->log_dao->get_password($username);
        if($input_psd==$real_psd)
        {
            return true;
        }
        return false;
    }

    function register($username,$pswd,$special,$interest,$location,$contact,$description)
    {
        require_once '../model/user.php';
        $psd=$this->encipher($pswd);
        $account=$this->log_dao->register($contact,$psd);
        $result=$this->user->basic_info_add($account,$username,$special,$interest,$location,$contact,$description);
        if($result!="FAIL"){
            return $account;
        }
        return $result;
    }

    function del_account($userid){
        return $this->log_dao->del_account($userid);
    }

    function encipher($pswd)
    {
        $psd=md5($pswd);
        return $psd;
    }
}

?>
