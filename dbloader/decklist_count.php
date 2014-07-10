<?php

error_reporting(E_ALL);
ini_set('memory_limit', '512M');
ini_set('display_errors', 'ON');

$host = "127.0.0.1"; // Host name
$username = "root"; // Mysql username
$password = ""; // Mysql password
$db_name = "whoo"; // Database name
$tbl_name = "four_decks"; // 4-0 decks
$tbl_name2 ="three_decks";// 3-1 decks

$con = mysql_connect("$host", "$username", "$password")or die("cannot connect");
$db_con = mysql_select_db($db_name) or die("cannot select DB");
$charset = mysql_set_charset('utf8',$con);
if ($charset){
    print "\nInitializing default data character set.\n\n";
    print "Default character data set - UTF8.\n\n";
}

include_once('simple_html_dom.php');
date_default_timezone_set('UTC');


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Wizards seems to be blocking scripts from scraping their content
// So, we have to use CURL to pull the data and set up its configuration
// To pretend we are just a simple web browser.
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

$header = array(
  'User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12',
  'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
  'Accept-Language: en-us',
  'Accept-Charset: UTF-8',
  'Keep-Alive: 115',
  'Connection: keep-alive',
  'Cache-Control: no-cache'
);
  

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Manual and automatic date below
// Top $url is auto .... pretty obvious
// 
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

$url = 'http://magic.wizards.com/en/articles/archive/mtgo-standings/'.'standard-daily-'.date('Y-m-d', strtotime("yesterday"));
//$url = 'http://magic.wizards.com/en/articles/archive/mtgo-standings/standard-daily-2014-07-05#decklists';

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// origial url variable
// $url = 'http://magic.wizards.com/en/articles/archive/mtgo-standings/'.'standard-daily-'.date('Y-m-d', strtotime("yesterday"));
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

$ch = curl_init();
curl_setopt($ch,CURLOPT_URL,$url);
curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
curl_setopt($ch,CURLOPT_COOKIEFILE,'cookies.txt');
curl_setopt($ch,CURLOPT_COOKIEJAR,'cookies.txt');
curl_setopt($ch,CURLOPT_HTTPHEADER, $header);
$html = curl_exec($ch);
curl_close($ch);

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


// Create SimpleDOM Object out of the html we've pulled from wizard's servers
// This makes for easier parsing.
$dom = new simple_html_dom();
$decklists = array();

if($dom->load($html)){
  foreach($dom->find('a.download-icon') as $download_link){
    array_push($decklists, 'http://magic.wizards.com'.$download_link->href);
  }
}

// gets date from span class="deck-meta" h5 tag
$text = $dom->getElementByTagName('span[class=deck-meta]h5');
$date_pattern = '/(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.]((?:19|20)\d\d)/';
preg_match($date_pattern,$text,$date1);
//print_r($date1);
$date_raw = $date1[0];
//print ($date_raw);
$date = date('Y-m-d', strtotime($date_raw));


//print_r($decklists);
$cards = array();
$cards2 = array();
if(!empty($decklists)){
    foreach($decklists as $decklist){
       $record_pattern = '/\.txt[^-]*-\K\d/';
       preg_match($record_pattern, $decklist, $record);
       $record_string = implode($record);
    if(!$record_string){  
    //remove blank lines
       if($deck_txt = @file_get_contents($decklist)){
        $deck_txt = preg_replace("/(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+/", "\n", $deck_txt);
        $deck = explode("\n", $deck_txt);
        // remove the first and last element, cuz blank
        $deck = array_slice($deck, 1, -1);
        //regex to parse out the count and the card name
        $pattern = '/(\d+)\s(.+)$/';
       foreach($deck as $card){
        preg_match($pattern, $card, $matches);
        $count = $matches[1];
        $card_name = $matches[2];

        if(!empty($cards["$card_name"])){
          $cards["$card_name"] += $count;
        } else {
          $cards["$card_name"] = $count;
        }
       }
       }
    }
    else{
       if($deck_txt = @file_get_contents($decklist)){
        $deck_txt = preg_replace("/(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+/", "\n", $deck_txt);
        $deck = explode("\n", $deck_txt);
        // remove the first and last element, cuz blank
        $deck = array_slice($deck, 1, -1);
        //regex to parse out the count and the card name
        $pattern = '/(\d+)\s(.+)$/';
       foreach($deck as $card){
        preg_match($pattern, $card, $matches);
        $count = $matches[1];
        $card_name = $matches[2];

        if(!empty($cards2["$card_name"])){
          $cards2["$card_name"] += $count;
        } else {
          $cards2["$card_name"] = $count;
        }
       }
       }
    }
    }       
}
// sort by count
arsort($cards);
arsort($cards2);

print_r($cards);
print_r($cards2);

// Insert for 4-0 decks
$sql = "INSERT INTO $tbl_name(cards_mtgo, date, hits) VALUES";
foreach($cards as $key=>$value){
  @$sql .= "\n" . '("' . mysql_real_escape_string($key) . '", "' . mysql_real_escape_string($date) . '", "' . mysql_real_escape_string($value) . '"),';
}
$sql = substr($sql, 0, -1) . ';';

if (!$result = mysql_query($sql)) {
  echo mysql_error();
}
if ($result){
    print "All requested data has been successfully added to $tbl_name.$db_name.\n\n";
}

//Insert for 3-1 decks
$sql2 = "INSERT INTO $tbl_name2(cards_mtgo, date, hits) VALUES";
foreach($cards2 as $key=>$value){
  @$sql2 .= "\n" . '("' . mysql_real_escape_string($key) . '", "' . mysql_real_escape_string($date) . '", "' . mysql_real_escape_string($value) . '"),';
}
$sql2 = substr($sql2, 0, -1) . ';';

if (!$result = mysql_query($sql2)) {
  echo mysql_error();
}
if ($result){
    print "All requested data has been successfully added to $tbl_name2.$db_name.\n\n";
}