<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/11/22
 * Time: 0:40
 */

namespace mian\controller;


use mian\dao\log_related_dao;

class log_related
{
    var $log_dao;

    function __construct()
    {
        require_once '../dao/log_related_dao.php';
        $this->log_dao=new log_related_dao();
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
        $user=new user($username,$special,$interest,$location,$contact,$description);
        $psd=$this->encipher($pswd);
        $account=$this->log_dao->register($user,$psd);
        return $account;
    }

    function encipher($pswd)
    {
        $psd=md5($pswd);
        return $psd;
    }
}

?>
