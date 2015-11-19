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
		if ($_POST['btnNuevaEli']):

	$columns = array('descripcion', 'tipo_grupo', 'id_torneo');
	$values = array($db_ins->quote("Eliminatoria ".$_POST['elis']), 0, $_SESSION['id_torneo']);
	 
	$query_ins
	    ->insert($db_ins->quoteName('grupo'))
	    ->columns($db_ins->quoteName($columns))
	    ->values(implode(',', $values));
	$db_ins->setQuery($query_ins);
	$db_ins->execute();	

	    endif;
	elseif (isset($_POST['btnNuevaLig'])):
		if($_POST['btnNuevaLig']):
	$columns = array('descripcion', 'tipo_grupo', 'id_torneo');
	$values = array($db_ins->quote("Liga ".$_POST['ligas']), 1, $_SESSION['id_torneo']);
	 
	$query_ins
	    ->insert($db_ins->quoteName('grupo'))
	    ->columns($db_ins->quoteName($columns))
	    ->values(implode(',', $values));
	$db_ins->setQuery($query_ins);
	$db_ins->execute();		
	    endif;	    
	endif;
	
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
			if ($_POST['btnAniadirEquipo']):
				$db_calend_c = & JDatabase::getInstance( $option );
				    $query_calend_c = "SELECT count(partido.id_partido) as cant_partidos
				    FROM partido, jornada, grupo
				    WHERE grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada = partido.id_jornada AND grupo.id_grupo = ".$_POST['idGrupo'];  
				    $db_calend_c->setQuery($query_calend_c);
				    $db_calend_c->execute();
				    $numRows_calend_c = $db_calend_c->getNumRows(); 
				    $results_calend_c = $db_calend_c->loadObjectList();
			    	if($results_calend_c[0]->cant_partidos <= 0):

			    if($_POST['orden'] !=""):
			    	$db_eli_orden = & JDatabase::getInstance( $option );
	                $query_eli_orden = "SELECT equipo_grupo.orden as orden_eq
	                FROM equipo, equipo_grupo
	                WHERE equipo.id_equipo = equipo_grupo.id_equipo AND equipo_grupo.id_grupo = ".$_POST['idGrupo']." AND equipo_grupo.orden = ".$_POST['orden'];  
	                $db_eli_orden->setQuery($query_eli_orden);
	                $db_eli_orden->execute();
	                $numRows_eli_orden = $db_eli_orden->getNumRows(); 
	                $results_eli_orden = $db_eli_orden->loadObjectList();
			    endif;
			    

			    		if($_POST['aEquipo'] != 0):							
							if($_POST['tipo_grupo'] == 1):	
								$columns = array('id_equipo', 'id_grupo');
								$values = array($_POST['aEquipo'], $_POST['idGrupo']);
								$query_ins_equi_g
								    ->insert($db_ins_equi_g->quoteName('equipo_grupo'))
								    ->columns($db_ins_equi_g->quoteName($columns))
								    ->values(implode(',', $values));
								$db_ins_equi_g->setQuery($query_ins_equi_g);
								$db_ins_equi_g->execute();
							else:
								if($_POST['orden']!=""):
									if($_POST['tipo_grupo'] == 0 && $_POST['aEquipo'] != 0 && $numRows_eli_orden <= 0):
										
										$columns = array('id_equipo', 'id_grupo', 'orden');
										$values = array($_POST['aEquipo'], $_POST['idGrupo'], $_POST['orden']);
										$query_ins_equi_g
									    ->insert($db_ins_equi_g->quoteName('equipo_grupo'))
									    ->columns($db_ins_equi_g->quoteName($columns))
									    ->values(implode(',', $values));
									$db_ins_equi_g->setQuery($query_ins_equi_g);
									$db_ins_equi_g->execute();
									else:
										if($_POST['aEquipo'] == 0):
											$_SESSION['equipo_vacio'] = 1;
										endif;
										if(isset($_POST['orden'])):
										endif;
										if($numRows_eli_orden > 0):
											$_SESSION['orden_existe'] = 1;
										endif;								
										
									endif;
								else:
									$_SESSION['orden_vacio'] = 1;
								endif;								
							endif;
								 
										
						else:
						$_SESSION['campos_vacios'] = 1;						
						endif;
					else:
						$_SESSION['no_agrega'] = 1;
			    	endif;
				
			endif;
		endif;	
	

	if (isset($_POST['btnConfigG'])):
		if ($_POST['btnConfigG']):
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
	endif;

	if (isset($_POST['btnEliminarG'])):
		if ($_POST['btnEliminarG']):
	$db_eliminar_g = & JDatabase::getInstance( $option );
	
	$query_eliminar_g = $db_eliminar_g->getQuery(true);

	$query_eliminar_g->delete($db_eliminar_g->quoteName('partido_equipos')) 
		// ->join('INNER', $db_eliminar_g->quoteName('#__users', 'b') . ' ON (' . $db->quoteName('a.created_by') . ' = ' . $db->quoteName('b.id') . ')')
       ->where(array($db_eliminar_g->quoteName('id_partido') . ' IN 
       	(SELECT id_p FROM 
       		(SELECT partido_equipos.id_partido AS id_p 
       			FROM partido_equipos, partido, jornada, grupo 
       			WHERE partido_equipos.id_partido = partido.id_partido AND partido.id_jornada = jornada.id_jornada and grupo.id_grupo = jornada.id_grupo and grupo.id_grupo = '.$_POST['idGrupo'].')AS p)' )); 
	
	$db_eliminar_g->setQuery($query_eliminar_g);
	$db_eliminar_g->execute();	
	
	$query_eliminar_g = $db_eliminar_g->getQuery(true);

	$query_eliminar_g->delete($db_eliminar_g->quoteName('partido')) 
		// ->join('INNER', $db_eliminar_g->quoteName('#__users', 'b') . ' ON (' . $db->quoteName('a.created_by') . ' = ' . $db->quoteName('b.id') . ')')
       ->where(array($db_eliminar_g->quoteName('id_partido') . ' IN 
       	(SELECT id_p FROM 
       		(SELECT partido.id_partido AS id_p 
       			FROM partido, jornada, grupo 
       			WHERE partido.id_jornada = jornada.id_jornada and grupo.id_grupo = jornada.id_grupo and grupo.id_grupo = '.$_POST['idGrupo'].')AS p)' )); 
	
	$db_eliminar_g->setQuery($query_eliminar_g);
	$db_eliminar_g->execute();		

	$query_eliminar_g = $db_eliminar_g->getQuery(true);

	$query_eliminar_g->delete($db_eliminar_g->quoteName('jornada')) 
		// ->join('INNER', $db_eliminar_g->quoteName('#__users', 'b') . ' ON (' . $db->quoteName('a.created_by') . ' = ' . $db->quoteName('b.id') . ')')
       ->where(array($db_eliminar_g->quoteName('id_jornada') . ' IN 
       	(SELECT id_j FROM 
       		(SELECT jornada.id_jornada AS id_j 
       			FROM jornada, grupo 
       			WHERE grupo.id_grupo = jornada.id_grupo and grupo.id_grupo = '.$_POST['idGrupo'].')AS j)' )); 
	
	$db_eliminar_g->setQuery($query_eliminar_g);
	$db_eliminar_g->execute();		

	$query_eliminar_g = $db_eliminar_g->getQuery(true);

	$query_eliminar_g->delete($db_eliminar_g->quoteName('equipo_grupo')) 
		// ->join('INNER', $db_eliminar_g->quoteName('#__users', 'b') . ' ON (' . $db->quoteName('a.created_by') . ' = ' . $db->quoteName('b.id') . ')')
       ->where(array($db_eliminar_g->quoteName('id_grupo') . ' IN 
       	(SELECT id_g FROM 
       		(SELECT equipo_grupo.id_grupo AS id_g 
       			FROM equipo_grupo, grupo 
       			WHERE grupo.id_grupo = equipo_grupo.id_grupo and grupo.id_grupo = '.$_POST['idGrupo'].')AS j)' )); 
	
	$db_eliminar_g->setQuery($query_eliminar_g);
	$db_eliminar_g->execute();		

	$query_eliminar_g = $db_eliminar_g->getQuery(true);

	$query_eliminar_g->delete($db_eliminar_g->quoteName('grupo')) 
		// ->join('INNER', $db_eliminar_g->quoteName('#__users', 'b') . ' ON (' . $db->quoteName('a.created_by') . ' = ' . $db->quoteName('b.id') . ')')
       ->where(array($db_eliminar_g->quoteName('id_grupo') . ' = '.$_POST['idGrupo'])); 
	
	$db_eliminar_g->setQuery($query_eliminar_g);
	$db_eliminar_g->execute();		

	 	endif;
	endif;
	 
	 // delete from partido where id_partido in (select id_p from (select partido.id_partido as id_p from partido, jornada, grupo where partido.id_jornada = jornada.id_jornada and grupo.id_grupo = jornada.id_grupo and grupo.id_grupo = 1)as p);
				
	// $_SESSION['correcto'] = 1;
	// $_SESSION['id_torneo'] = $db_ins->insertid();	
	}catch(Exception $e){
		echo $e;		
	};
	// endif;
	// endif;
 ?> 