<?php

//define(ALL_PS,"PHP100");

$mysql_servername="localhost:3306";
$mysql_username="root";
$mysql_password="act123456";
$mysql_dbname="ss";
echo("abc");
echo("aaaaa");
$conn=mysql_connect($mysql_servername ,$mysql_username ,$mysql_password);
      //mysql_query("set names UTF8");
      mysql_select_db($mysql_dbname , $conn);
      $strSQL = "select * from user";
	  $rs=mysql_query($strSQL);
	  echo ("aaa");

?>