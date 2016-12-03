/* SCRIPT - Like Reaction!
   VERSÃO: 1.0
   AUTOR: Phillipe Martins
   AGENCIA: YEAH! - COMUNICAÇÃO DIGITAL
*/

$(document).ready(function()
{

$(".likeTypeAction").tipsy({gravity: 's',live: true});

$(".reaction").livequery(function () 
{
var reactionsCode='<span class="likeTypeAction" original-title="Like" data-reaction="1"><i class="likeIcon likeType"></i></span>'+
'<span class="likeTypeAction" original-title="Amei" data-reaction="2"><i class="ameiIcon likeType"></i></span>'+
'<span class="likeTypeAction" original-title="Haha" data-reaction="3"><i class="hahaIcon likeType"></i></span>'+
'<span class="likeTypeAction" original-title="Uau" data-reaction="4"><i class="uauIcon likeType"></i></span>'+
'<span class="likeTypeAction" original-title="Triste" data-reaction="7"><i class="tristeIcon likeType"></i></span>'+
'<span class="likeTypeAction last" original-title="Grr" data-reaction="8"><i class="grrIcon likeType"></i></span>';

$(this).tooltipster({
contentAsHTML: true,
interactive: true,
content: $(reactionsCode),
});
});




/* Reações */
$("body").on("click",".likeTypeAction",function()
{
var reactionType=$(this).attr("data-reaction");
var reactionName=$(this).attr("original-title");
var rel=$(this).parent().parent().attr("rel");
var x=$(this).parent().parent().attr("id");
var sid=x.split("reaction");
var msg_id=sid[1];

var htmlData='<i class="'+reactionName.toLowerCase()+'IconSmall likeTypeSmall" ></i>'+reactionName;
var dataString = 'msg_id='+ msg_id +'&rid='+reactionType;

$.ajax({
type: "POST",
url: 'ajaxReaction.php',
data: dataString,
cache: false,
beforeSend: function(){},
success: function(html)
{
	
if(parseInt(html)==1)
{	
$("#like"+msg_id).html(htmlData).removeClass('reaction').removeClass('tooltipstered').addClass('unLike').attr('rel','unlike');
$("#"+x).hide();
}

}
});

return false;
});

$("body").on("click",".unLike",function()
{
var reactionType='1';
var x=$(this).attr("id");
var sid=x.split("like");
var msg_id=sid[1];
var dataString = 'msg_id='+ msg_id +'&rid='+reactionType;
var htmlData='<i class="likeIconDefault" ></i>Curtir</a>';
$.ajax({
type: "POST",
url: 'ajaxReaction.php',
data: dataString,
cache: false,
beforeSend: function(){},
success: function(html)
{
if(parseInt(html)==2)
{	
$("#like"+msg_id).html(htmlData).addClass('reaction').addClass('tooltipstered').removeClass('unLike');
}
}
});

return false;
});

	
});