<?php
/**
 * Created by IntelliJ IDEA.
 * User: 曹畅
 * Date: 2017/12/3
 * Time: 2:02
 */

namespace mian\dao;


class sql_helper extends \SQLite3
{
    function __construct($filename = "Graffiti.db", $flags = null, $encryption_key = null)
    {
        parent::__construct($filename, $flags, $encryption_key);
        $this->open($filename);
    }

}