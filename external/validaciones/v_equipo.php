<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../equipos');
 	include "../conexion.php";

 	// echo $_POST['nombreEquipo'];

 	if($_POST['nombreEquipo'] != ""):
	try{
		$db_insE = & JDatabase::getInstance( $option );
	$user = JFactory::getUser();
	$query_insE = $db_insE->getQuery(true);
	 
	// Insert columns.
	$columns = array('nombre','id_usuario');
	 
	// Insert values.
	$values = array($db_insE->quote($_POST['nombreEquipo']), $user->id);
	 
	// Prepare the insert query.
	$query_insE
	    ->insert($db_insE->quoteName('equipo'))
	    ->columns($db_insE->quoteName($columns))
	    ->values(implode(',', $values));
	 
	// Set the query using our newly populated query object and execute it.
	$db_insE->setQuery($query_insE);
	$db_insE->execute();
	$id_equipo = $db_insE->insertid();
	$id_torneo = $_SESSION['id_torneo'];

	$query_insE = $db_insE->getQuery(true);

	$columns = array('id_equipo', 'id_torneo');
	 
	// Insert values.
	$values = array($id_equipo, $id_torneo);
	 
	// Prepare the insert query.
	$query_insE
	    ->insert($db_insE->quoteName('jugador_equipo_t'))
	    ->columns($db_insE->quoteName($columns))
	    ->values(implode(',', $values));
	 
	// Set the query using our newly populated query object and execute it.
	$db_insE->setQuery($query_insE);
	$db_insE->execute();					
	// $_SESSION['correcto'] = 1;	
	}catch(Exception $e){
		echo "Error";		
	};
	else:
		$_SESSION['correcto'] = 0;
		echo "Error";		
	endif;
?>