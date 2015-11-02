<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../calendario');
 	include "../conexion.php";

 	function sortearLiga(array $equipos, $numRows_eq, JDatabase $db_ins_part, $id_grupo, JDatabase $db_ins_jor){
		$partidos = array();
		$equipos_partido = array();
		$x = 0;
		$equipos_invertidos = array_reverse($equipos);		

		$cantidad_partidos = $numRows_eq*($numRows_eq-1)/2;			
			if($numRows_eq % 2 == 0):
				$cantidad_jornadas = $numRows_eq-1;	
				$partidos_ronda = $numRows_eq/2;
			else:
				$cantidad_jornadas = $numRows_eq;	
				$partidos_ronda = ($numRows_eq-1)/2;
			endif;

		for ($i=0; $i < $cantidad_jornadas; $i++):			
			$descr_jor = "Jornada ".($i+1);
			try{
			$query_ins_jor = $db_ins_jor->getQuery(true);
			$columns = array('descripcion','id_grupo', 'numero');
			$values = array($db_ins_jor->quote($descr_jor), $id_grupo, $i+1);
			$query_ins_jor
			    ->insert($db_ins_jor->quoteName('jornada'))
			    ->columns($db_ins_jor->quoteName($columns))
			    ->values(implode(',', $values));

			$db_ins_jor->setQuery($query_ins_jor);
			$db_ins_jor->execute();	
			$id_jornada = $db_ins_jor->insertid();
			}
			catch(Exception $e){
				echo $e;
			};

	 		for ($j=0; $j < $partidos_ronda; $j++):					
				$equipos_partido[0] = $equipos[$x];
				$equipos_partido[1] = $equipos_invertidos[$x];	
				$partidos[$j] = $equipos_partido;	
				try{
			$query_ins_part = $db_ins_part->getQuery(true);
			 
			// Insert columns.
			$columns = array('id_torneo', 'id_jornada');
			 
			// Insert values.
			$values = array($_SESSION['id_torneo'], $id_jornada);
			 
			// Prepare the insert query.
			$query_ins_part
			    ->insert($db_ins_part->quoteName('partido'))
			    ->columns($db_ins_part->quoteName($columns))
			    ->values(implode(',', $values));
			 
			// Set the query using our newly populated query object and execute it.
			$db_ins_part->setQuery($query_ins_part);
			$db_ins_part->execute();	
			$id_partido = $db_ins_part->insertid();

			$equipos_p = $partidos[$j];
				$query_ins_part = $db_ins_part->getQuery(true);
				 
				// Insert columns.
				$columns = array('id_equipo1', 'id_equipo2', 'id_partido');
				 
				// Insert values.
				$values = array($equipos_p[0]->id_eq, $equipos_p[1]->id_eq, $id_partido);
				 
				// Prepare the insert query.
				$query_ins_part
				    ->insert($db_ins_part->quoteName('partido_equipos'))
				    ->columns($db_ins_part->quoteName($columns))
				    ->values(implode(',', $values));
				 
				// Set the query using our newly populated query object and execute it.
				$db_ins_part->setQuery($query_ins_part);
				$db_ins_part->execute();
			}
			catch(Exception $e){
				echo $e;
			};			
				$x++;
			endfor;

			//Rotar arrays
			$primero = $equipos[0];
			$segundo = $equipos[1];

			if($numRows_eq % 2 == 0):
				for ($k=1; $k < $numRows_eq-1; $k++): 
					$equipos[$k] = $equipos[$k+1];
				endfor;
				$equipos[$numRows_eq-1] = $segundo;
				$equipos_invertidos = array_reverse($equipos);
				$x = 0;	
			else:
				for ($k=0; $k < $numRows_eq-1; $k++): 
					$equipos[$k] = $equipos[$k+1];
				endfor;
				$equipos[$numRows_eq-1] = $primero;
				$equipos_invertidos = array_reverse($equipos);
				$x = 0;	
			endif;

	 	endfor;
		
 	}

 	function sortearEliminatoria(array $equipos, $numRows_eq, JDatabase $db_ins_part, $id_grupo, JDatabase $db_ins_jor){
 			$cantidad_equipos = $numRows_eq;		
			$cantidad_partidos = $cantidad_equipos -1;			
			$cantidad_jornadas = ceil(log($cantidad_equipos, 2));			
			$preliminares = $cantidad_equipos - pow(2, floor(log($cantidad_equipos, 2)));
			$standby = $cantidad_equipos - $preliminares*2;			
			$partidos_potencia2 = $cantidad_equipos/2;
			$partidos_ronda2 = $standby + $preliminares;

			echo "Equipos:".$cantidad_equipos."<br>";
			echo "Partidos:".$cantidad_partidos."<br>";
			echo "Jornadas:".$cantidad_jornadas."<br>";
			echo "Preliminares:".$preliminares."<br>";
			echo "Espera:".$standby."<br>";
			echo "Partidos potencia 2: ".$partidos_potencia2."<br>";
			echo "Partidos ronda 2: ".$partidos_ronda2."<br>";

			$partidos = array();
			$equipos_partido = array();
			$nombre_jornadas() = array('Final', 'Semifinal', 'Cuartos de Final', 'Octavos de Final', 'Primera Ronda', 'Preliminares' );
			$x=0;
			$y=$cantidad_equipos-1;

			//Insertar primer jornada

			if($preliminares != 0):
			for ($j=0; $j < $preliminares; $j++):
				// $equipos_partido[0] = $equipos[$x];
				// $equipos_partido[1] = $equipos[$x+1];	
				// $partidos[$j] = $equipos_partido;
				//Metodo Insertar
				// $equipos_p = $partidos[$j];
				$partidos[$j] = $equipos[$x]."|".$equipos[$x+1];
				$x++;
				$x++;
				echo $partidos[$j]."<br>";
			endfor;			
			else:
				for ($j=0; $j < $partidos_potencia2; $j++):
				$partidos[$j] = $equipos[$x]."|".$equipos[$x+1];
				$x++;
				$x++;
				echo $partidos[$j]."<br>";
			endfor;
			endif;

			//Insertar el resto de partidos con sus jornadas
 	}

 	if(isset($_SESSION['id_torneo'])):

    $db_all_g = & JDatabase::getInstance( $option );
    $query_all_g = "SELECT *
    FROM grupo
    WHERE id_torneo =".$_SESSION['id_torneo']." ORDER BY id_grupo"; 
    $db_all_g->setQuery($query_all_g);
    $db_all_g->execute();
    $numRows_all_g = $db_all_g->getNumRows(); 
    $results_all_g = $db_all_g->loadObjectList();

    if(isset($_POST['btnAutoCalen'])):
    	if($_POST['btnAutoCalen']):
    		$db_eq = & JDatabase::getInstance( $option );
		    $query_eq = "SELECT equipo_grupo.id_equipo as id_eq
		    FROM equipo_grupo
		    WHERE equipo_grupo.id_grupo = ".$_POST['id_grupo'];  
		    $db_eq->setQuery($query_eq);
		    $db_eq->execute();
		    $numRows_eq = $db_eq->getNumRows(); 
		    $results_eq = $db_eq->loadObjectList();

		    if($_POST['tipo_grupo'] == 1):
		    	$db_liga_creada = & JDatabase::getInstance( $option );
			    $query_liga_creada = "SELECT count(partido.id_partido) as cant_partidos
			    FROM partido, jornada, grupo
			    WHERE grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada = partido.id_jornada AND grupo.id_grupo = ".$_POST['id_grupo'];  
			    $db_liga_creada->setQuery($query_liga_creada);
			    $db_liga_creada->execute();
			    $numRows_liga_creada = $db_liga_creada->getNumRows(); 
			    $results_liga_creada = $db_liga_creada->loadObjectList();
		    	if($results_liga_creada[0]->cant_partidos <= 0):
		    	$db_ins_part = & JDatabase::getInstance( $option );
		    	$db_ins_jor = & JDatabase::getInstance( $option );								
		    	$partidos_liga = sortearLiga($results_eq, $numRows_eq, $db_ins_part, $_POST['id_grupo'], $db_ins_jor);
		    	else:
		    		$_SESSION['grupo_creado'] = 1;
		    	endif;
		    endif;
			if($_POST['tipo_grupo'] == 0):
				$db_eli_creada = & JDatabase::getInstance( $option );
			    $query_eli_creada = "SELECT count(partido.id_partido) as cant_partidos
			    FROM partido, jornada, grupo
			    WHERE grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada = partido.id_jornada AND grupo.id_grupo = ".$_POST['id_grupo'];  
			    $db_eli_creada->setQuery($query_eli_creada);
			    $db_eli_creada->execute();
			    $numRows_eli_creada = $db_eli_creada->getNumRows(); 
			    $results_eli_creada = $db_eli_creada->loadObjectList();
			    if($results_liga_creada[0]->cant_partidos <= 0):
		    	$db_ins_part = & JDatabase::getInstance( $option );
		    	$db_ins_jor = & JDatabase::getInstance( $option );								
		    	$partidos_liga = sortearEliminatoria($results_eq, $numRows_eq, $db_ins_part, $_POST['id_grupo'], $db_ins_jor);
		    	else:
		    		$_SESSION['grupo_creado'] = 1;
		    	endif;
		    endif;
		 	
			endif;
    	endif;
  endif;

	if(isset($_POST['lista_jornadas'])):
		$_SESSION['id_jornada'] = $_POST['lista_jornadas'];
	$_SESSION['id_tab'] = $_POST['id_tab'];
	endif;
 ?> 