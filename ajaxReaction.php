<?php 
include_once 'config.php';
$feedData=$feed->newsFeed();
//$sessions_uid=$_SESSION['uid'];
$session_uid='1';
if($_POST['msg_id']  && $_POST['rid'] && $session_uid>0)
{
$msg_id=$_POST['msg_id'];
$rid=$_POST['rid'];
$data=$feed->userReaction($session_uid,$msg_id,$rid);
echo $data;
}
?>