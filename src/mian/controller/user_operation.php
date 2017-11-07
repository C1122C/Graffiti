<?php
class user_info_operation{

	function basic_info_inq($userid){}
	
	function basic_info_mod($uservo){}
	
	function follow_inq($userid){}
	
	function follow_add($userid_s,$userid_f,$group){}
	
	function follow_del($userid_s,$userid_f){}
	
	function collect_inq($userid){}
	
	function collect_add($userid,$picid){}
	
	function collect_del($userid,$picid){}
	
	function comment_inq($userid){}
	
	function mission_inq($userid){}
	
	function user_search($uservo){}
	
	function user_del($userid_s,$userid_d){}
}
class user_upload_operation{
	
	function upload_inq($userid,$book){}
	
	function upload_add($userid,$picid,$book){}
	
	function upload_del($userid,$picid){}
	
	function book_inq($userid){}
	
	
}

class user_announce_operation{
	
	function announce_inq($userid){}
	
	function announce_add($userid,$announceid){}
	
	function announce_del($userid,$announceid){}
}

class user_recom_operation{
    function user_rec($userid){}

    function update_history($userid,$tag){}
}

class log_operation{
    function log_in($userid,$userpsw){}

    function register($uservo){}

    function log_out($userid){}
}
?>
