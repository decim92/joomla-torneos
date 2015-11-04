<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../equipos?id_equipo='.$_POST['idAEquipo']);
 	include "../conexion.php";

 	if(isset($_POST['btnAEquipo'])):
		if($_POST['btnAEquipo']):
			if($_POST['a_nombre_equipo'] != "" && $_POST['pac-input'] != ""):

			$array_color1 = array($_POST['color1Equipo'], $_POST['color11Equipo']);
			$color1 = implode("|", $array_color1);
			$array_color2 = array($_POST['color2Equipo'], $_POST['color22Equipo']);
			$color2 = implode("|", $array_color2);
			try{
			$db_act_equipo = & JDatabase::getInstance( $option );
			$query_act_equipo = $db_act_equipo->getQuery(true);

			$fields = array(
				$db_act_equipo->quoteName('nombre') . ' = ' . $db_act_equipo->quote($_POST['a_nombre_equipo']),
				$db_act_equipo->quoteName('ubicacion') . ' = ' . $db_act_equipo->quote($_POST['pac-input']),
				$db_act_equipo->quoteName('color1') . ' = ' . $db_act_equipo->quote($color1), 
				$db_act_equipo->quoteName('color2') . ' = ' . $db_act_equipo->quote($color2)
				);
			$conditions = array(
				$db_act_equipo->quoteName('id_equipo') . ' = ' . $_POST['idAEquipo']
				);
			 
			$query_act_equipo
			    ->update($db_act_equipo->quoteName('equipo'))
			    ->set($fields)
			    ->where($conditions);
			$db_act_equipo->setQuery($query_act_equipo);
			$db_act_equipo->execute();
			$_SESSION['equipo_a'] = 1;
			}
			catch(Exception $e){
				echo $e;
			}
			else:
				echo "BAD";
			endif;
		endif;
	endif;

 	

?>