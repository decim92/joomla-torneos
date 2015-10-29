<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../definir-tor');
 	include "../conexion.php";

 	function sortearLiga(array $equipos){
 		$this->$equipos = $equipos;
		$partidos = array();

		foreach($players as $k){
		        foreach($players as $j){
		                if($k == $j){
		                        continue;
		                }
		                $z = array($k,$j);
		                sort($z);
		                if(!in_array($z,$partidos)){
		                        $partidos[] = $z;
		                }
		        }
		}

		return $partidos;
 	}

 	function sortearEliminatoria(array $equipos){
 		$cantidad_equipos = $_POST['numero_equipos'];		
			$cantidad_partidos = $cantidad_equipos -1;			
			$cantidad_jornadas = ceil(log($cantidad_equipos, 2));			
			$preliminares = $cantidad_equipos - pow(2, floor(log($cantidad_equipos, 2)));
			$standby = $cantidad_equipos - $preliminares*2;			
			$partidos_potencia2 = $cantidad_equipos/2;

			echo "Equipos:".$cantidad_equipos."<br>";
			echo "Partidos:".$cantidad_partidos."<br>";
			echo "Jornadas:".$cantidad_jornadas."<br>";
			echo "Preliminares:".$preliminares."<br>";
			echo "Espera:".$standby."<br>";

			$x=0;
			$y=$cantidad_equipos-1;

			if($preliminares != 0):
			for ($j=0; $j < $preliminares; $j++):
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

    $db_e = & JDatabase::getInstance( $option );
    $query_e = "SELECT *
    FROM grupo
    WHERE id_torneo =".$_SESSION['id_torneo']." AND tipo_grupo = 0";  
    $db_e->setQuery($query_e);
    $db_e->execute();
    $numRows_e = $db_e->getNumRows(); 
    $results_e = $db_e->loadObjectList();

    $db_l = & JDatabase::getInstance( $option );
    $query_l = "SELECT *
    FROM grupo
    WHERE id_torneo =".$_SESSION['id_torneo']." AND tipo_grupo = 1";  
    $db_l->setQuery($query_l);
    $db_l->execute();
    $numRows_l = $db_l->getNumRows(); 
    $results_l = $db_l->loadObjectList();

    if($_POST['']):

    endif;
  else:
    echo "<p>WTF</p>";
  endif;

	// $_SESSION['categ']= $_POST['listaCate'];
	// $_SESSION['descrip']= $_POST['descripcion'];
	// $_SESSION['ubica']= $_POST['pac-input'];
	// $array_deporte= $_POST['listaDeporte'];
	// $deporte_explode = explode('|', $array_deporte);
	// $_SESSION['deport']= $deporte_explode[1];
	// $_SESSION['individual']= $deporte_explode[0];

 	// if(isset($_REQUEST["btnCrearTorneo"])):
	// if($validacion == 1):
	if($_POST['descripcion'] != "" && $_POST['pac-input'] != ""):
	try{
		$db_ins = & JDatabase::getInstance( $option );
	$user = JFactory::getUser();
	$query_ins = $db_ins->getQuery(true);
	 
	// Insert columns.
	$columns = array('id_usuario', 'id_categoria', 'id_deporte', 'descripcion', 'ubicacion');
	 
	// Insert values.
	$values = array($user->id,$_POST['listaCate'],$_SESSION['deport'], $db_ins->quote($_POST['descripcion']), $db_ins->quote($_POST['pac-input']));
	 
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