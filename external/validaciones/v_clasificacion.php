<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../definir-tor');
 	include "../conexion.php";

	// $_SESSION['categ']= $_POST['listaCate'];
	// $_SESSION['descrip']= $_POST['descripcion'];
	// $_SESSION['ubica']= $_POST['pac-input'];
	// $array_deporte= $_POST['listaDeporte'];
	// $deporte_explode = explode('|', $array_deporte);
	// $_SESSION['deport']= $deporte_explode[1];
	// $_SESSION['individual']= $deporte_explode[0];

 	// if(isset($_REQUEST["btnCrearTorneo"])):
	// if($validacion == 1):

	try{
		$db_ins = & JDatabase::getInstance( $option );
	$user = JFactory::getUser();
	$query_ins = $db_ins->getQuery(true);

	if (isset($_POST['btnNuevaEli'])):

	$columns = array('id_usuario', 'id_categoria', 'id_deporte', 'descripcion', 'ubicacion');
	$values = array($user->id,$_POST['listaCate'],$_SESSION['deport'], $db_ins->quote($_POST['descripcion']), $db_ins->quote($_POST['pac-input']));
	 
	$query_ins
	    ->insert($db_ins->quoteName('torneo'))
	    ->columns($db_ins->quoteName($columns))
	    ->values(implode(',', $values));

	elseif (isset($_POST['btnNuevaLig'])):

	$columns = array('id_usuario', 'id_categoria', 'id_deporte', 'descripcion', 'ubicacion');
	$values = array($user->id,$_POST['listaCate'],$_SESSION['deport'], $db_ins->quote($_POST['descripcion']), $db_ins->quote($_POST['pac-input']));
	 
	$query_ins
	    ->insert($db_ins->quoteName('torneo'))
	    ->columns($db_ins->quoteName($columns))
	    ->values(implode(',', $values));
	endif;
	 
	$db_ins->setQuery($query_ins);
	$db_ins->execute();					
	// $_SESSION['correcto'] = 1;
	// $_SESSION['id_torneo'] = $db_ins->insertid();	
	}catch(Exception $e){
		echo $e;		
	};
	// endif;
	// endif;
 ?> 