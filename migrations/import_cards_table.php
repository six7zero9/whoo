<?php

error_reporting(E_ALL ^ E_NOTICE);
ini_set('memory_limit', '512M');
ini_set('display_errors', 'ON');

$host = "127.0.0.1";
$username = "root";
$password = "";
$db_name = "whoo";
$tbl_name = "cards";

$con = mysql_connect("$host", "$username", "$password")or die("cannot connect");
$db_con = mysql_select_db($db_name) or die("cannot select DB");
$charset = mysql_set_charset('utf8',$con);

$sets_url = "http://mtgjson.com/json/AllSetsArray.json";
$sets_json = file_get_contents($sets_url);
$sets = json_decode($sets_json);

mysql_query("TRUNCATE TABLE ".$tbl_name);

$sql = "INSERT INTO $tbl_name(name, multiverseid, type, rarity, color, set_id) VALUES";
$set_id = 1;
foreach($sets as $set){
  foreach($set->cards as $card){
    $multiverseid = (int) $card->multiverseid; 
    if(is_array($card->colors)){ 
      $color = implode(", ",$card->colors); 
    } elseif(empty($card->colors)){
      $color = ($card->type);
    } else {
      $color = ($card->colors); 
    }
    $sql .= "\n" . '("' . mysql_real_escape_string($card->name) . '", "' . $multiverseid . '", "' . $card->type . '", "' . mysql_real_escape_string($card->rarity) . '", "' . $color . '", "' . $set_id . '"),';
  }
  $set_id++;     
}
$sql = substr($sql, 0, -1) . ';';

if (!$result = mysql_query($sql)) {
  echo mysql_error();
} else {
  print "\nAll requested data has been successfully added to cards.all_sets_json.\n\n";
}