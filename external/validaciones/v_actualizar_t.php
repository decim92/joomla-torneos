<?php 
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../definir-tor');
 	include "../conexion.php";

	if(isset($_POST['btnATorneo'])):
		if($_POST['btnATorneo']):
			if($_POST['a_nombre_torneo'] != "" && $_POST['pac-input'] != ""):
			try{
			$db_act_torneo = & JDatabase::getInstance( $option );
			$query_act_torneo = $db_act_torneo->getQuery(true);

			$fields = array(
				$db_act_torneo->quoteName('descripcion') . ' = ' . $db_act_torneo->quote($_POST['a_nombre_torneo']),
				$db_act_torneo->quoteName('ubicacion') . ' = ' . $db_act_torneo->quote($_POST['pac-input']),
				$db_act_torneo->quoteName('puntos_g') . ' = ' . $db_act_torneo->quote($_POST['a_puntos_g']), 
				$db_act_torneo->quoteName('puntos_p') . ' = ' . $db_act_torneo->quote($_POST['a_puntos_p']),
				$db_act_torneo->quoteName('puntos_e') . ' = ' . $db_act_torneo->quote($_POST['a_puntos_e'])
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
			$_SESSION['torneo_actualizado'] = 1;			
			}
			catch(Exception $e){
				echo $e;
			}
			else:
				echo "BAD";
			endif;
		endif;
	endif;


	if(isset($_POST['btn_a_vision'])):
		if($_POST['btn_a_vision']):
			$nuevo_estado = -1;
			if($_POST['vision_t'] == 1):
				$nuevo_estado = 0;
			elseif($_POST['vision_t'] == 0):
				$nuevo_estado = 1;
			endif;
			try{
			$db_act_torneo = & JDatabase::getInstance( $option );
			$query_act_torneo = $db_act_torneo->getQuery(true);

			$fields = array(				
				$db_act_torneo->quoteName('publicado') . ' = ' . $db_act_torneo->quote($nuevo_estado)
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