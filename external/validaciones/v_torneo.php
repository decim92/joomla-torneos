<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../definir-tor');
 	include "../conexion.php";

 	$_SESSION['tipo_to']= $_POST['listaTipoT'];
	$_SESSION['categ']= $_POST['listaCate'];
	$_SESSION['descrip']= $_POST['descripcion'];
	$_SESSION['pai']= $_POST['pais'];

	$array_deporte= $_POST['listaDeporte'];
	$deporte_explode = explode('|', $array_deporte);
	$_SESSION['deport']= $deporte_explode[1];
	$_SESSION['individual']= $deporte_explode[0];

 	// if(isset($_REQUEST["btnCrearTorneo"])):
	// if($validacion == 1):
	if($_POST['descripcion'] != "" && $_POST['pais'] != "0"):
	try{
		$db_ins = & JDatabase::getInstance( $option );
	$user = JFactory::getUser();
	$query_ins = $db_ins->getQuery(true);
	 
	// Insert columns.
	$columns = array('id_usuario', 'id_tipo_torneo', 'id_categoria', 'id_deporte', 'descripcion', 'id_pais', 'id_ciudad');
	 
	// Insert values.
	$values = array($user->id,$_POST['listaTipoT'],$_POST['listaCate'],$_POST['listaDeporte'], $db_ins->quote($_POST['descripcion']), $db_ins->quote($_POST['pais']), $_POST['estado']);
	 
	// Prepare the insert query.
	$query_ins
	    ->insert($db_ins->quoteName('torneo'))
	    ->columns($db_ins->quoteName($columns))
	    ->values(implode(',', $values));
	 
	// Set the query using our newly populated query object and execute it.
	$db_ins->setQuery($query_ins);
	$db_ins->execute();					
	$_SESSION['correcto'] = 1;
	$_SESSION['id_torneo'] = $db_ins->insertid();	
	}catch(Exception $e){
		echo "Error";		
	};
	else:
		$_SESSION['correcto'] = 0;
		echo "Error";		
	endif;
	// endif;
	// endif;
 ?> 