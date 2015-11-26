<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">   -->
<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/my_navbars.css">
    <link rel="stylesheet" href="css/jasny-bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
</head>
	<script type="text/javascript" src="../media/jui/js/jquery.js"></script>
	 <style>
	 	.img-circle{
	 		background:rgba(255,255,255,1);
	 	}
		
	 	.jumbotron{
			background: -webkit-linear-gradient(#3F7AFF, #B8D7F1); /* For Safari 5.1 to 6.0 */
			  background: -o-linear-gradient(#3F7AFF, #B8D7F1); /* For Opera 11.1 to 12.0 */
			  background: -moz-linear-gradient(#3F7AFF, #B8D7F1); /* For Firefox 3.6 to 15 */
			  background: linear-gradient(#3F7AFF, #B8D7F1); /* Standard syntax */
			  border-radius: 5px;
	 	}

	 	h2, h4, h3{
	 		color: white;
	 		text-shadow: 3px 3px 5px #000;
	 	}

	 	.sp{
	 		font-weight: bolder;
	 	}
	 </style>

	 
<?php
	session_start();
	include"conexion.php";
	if(isset($_SESSION['id_tor'])):
		$id_torneo = $_SESSION['id_tor'];
	unset($_SESSION['id_tor']);
	elseif(isset($_GET['id_torneo'])):
		$id_torneo = $_GET['id_torneo'];
	endif;
	if(isset($id_torneo)):
	
	// $cn = mysqli_connect("localhost", "root", "12345", "torneos") or die ("ERROR AL INTENTAR CONECTAR");
		$db_torneo_publico = & JDatabase::getInstance( $option );
		$user = JFactory::getUser();
		$query_torneo_publico = "SELECT torneo.descripcion as descr_torneo, ubicacion, categoria.descripcion as descr_categoria, deporte.nombre as nombre_deporte, publicado, puntos_p, puntos_g, puntos_e   
						FROM torneo, categoria, deporte 
						WHERE deporte.id_deporte = torneo.id_deporte AND categoria.id_categoria = torneo.id_categoria AND id_torneo = ".$id_torneo." AND estado = 1 ORDER BY torneo.descripcion";	
		$db_torneo_publico->setQuery($query_torneo_publico);
		$db_torneo_publico->execute();	
		$results_torneo_publico = $db_torneo_publico->loadObjectList();
	// $query_torneo = mysqli_query($cn, "SELECT torneo.descripcion as descr_torneo, ubicacion, categoria.descripcion as descr_categoria, deporte.nombre as nombre_deporte, publicado, puntos_p, puntos_g, puntos_e   
	// 					FROM torneo, categoria, deporte 
	// 					WHERE deporte.id_deporte = torneo.id_deporte AND categoria.id_categoria = torneo.id_categoria AND id_torneo = ".$_GET['id_torneo']." AND estado = 1 ORDER BY torneo.descripcion");
	// $line = mysqli_fetch_array($query_torneo);
?>

<body>
	<div class="jumbotron ">
		<div class="container">
			<div class="row">
			  <div class="col-xs-4 col-sm-4" style="margin-bottom: 30px">
			    
			    <?php
			    if(file_exists("img/torneos/".$id_torneo.".png")):
			      echo "<img src='img/torneos/".$id_torneo.".png' alt='' width='200px' height='200px' class='img-circle'>";
			    elseif(file_exists("img/torneos/".$id_torneo.".jpg")):
			      echo "<img src='img/torneos/".$id_torneo.".jpg' alt='' width='200px' height='200px' class='img-circle'>";
			    else:
			      echo "<img src='img/torneos/trophy.png' alt='' width='200px' height='200px' class='img-circle'>";
			    endif;
			    ?>
			  </div>
			    <h2><?php echo $results_torneo_publico[0]->descr_torneo;?></h2>
			    <h4><?php echo $results_torneo_publico[0]->nombre_deporte;?></h4>
			    <h4><?php echo $results_torneo_publico[0]->descr_categoria;?></h4>
			    <h3><span class="sp"><?php echo $user->username;?></span></h3>
			</div>
			
			<div role="tabpanel">
			    <!-- Nav tabs -->
			    <ul class="nav nav-tabs" role="tablist">
			        <li role="presentation" class="active">
			            <a href="#pnl-resumen" aria-controls="home" role="tab" data-toggle="tab" style="color:black;">Resumen</a>
			        </li>
			        <li role="presentation">
			            <a href="#pnl-clasificacion" aria-controls="tab" role="tab" data-toggle="tab" style="color:black;">Clasificación</a>
			        </li>
			        <li role="presentation">
			            <a href="#pnl-calendario" aria-controls="tab" role="tab" data-toggle="tab" style="color:black;">Calendario</a>
			        </li>
			    </ul>
			</div>
		</div>
	</div>
	<div class="container">
			    <!-- Tab panes -->
			    <!-- Tab Resumen -->
			    <?php

			    //$query_cal_creada = "SELECT count(partido.id_partido) as cant_partidos
			    // FROM partido, jornada, grupo
			    // WHERE grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada = partido.id_jornada AND grupo.id_grupo = ".$_POST['id_grupo']." AND torneo.id_torneo = ".$_GET['id_torneo'];  

			    $db_cal_creada = & JDatabase::getInstance( $option );
			    $query_cal_creada = "SELECT count(partido.id_partido) as cant_partidos
			    FROM partido
			    WHERE partido.id_torneo = ".$id_torneo;  
			    $db_cal_creada->setQuery($query_cal_creada);
			    $db_cal_creada->execute();
			    $numRows_cal_creada = $db_cal_creada->getNumRows(); 
			    $results_cal_creada = $db_cal_creada->loadObjectList();

			    if($results_cal_creada[0]->cant_partidos > 0):
			    ?>
			    <div class="tab-content">
			        <div role="tabpanel" class="tab-pane active" id="pnl-resumen">
			<!--         	<div class="container">
				    	<form id="resumen" class="col-sm-3" role='form' action="validaciones/v_torneos_publicos.php" target="_parent" method="post">
				    		<input type="hidden" name="id_tor" value="<?php echo $id_torneo;?>">
				    		<div class="form-group">
					    		<label class="control-label" for="resumen">Mostrar Resumen de</label>
						    	<select class='form-control select-size-small' id='cmb_grupos' name='cmb_grupos' onchange='this.form.submit()'>
						    		<option value="0">Todo el Torneo</option>
						    	<?php
						    		$db_grupos = & JDatabase::getInstance( $option );
								    $query_grupos = "SELECT grupo.id_grupo as id_g, grupo.descripcion as descr_grupo
								    FROM grupo
								    WHERE grupo.id_torneo = ".$id_torneo;  
								    $db_grupos->setQuery($query_grupos);
								    $db_grupos->execute();
								    $numRows_grupos = $db_grupos->getNumRows(); 
								    $results_grupos = $db_grupos->loadObjectList();	

								    for ($i=0; $i < $numRows_grupos ; $i++):
								    	echo "<option ";
								    	if(isset($_SESSION['grupo_select'])):
								    		if($_SESSION['grupo_select'] == $results_grupos[$i]->id_g):
								    			echo "selected";
								    		endif;								    		
								    	endif;
								    	 echo" value='".$results_grupos[$i]->id_g."'>".$results_grupos[$i]->descr_grupo."</option>";
								    endfor;
								   	
						    	?>						    		
						    	</select>
					    	</div>
						</form>
					</div>
			        	<div class="panel panel-default">
						  <div class="panel-heading">
						    <h3 style="text-shadow: none;" class="panel-title"><strong>Últimos Resultados</strong></h3>
						  </div>
						  <div class="panel-body">
						  <?php
						  	$db_ultimos_r = & JDatabase::getInstance( $option );

						  	if(isset($_SESSION['grupo_select'])):
						  		if($_SESSION['grupo_select'] == 0):
								    $query_ultimos_r = "SELECT id_equipo1, id_equipo2, partido_equipos.id_partido as id_p, e1.nombre as nombre_equipo1, e2.nombre as nombre_equipo2, tantos1, tantos2, grupo.descripcion as descr_grupo, partido.fecha as p_fecha
														FROM partido_equipos, equipo as e1, equipo as e2, partido, jornada, grupo
														WHERE e1.id_equipo = partido_equipos.id_equipo1 and e2.id_equipo = partido_equipos.id_equipo2 AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND jornada.id_grupo = grupo.id_grupo AND tantos1 >= 0 AND partido.id_torneo = ".$id_torneo." ORDER BY partido.fecha DESC LIMIT 10";  
						  		else:
						  			$query_ultimos_r = "SELECT id_equipo1, id_equipo2, partido_equipos.id_partido as id_p, e1.nombre as nombre_equipo1, e2.nombre as nombre_equipo2, tantos1, tantos2, partido.fecha as p_fecha
														FROM partido_equipos, equipo as e1, equipo as e2, partido, jornada
														WHERE e1.id_equipo = partido_equipos.id_equipo1 and e2.id_equipo = partido_equipos.id_equipo2  AND  partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND tantos1 >= 0 AND  jornada.id_grupo = ".$_SESSION['grupo_select']." AND partido.id_torneo = ".$id_torneo." ORDER BY partido.fecha DESC LIMIT 5";   
							  	endif;
							else:
								$query_ultimos_r = "SELECT id_equipo1, id_equipo2, partido_equipos.id_partido as id_p, e1.nombre as nombre_equipo1, e2.nombre as nombre_equipo2, tantos1, tantos2, grupo.descripcion as descr_grupo, partido.fecha as p_fecha
														FROM partido_equipos, equipo as e1, equipo as e2, partido, jornada, grupo
														WHERE e1.id_equipo = partido_equipos.id_equipo1 and e2.id_equipo = partido_equipos.id_equipo2 AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND jornada.id_grupo = grupo.id_grupo AND tantos1 >= 0 AND partido.id_torneo = ".$id_torneo." ORDER BY partido.fecha DESC LIMIT 10";  
						  	endif;

						  	$db_ultimos_r->setQuery($query_ultimos_r);
						    $db_ultimos_r->execute();
						    $numRows_ultimos_r = $db_ultimos_r->getNumRows(); 
						    $results_ultimos_r = $db_ultimos_r->loadObjectList();	
						  ?>
						    <table class="table table-striped table-hover center-text">
						    	<thead>
						    		<tr>
						    		<?php
						    			if(isset($_SESSION['grupo_select'])):
						  					if($_SESSION['grupo_select'] == 0):
						  						echo "<th style='text-align: left;' class='col-sm-2'>Grupo</th>";
						  					endif;
						  				else:
						  					echo "<th style='text-align: left;' class='col-sm-2'>Grupo</th>";
						  				endif;
						    		?>
						    			
						    			<th style="text-align: left;" class="col-sm-2">Equipo 1</th>
						    			<th></th>
						    			<th style="text-align: right;" class="col-sm-2">Equipo 2</th>
						    		</tr>
						    	</thead>
						    	<tbody>
						    		<?php
						    		for ($i=0; $i < $numRows_ultimos_r; $i++): 
						    			if(isset($_SESSION['grupo_select'])):
						  					if($_SESSION['grupo_select'] == 0):
						  						echo "
						  				<tr>
						  				<td style='text-align: left;'>".$results_ultimos_r[$i]->descr_grupo."</td>
							    		<td style='text-align: left;'>";

							    			if(file_exists("img/escudos/".$results_ultimos_r[$i]->id_equipo1.".png")):
										      echo "<img src='img/escudos/".$results_ultimos_r[$i]->id_equipo1.".png' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    elseif(file_exists("img/escudos/".$results_ultimos_r[$i]->id_equipo1.".jpg")):
										      echo "<img src='img/escudos/".$results_ultimos_r[$i]->_id_equipo1.".jpg' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    else:
										      echo "<img src='img/escudos/base.png' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    endif;

							    			echo $results_ultimos_r[$i]->nombre_equipo1."</td>
							    			<td><strong>".$results_ultimos_r[$i]->tantos1." - ".$results_ultimos_r[$i]->tantos2."</strong></td>
							    			<td style='text-align: right;'>".$results_ultimos_r[$i]->nombre_equipo2;
							    			if(file_exists("img/escudos/".$results_ultimos_r[$i]->id_equipo2.".png")):
										      echo "<img src='img/escudos/".$results_ultimos_r[$i]->id_equipo2.".png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    elseif(file_exists("img/escudos/".$results_ultimos_r[$i]->id_equipo2.".jpg")):
										      echo "<img src='img/escudos/".$results_ultimos_r[$i]->_id_equipo2.".jpg' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    else:
										      echo "<img src='img/escudos/base.png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    endif;
							    		echo "</td>
						    				</tr>";
						    				else:
						    					echo "
						  				<tr>
							    			<td style='text-align: left;'>";
							    			if(file_exists("img/escudos/".$results_ultimos_r[$i]->id_equipo1.".png")):
										      echo "<img src='img/escudos/".$results_ultimos_r[$i]->id_equipo1.".png' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    elseif(file_exists("img/escudos/".$results_ultimos_r[$i]->id_equipo1.".jpg")):
										      echo "<img src='img/escudos/".$results_ultimos_r[$i]->_id_equipo1.".jpg' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    else:
										      echo "<img src='img/escudos/base.png' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    endif;

							    			echo $results_ultimos_r[$i]->nombre_equipo1."</td>
							    			<td><strong>".$results_ultimos_r[$i]->tantos1." - ".$results_ultimos_r[$i]->tantos2."</strong></td>
							    			<td style='text-align: right;'>".$results_ultimos_r[$i]->nombre_equipo2;
							    			if(file_exists("img/escudos/".$results_ultimos_r[$i]->id_equipo2.".png")):
										      echo "<img src='img/escudos/".$results_ultimos_r[$i]->id_equipo2.".png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    elseif(file_exists("img/escudos/".$results_ultimos_r[$i]->id_equipo2.".jpg")):
										      echo "<img src='img/escudos/".$results_ultimos_r[$i]->_id_equipo2.".jpg' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    else:
										      echo "<img src='img/escudos/base.png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    endif;
							    		echo "</td>
						    			</tr>";
						  					endif;
						  				else:
						  						echo "
						  				<tr>
							    			<td style='text-align: left;'>".$results_ultimos_r[$i]->descr_grupo."</td>
							    			<td style='text-align: left;'>".$results_ultimos_r[$i]->nombre_equipo1."</td>
							    			<td><strong>".$results_ultimos_r[$i]->tantos1." - ".$results_ultimos_r[$i]->tantos2."</strong></td>
							    			<td style='text-align: right;'>".$results_ultimos_r[$i]->nombre_equipo2;
							    			if(file_exists("img/escudos/".$results_ultimos_r[$i]->id_equipo2.".png")):
										      echo "<img src='img/escudos/".$results_ultimos_r[$i]->id_equipo2.".png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    elseif(file_exists("img/escudos/".$results_ultimos_r[$i]->id_equipo2.".jpg")):
										      echo "<img src='img/escudos/".$results_ultimos_r[$i]->_id_equipo2.".jpg' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    else:
										      echo "<img src='img/escudos/base.png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    endif;
							    		echo "</td>
						    			</tr>";
						  				endif;
						    		endfor;
						    		?>
						    	</tbody>
						    </table>
						  </div>
						</div>

						<div class="panel panel-default">
						  <div class="panel-heading">
						    <h3 style="text-shadow: none;" class="panel-title"><strong>Próximos Partidos</strong></h3>
						  </div>
						  <div class="panel-body">
						  <?php
						  	$db_proximos_p = & JDatabase::getInstance( $option );

						  	if(isset($_SESSION['grupo_select'])):
						  		if($_SESSION['grupo_select'] == 0):
								    $query_proximos_p = "SELECT id_equipo1, id_equipo2, partido_equipos.id_partido as id_p, e1.nombre as nombre_equipo1, e2.nombre as nombre_equipo2, grupo.descripcion as descr_grupo, partido.fecha as p_fecha, partido.hora as p_hora, partido.lugar as p_lugar
														FROM partido_equipos, equipo as e1, equipo as e2, partido, jornada, grupo
														WHERE e1.id_equipo = partido_equipos.id_equipo1 and e2.id_equipo = partido_equipos.id_equipo2 AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND jornada.id_grupo = grupo.id_grupo AND tantos1 IS NULL AND partido.jugado = 0 AND partido.fecha >= '0000-00-00' AND (NOT id_equipo1 = 26 OR NOT id_equipo2 = 26) AND  partido.id_torneo = ".$id_torneo." ORDER BY partido.fecha ASC LIMIT 5";  
						  		else:
						  			$query_proximos_p = "SELECT id_equipo1, id_equipo2, partido_equipos.id_partido as id_p, e1.nombre as nombre_equipo1, e2.nombre as nombre_equipo2, partido.fecha as p_fecha, partido.hora as p_hora, partido.lugar as p_lugar
														FROM partido_equipos, equipo as e1, equipo as e2, partido, jornada
														WHERE e1.id_equipo = partido_equipos.id_equipo1 and e2.id_equipo = partido_equipos.id_equipo2  AND  partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND tantos1 IS NULL AND partido.jugado = 0 AND partido.fecha >= '0000-00-00' AND (NOT id_equipo1 = 26 OR NOT id_equipo2 = 26) AND  jornada.id_grupo = ".$_SESSION['grupo_select']." AND partido.id_torneo = ".$id_torneo." ORDER BY partido.fecha ASC LIMIT 5";   
							  	endif;
							else:
								$query_proximos_p = "SELECT id_equipo1, id_equipo2, partido_equipos.id_partido as id_p, e1.nombre as nombre_equipo1, e2.nombre as nombre_equipo2, grupo.descripcion as descr_grupo, partido.fecha as p_fecha, partido.hora as p_hora, partido.lugar as p_lugar
														FROM partido_equipos, equipo as e1, equipo as e2, partido, jornada, grupo
														WHERE e1.id_equipo = partido_equipos.id_equipo1 and e2.id_equipo = partido_equipos.id_equipo2 AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND jornada.id_grupo = grupo.id_grupo AND tantos1 IS NULL AND partido.jugado = 0 AND partido.fecha >= '0000-00-00' AND (NOT id_equipo1 = 26 OR NOT id_equipo2 = 26) AND partido.id_torneo = ".$id_torneo." ORDER BY partido.fecha ASC LIMIT 5";  
						  	endif;

						  	$db_proximos_p->setQuery($query_proximos_p);
						    $db_proximos_p->execute();
						    $numRows_proximos_p = $db_proximos_p->getNumRows(); 
						    $results_proximos_p = $db_proximos_p->loadObjectList();	
						  ?>
						    <table class="table table-striped table-hover center-text">
						    	<thead>
						    		<tr>
						    		<?php
						    			if(isset($_SESSION['grupo_select'])):
						  					if($_SESSION['grupo_select'] == 0):
						  						echo "<th style='text-align: left;' class='col-sm-2'>Grupo</th>";
						  					endif;
						  				else:
						  					echo "<th style='text-align: left;' class='col-sm-2'>Grupo</th>";
						  				endif;
						    		?>
						    			
						    			<th style="text-align: left;" class="col-sm-2">Equipo 1</th>
						    			<th>Fecha</th>
						    			<th style="text-align: right;" class="col-sm-2">Equipo 2</th>
						    		</tr>
						    	</thead>
						    	<tbody>
						    		<?php
						    		for ($i=0; $i < $numRows_proximos_p; $i++): 
						    			if(isset($_SESSION['grupo_select'])):
						  					if($_SESSION['grupo_select'] == 0):
						  						echo "
						  				<tr>
						  				<td style='text-align: left;'>".$results_proximos_p[$i]->descr_grupo."</td>
							    		<td style='text-align: left;'>";

							    			if(file_exists("img/escudos/".$results_proximos_p[$i]->id_equipo1.".png")):
										      echo "<img src='img/escudos/".$results_proximos_p[$i]->id_equipo1.".png' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    elseif(file_exists("img/escudos/".$results_proximos_p[$i]->id_equipo1.".jpg")):
										      echo "<img src='img/escudos/".$results_proximos_p[$i]->_id_equipo1.".jpg' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    else:
										      echo "<img src='img/escudos/base.png' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    endif;

							    			echo $results_proximos_p[$i]->nombre_equipo1."</td>
							    			<td><strong>".$results_proximos_p[$i]->p_fecha."</strong></td>
							    			<td style='text-align: right;'>".$results_proximos_p[$i]->nombre_equipo2;
							    			if(file_exists("img/escudos/".$results_proximos_p[$i]->id_equipo2.".png")):
										      echo "<img src='img/escudos/".$results_proximos_p[$i]->id_equipo2.".png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    elseif(file_exists("img/escudos/".$results_proximos_p[$i]->id_equipo2.".jpg")):
										      echo "<img src='img/escudos/".$results_proximos_p[$i]->_id_equipo2.".jpg' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    else:
										      echo "<img src='img/escudos/base.png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    endif;
							    		echo "</td>
						    				</tr>";
						    				else:
						    					echo "
						  				<tr>
							    			<td style='text-align: left;'>";
							    			if(file_exists("img/escudos/".$results_proximos_p[$i]->id_equipo1.".png")):
										      echo "<img src='img/escudos/".$results_proximos_p[$i]->id_equipo1.".png' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    elseif(file_exists("img/escudos/".$results_proximos_p[$i]->id_equipo1.".jpg")):
										      echo "<img src='img/escudos/".$results_proximos_p[$i]->_id_equipo1.".jpg' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    else:
										      echo "<img src='img/escudos/base.png' alt='' width='25px' height='25px' style='margin-right:30px;'>";
										    endif;

							    			echo $results_proximos_p[$i]->nombre_equipo1."</td>
							    			<td><strong>".$results_proximos_p[$i]->p_fecha."</strong></td>
							    			<td style='text-align: right;'>".$results_proximos_p[$i]->nombre_equipo2;
							    			if(file_exists("img/escudos/".$results_proximos_p[$i]->id_equipo2.".png")):
										      echo "<img src='img/escudos/".$results_proximos_p[$i]->id_equipo2.".png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    elseif(file_exists("img/escudos/".$results_proximos_p[$i]->id_equipo2.".jpg")):
										      echo "<img src='img/escudos/".$results_proximos_p[$i]->_id_equipo2.".jpg' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    else:
										      echo "<img src='img/escudos/base.png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    endif;
							    		echo "</td>
						    			</tr>";
						  					endif;
						  				else:
						  						echo "
						  				<tr>
							    			<td style='text-align: left;'>".$results_proximos_p[$i]->descr_grupo."</td>
							    			<td style='text-align: left;'>".$results_proximos_p[$i]->nombre_equipo1."</td>
							    			<td><strong>".$results_proximos_p[$i]->p_fecha."</strong></td>
							    			<td style='text-align: right;'>".$results_proximos_p[$i]->nombre_equipo2;
							    			if(file_exists("img/escudos/".$results_proximos_p[$i]->id_equipo2.".png")):
										      echo "<img src='img/escudos/".$results_proximos_p[$i]->id_equipo2.".png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    elseif(file_exists("img/escudos/".$results_proximos_p[$i]->id_equipo2.".jpg")):
										      echo "<img src='img/escudos/".$results_proximos_p[$i]->_id_equipo2.".jpg' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    else:
										      echo "<img src='img/escudos/base.png' alt='' width='25px' height='25px' style='margin-left:30px;'>";
										    endif;
							    		echo "</td>
						    			</tr>";
						  				endif;
						    		endfor;
						    		?>
						    	</tbody>
						    </table>
						  </div>
						</div>-->

			        </div> 

			       <!-- Tab Resumen End -->
			       <!-- Tab Clasificacion -->
			        <div role="tabpanel" class="tab-pane" id="pnl-clasificacion">
			        	<div class="container">
					    	<form id="clasif" class="col-sm-3" role='form' action="">
					    		<div class="form-group">
						    		<label class="control-label" for="clasif">Mostrar Clasificación de</label>
							    	<select class='form-control select-size-small' id='clasif' name='clasif' onchange='this.form.submit()'>
							    		<option value="0">Todo el Torneo</option>
							    	</select>
						    	</div>
							</form>
						</div>

			        </div>
			        <!-- Tab Clasificacion end-->
			        <!-- Tab Calendario -->
			        <div role="tabpanel" class="tab-pane" id="pnl-calendario">
						<div class="container">
					    	<form id="clasif" class="col-sm-3" role='form' action="">
					    		<div class="form-group">
						    		<label class="control-label" for="clasif">Mostrar Jornada</label>
							    	<select class='form-control select-size-small' id='clasif' name='clasif' onchange='this.form.submit()'>
							    		<option value="0">Todas las Jornadas</option>
							    	</select>
						    	</div>
							</form>
						</div>

			        </div>
			        <!-- Tab Calendario end-->
			    </div>
			    <!-- Tab end content-->
	</div>
<?php
	else:
		echo "<div class='alert alert-warning col-xs-12 col-sm-12' role='alert'>No se ha creado ningún calendario</div>";
	endif;
	else:
		echo "<div class='alert alert-warning col-xs-12 col-sm-12' role='alert'>Seleccione un Torneo de la pestaña \"Torneos Públicos\"</div>";
	endif;
?>
</body>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jasny-bootstrap.min.js"></script>
</html>