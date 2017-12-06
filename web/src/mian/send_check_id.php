<?php
$name = $_POST['id'];
setcookie('visit_name',$name,time()+3600);
?>