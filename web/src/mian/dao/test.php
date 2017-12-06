<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/12/5
 * Time: 23:30
 */
require "./log_related_dao.php";
$announce=new \mian\dao\log_related_dao();
echo $announce->get_password(1000001);