<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../clasificacion');
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

	$columns = array('descripcion', 'tipo_grupo', 'id_torneo');
	$values = array($db_ins->quote("Eliminatoria ".$_POST['elis']), 0, $_SESSION['id_torneo']);
	 
	$query_ins
	    ->insert($db_ins->quoteName('grupo'))
	    ->columns($db_ins->quoteName($columns))
	    ->values(implode(',', $values));

	elseif (isset($_POST['btnNuevaLig'])):

	$columns = array('descripcion', 'tipo_grupo', 'id_torneo');
	$values = array($db_ins->quote("Liga ".$_POST['ligas']), 1, $_SESSION['id_torneo']);
	 
	$query_ins
	    ->insert($db_ins->quoteName('grupo'))
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
////////////////////////////////
	try{
	$db_ins_equi_g = & JDatabase::getInstance( $option );
	$query_ins_equi_g = $db_ins_equi_g->getQuery(true);
	$boton = "btnAniadirEquipo";

		if (isset($_POST['btnAniadirEquipo'])):
		$columns = array('id_equipo', 'id_grupo');
		$values = array($_POST['aEquipo'], $_POST['idGrupo']);
		 
		$query_ins_equi_g
		    ->insert($db_ins_equi_g->quoteName('equipo_grupo'))
		    ->columns($db_ins_equi_g->quoteName($columns))
		    ->values(implode(',', $values));
		$db_ins_equi_g->setQuery($query_ins_equi_g);
		$db_ins_equi_g->execute();		
		endif;	
	

	if (isset($_POST['btnConfigG'])):
	$db_act_descr_g = & JDatabase::getInstance( $option );
	$query_act_descr_g = $db_act_descr_g->getQuery(true);

	$fields = array(
		$db_act_descr_g->quoteName('descripcion') . ' = ' . $db_act_descr_g->quote($_POST['nombreGrupo'])
		);
	$conditions = array(
		$db_act_descr_g->quoteName('id_grupo') . ' = ' . $_POST['idGrupo']
		);
	 
	$query_act_descr_g
	    ->update($db_act_descr_g->quoteName('grupo'))
	    ->set($fields)
	    ->where($conditions);
	$db_act_descr_g->setQuery($query_act_descr_g);
	$db_act_descr_g->execute();		
	endif;
	 
				
	// $_SESSION['correcto'] = 1;
	// $_SESSION['id_torneo'] = $db_ins->insertid();	
	}catch(Exception $e){
		echo $e;		
		echo $query_act_descr_g;
	};
	// endif;
	// endif;
 ?> 