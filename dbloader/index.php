<?php

error_reporting(E_ALL ^ E_NOTICE);
ini_set('memory_limit', '512M');
ini_set('display_errors', 'ON');

$host = "127.0.0.1"; // Host name
$username = "root"; // Mysql username
$password = ""; // Mysql password
$db_name = "whoo"; // Database name
$tbl_name = "sets"; // Table name

$con = mysql_connect("$host", "$username", "$password")or die("cannot connect");
$db_con = mysql_select_db($db_name) or die("cannot select DB");
$charset = mysql_set_charset('utf8',$con);
if ($charset){
    print "\n\nInitializing default data character set.\n\n";
    print "Default character data set - UTF8.\n\n";
}
print "Please wait while AllSetsArray.json is decoding.\n\n";

$sets_url = "http://mtgjson.com/json/AllSetsArray.json";
$sets_json = file_get_contents($sets_url);
$sets = json_decode($sets_json);

$truncate = mysql_query("TRUNCATE TABLE $tbl_name");
if ($truncate){
    print "Truncating cards.all_sets_json.\n\n";
}

$sql = "INSERT INTO $tbl_name(name, code, gatherer_code, release_date, block) VALUES";
foreach ($sets as $set) {
  $gathererCode = ($set->gathererCode) ? $set->gathererCode : $set->code;
  $sql .= "\n" . '("' . mysql_real_escape_string($set->name) . '", "' . mysql_real_escape_string($set->code) . '", "' . mysql_real_escape_string($gathererCode) . '", "' . mysql_real_escape_string($set->releaseDate) . '", "' . mysql_real_escape_string($set->block) . '"),';
}

$sql = substr($sql, 0, -1) . ';';

if (!$result = mysql_query($sql)) {
  echo mysql_error();
}
if ($result){
    print "All requested data has been successfully added to cards.all_sets_json.\n\n";
}

//$sets_url = "http://mtgjson.com/json/AllSetsArray.json";
//$sets_json = file_get_contents($sets_url);
//$sets = json_decode($sets_json);
//
//$sql = "INSERT into `sets` (`name`, `code`, `gatherer_code`, `release_date`, `block`) values ";
//foreach($sets as $set){
//  $gathererCode = ($set->gathererCode) ? $set->gathererCode : $set->code;
//  @$sql .= "\n".'("'.mysql_real_escape_string($set->name).'", "'.mysql_real_escape_string($set->code).'", "'.mysql_real_escape_string($gathererCode).'", "'.$set->releaseDate.'", "'.mysql_real_escape_string($set->block).'"),';
//}
//$sql = substr($sql, 0,-1);
//
