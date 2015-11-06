<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../calendario');
 	include "../conexion.php";

 	if(isset($_POST['btnPartido'])):
 		if($_POST['btnPartido']):
 			if($_POST['tantos1'] != "" && $_POST['tantos2'] != ""):
 				try{
					$db_act_p = & JDatabase::getInstance( $option );
					//Actualizar resultados

					$query_act_p = $db_act_p->getQuery(true);

					$fields = array(
						$db_act_p->quoteName('tantos1') . ' = ' . $db_act_p->quote($_POST['tantos1']),
						$db_act_p->quoteName('tantos2') . ' = ' . $db_act_p->quote($_POST['tantos2'])						
						);
					$conditions = array(
						$db_act_p->quoteName('id_partido') . ' = ' . $_POST['id_partido']
						);
					 
					$query_act_p
					    ->update($db_act_p->quoteName('partido_equipos'))
					    ->set($fields)
					    ->where($conditions);
					$db_act_p->setQuery($query_act_p);
					$db_act_p->execute();	
//Actualizar estados fechas etc.
					$query_act_p = $db_act_p->getQuery(true);

						if($_POST['tantos1'] == $_POST['tantos2']):
							
							$fields = array(
								$db_act_p->quoteName('fecha') . ' = ' . $db_act_p->quote($_POST['fecha']),
								$db_act_p->quoteName('hora') . ' = ' . $db_act_p->quote($_POST['hora']),
								$db_act_p->quoteName('lugar') . ' = ' . $db_act_p->quote($_POST['pac-input']),
								$db_act_p->quoteName('id_ganador') . ' = ' . 0,
								$db_act_p->quoteName('id_perdedor') . ' = ' . 0,
								$db_act_p->quoteName('empatado') . ' = ' . 1,		
								$db_act_p->quoteName('jugado') . ' = ' . 1
							);
						elseif($_POST['tantos1'] > $_POST['tantos2']):
							$fields = array(
								$db_act_p->quoteName('fecha') . ' = ' . $db_act_p->quote($_POST['fecha']),
								$db_act_p->quoteName('hora') . ' = ' . $db_act_p->quote($_POST['hora']),
								$db_act_p->quoteName('lugar') . ' = ' . $db_act_p->quote($_POST['pac-input']),
								$db_act_p->quoteName('id_ganador') . ' = ' . $db_act_p->quote($_POST['id_equipo1']),
								$db_act_p->quoteName('id_perdedor') . ' = ' . $db_act_p->quote($_POST['id_equipo2']),		
								$db_act_p->quoteName('jugado') . ' = ' . 1
							);
							
						elseif($_POST['tantos1'] < $_POST['tantos2']):

							$fields = array(
								$db_act_p->quoteName('fecha') . ' = ' . $db_act_p->quote($_POST['fecha']),
								$db_act_p->quoteName('hora') . ' = ' . $db_act_p->quote($_POST['hora']),
								$db_act_p->quoteName('lugar') . ' = ' . $db_act_p->quote($_POST['pac-input']),
								$db_act_p->quoteName('id_ganador') . ' = ' . $db_act_p->quote($_POST['id_equipo2']),
								$db_act_p->quoteName('id_perdedor') . ' = ' . $db_act_p->quote($_POST['id_equipo1']),		
								$db_act_p->quoteName('jugado') . ' = ' . 1		
								
							);
							
						endif;

					
					$conditions = array(
						$db_act_p->quoteName('id_partido') . ' = ' . $_POST['id_partido']
						);
					 
					$query_act_p
					    ->update($db_act_p->quoteName('partido'))
					    ->set($fields)
					    ->where($conditions);
					$db_act_p->setQuery($query_act_p);
					$db_act_p->execute();

					$db_tg = & JDatabase::getInstance( $option );
				    $query_tg = "SELECT grupo.tipo_grupo as tipo_g 
				    FROM grupo 
				    WHERE id_grupo = (SELECT grupo.id_grupo as id_g FROM grupo, jornada, partido WHERE grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada = partido.id_jornada AND partido.id_partido = ".$_POST['id_partido'].")"; 
				    $db_tg->setQuery($query_tg);
				    $db_tg->execute();
				    $results_tg = $db_tg->loadObjectList();

				    if($results_tg[0]->tipo_g == 1):

				    elseif($results_tg[0]->tipo_g == 0):

				    	//llamo jornada de partido

				    	$db_jor_p = & JDatabase::getInstance( $option );
					    $query_jor_p = "SELECT partido.id_jornada as id_jor_p 
					    FROM partido 
					    WHERE id_partido = ".$_POST['id_partido'];
					    $db_jor_p->setQuery($query_jor_p);
					    $db_jor_p->execute();
					    $results_jor_p = $db_jor_p->loadObjectList();

					    //llamo jornadas del grupo

				    	$db_jor = & JDatabase::getInstance( $option );
					    $query_jor = "SELECT jornada.id_jornada as id_j 
					    FROM jornada 
					    WHERE id_grupo = (SELECT grupo.id_grupo as id_g FROM grupo, jornada, partido WHERE grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada = partido.id_jornada AND partido.id_partido = ".$_POST['id_partido'].")"; 
					    $db_jor->setQuery($query_jor);
					    $db_jor->execute();
					    $numRows_jor = $db_jor->getNumRows(); 
					    $results_jor = $db_jor->loadObjectList();

					    //La operacion
					    
					    for ($i= 0; $i < $numRows_jor; $i++):
					    	if(isset($results_jor[$i-1]->id_j)):
					    		$db_partidos_j = & JDatabase::getInstance( $option );
							    $query_partidos_j = "SELECT partido.id_partido as id_partido_j
							    FROM partido 
							    WHERE id_jornada = ".$results_jor[$i-1]->id_j; 
							    $db_partidos_j->setQuery($query_partidos_j);
							    $db_partidos_j->execute();
							    $numRows_partidos_j = $db_partidos_j->getNumRows(); 
							    $results_partidos_j = $db_partidos_j->loadObjectList();
					    	
					    	
					    	$partidos_sig_jor = array();

					    	for ($n=0; $n < $numRows_partidos_j; $n++):
					    		$partidos_sig_jor[$n] = $results_partidos_j[$n]->id_partido_j;
					    	endfor;
					    	endif;

					    	if($results_jor_p[0]->id_jor_p == $results_jor[$i]->id_j):

					    		$db_ganadores = & JDatabase::getInstance( $option );
							    $query_ganadores = "SELECT partido.id_ganador as id_gana 
							    FROM partido 
							    WHERE id_jornada = ".$results_jor_p[0]->id_jor_p;
							    $db_ganadores->setQuery($query_ganadores);
							    $db_ganadores->execute();
							    $numRows_ganadores = $db_ganadores->getNumRows(); 
							    $results_ganadores = $db_ganadores->loadObjectList();

					    		for ($j=0; $j < $numRows_ganadores; $j++):
					    			//hacer
					    			
						    		$db_act_pos = & JDatabase::getInstance( $option );
									//Actualizar posiciones

									$query_act_pos = $db_act_pos->getQuery(true);

									$sig_pos = $j/2;
									echo $sig_pos. "sp<br> ";
									echo $j+0.5. "j+<br> ";

									if($sig_pos == $j && $j % 2 == 0):
										$fields = array(
										$db_act_pos->quoteName('id_equipo1') . ' = ' . $results_ganadores[$j]->id_gana										
										);	

									$conditions = array(
										$db_act_pos->quoteName('id_partido') . ' = ' . $partidos_sig_jor[$sig_pos]. ' AND id_equipo1 = 26'
										);

									else:
										$fields = array(
										$db_act_pos->quoteName('id_equipo2') . ' = ' . $results_ganadores[$j]->id_gana										
										);	

									$conditions = array(
										$db_act_pos->quoteName('id_partido') . ' = ' . $partidos_sig_jor[$sig_pos]. ' AND id_equipo2 = 26'
										);

									endif;
									
									
									 
									$query_act_pos
									    ->update($db_act_pos->quoteName('partido_equipos'))
									    ->set($fields)
									    ->where($conditions);
									$db_act_pos->setQuery($query_act_pos);
									$db_act_pos->execute();	
					    		endfor;
					    	endif;	
					    endfor;
				    endif;
					$_SESSION['partido_a'] = 1;
				}catch(Exception $e){
					echo "Error";	
				}


 			endif;
 		endif;
 	endif;
?>