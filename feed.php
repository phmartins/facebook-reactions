<?php
class feed
{
	 /* FEED DE NOTICIAS */
     public function newsFeed()
     {
        $db = getDB();
		$stmt = $db->prepare("SELECT U.uid, U.name, U.username,U.profile_pic, M.msg_id, M.post, M.created, M.like_count FROM  users U,posts M WHERE U.uid=M.uid_fk ORDER BY M.msg_id DESC");  
		$stmt->execute();
		$data = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;
		return $data;
     }

      /* VERIFICAÇÃO DE REAÇÕES DO USER */
     public function reactionCheck($uid, $msg_id)
     {
        $db = getDB();
		$stmt = $db->prepare("SELECT L.like_id, R.name FROM  post_like L, reactions R WHERE R.rid=L.rid_fk AND L.uid_fk=:uid  AND L.msg_id_fk=:msg_id");  
		$stmt->bindValue(':uid', $uid, PDO::PARAM_INT);
		$stmt->bindValue(':msg_id', $msg_id, PDO::PARAM_INT);
		$stmt->execute();
		$data= $stmt->fetch(PDO::FETCH_OBJ);
		$db = null;
		return $data;
     }


      /* FEED DE NOTICIAS */
     public function userReaction($uid,$msg_id,$rid)
     {
        $db = getDB();
		$stmt1 = $db->prepare("SELECT like_id FROM post_like WHERE uid_fk=:uid AND msg_id_fk=:msg_id");  
		$stmt1->bindValue(':uid', $uid, PDO::PARAM_INT);
		$stmt1->bindValue(':msg_id', $msg_id, PDO::PARAM_INT);
		$stmt1->execute();
		$count=$stmt1->rowCount();

		if($count > 0)
        {
        $stmt = $db->prepare("DELETE FROM  post_like WHERE  uid_fk=:uid AND msg_id_fk=:msg_id");  
		$stmt->bindValue(':uid', $uid, PDO::PARAM_INT);
		$stmt->bindValue(':msg_id', $msg_id, PDO::PARAM_INT);
		$stmt->execute();
        $db = null;
		return 2;
        }
        else
        {

        $stmt = $db->prepare("INSERT INTO post_like (msg_id_fk, uid_fk, created, rid_fk) VALUES (:msg_id, :uid, :created, :rid)");  
		$stmt->bindValue(':uid', $uid, PDO::PARAM_INT);
		$stmt->bindValue(':msg_id', $msg_id, PDO::PARAM_INT);
		$created=time();
		$stmt->bindValue(':created', $created, PDO::PARAM_INT);
		$stmt->bindValue(':rid', $rid, PDO::PARAM_INT);
		$stmt->execute();
		$db = null;
		return 1;

        }

		
     }


}
 ?>