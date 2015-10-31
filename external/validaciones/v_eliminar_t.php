<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../2015-09-24-20-59-13');
 	include "../conexion.php";

	if(isset($_POST['btn_ocultar_torneo'])):
		if($_POST['btn_ocultar_torneo']):
			try{
			$db_act_torneo = & JDatabase::getInstance( $option );
			$query_act_torneo = $db_act_torneo->getQuery(true);

			$fields = array(				
				$db_act_torneo->quoteName('estado') . ' = ' . 0
				);
			$conditions = array(
				$db_act_torneo->quoteName('id_torneo') . ' = ' . $_SESSION['id_torneo']
				);
			 
			$query_act_torneo
			    ->update($db_act_torneo->quoteName('torneo'))
			    ->set($fields)
			    ->where($conditions);
			$db_act_torneo->setQuery($query_act_torneo);
			$db_act_torneo->execute();
			}
			catch(Exception $e){
				echo $e;
			}
		endif;
	endif;
?>