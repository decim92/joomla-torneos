<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../equipos?id_equipo='.$_POST['idAEquipo'].'&id_ju='.$_POST['id_jugador']);
 	include "../conexion.php";

 	if(isset($_POST['btnAJugador'])):
		if($_POST['btnAEquipo']):
			if($_POST['a_nombre_equipo'] != "" && $_POST['pac-input'] != ""):

			$color1sin = str_replace('#', '', $_POST['color1Equipo']);
			$color11sin = str_replace('#', '', $_POST['color11Equipo']);
			$color2sin = str_replace('#', '', $_POST['color2Equipo']);
			$color22sin = str_replace('#', '', $_POST['color22Equipo']);
			$array_color1 = array($color1sin, $color11sin);
			$color1 = implode("|", $array_color1);
			$array_color2 = array($color2sin, $color22sin);
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
			$_SESSION['jugador_a'] = 1;
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