<?php 
include_once 'config.php';
$feedData=$feed->newsFeed();
//$sessions_uid=$_SESSION['uid'];
$session_uid='1';
?>
<!DOCTYPE html> 
<html lang="pt-BR"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<title>Facebook Reactions</title>
<meta content='width=device-width, initial-scale=1' name='viewport'/> 
<link rel="stylesheet" type="text/css" href="assets/css/tooltipsterReaction.css">
<link rel="stylesheet" type="text/css" href="assets/css/tipsy.css">
<link rel="stylesheet" type="text/css" href="assets/css/app.css">
<link rel="stylesheet" type="text/css" href="assets/css/queries.css">
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.livequery.js"></script>
<script src="assets/js/jquery.tooltipsterReaction.js"></script>
<script src="assets/js/jquery.tipsy.js"></script>
<script src="assets/js/app.js"></script>
</head> 

<body> 
<h1 class="main-title">Facebook Reactions</h1>
<br>
<br>
<br>

<?php 
foreach($feedData as $data)
{
$likeCheck=$feed->reactionCheck($session_uid, $data->msg_id);
$reactionName='';$likeStatus='';

if(!empty($likeCheck))
{
$reactionName=$likeCheck->name;
$likeStatus=$likeCheck->like_id;
}

if($likeStatus)
{
$like='<a href="#" class="unLike" id="like'.$data->msg_id.'" rel="unlike"><i class="'.trim(strtolower($reactionName)).'IconSmall likeTypeSmall" ></i>'.$reactionName.'</a>';	
}
else
{
$like='<a href="#" class="reaction" id="like'.$data->msg_id.'" rel="like"><i class="likeIconDefault" ></i>Curtir</a>';
}


?>
<div class="postBody" id="msg<?php  echo $data->msg_id; ?>">
<img src="<?php echo $data->profile_pic; ?>" class="postImg"/>
<b><a href="<?php echo BASE_URL.$data->username; ?>"><?php echo $data->name; ?></a></b>
<?php echo $data->post;  ?>
<div class="postFooter">
<?php echo $like; ?>
</div>
</div>

<?php } ?>
 

</body> 
</html> 
