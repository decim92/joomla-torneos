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
			        <li role="presentation" 
			        <?php 
			        	if(isset($_SESSION['id_tabx'])):
			        		if($_SESSION['id_tabx'] == 0):
			        			echo "class='active'>";
			        		else:
			        			echo ">";
			        		endif;
			        	else:
			        		echo "class='active'>";
			        	endif;
			        ?>
			            <a href="#pnl-resumen" aria-controls="home" role="tab" data-toggle="tab" style="color:black;">Resumen</a>
			        </li>
			        <li role="presentation"

			        <?php 
			        	if(isset($_SESSION['id_tabx'])):
			        		if($_SESSION['id_tabx'] == 1):
			        			echo "class='active'>";
			        		else:
			        			echo ">";
			        		endif;
			        	else:
			        		echo ">";
			        	endif;
			        ?>
			            <a href="#pnl-clasificacion" aria-controls="tab" role="tab" data-toggle="tab" style="color:black;">Clasificación</a>
			        </li>
			        <li role="presentation"
					<?php 
			        	if(isset($_SESSION['id_tabx'])):
			        		if($_SESSION['id_tabx'] == 2):
			        			echo "class='active'>";
			        		else:
			        			echo ">";
			        		endif;
			        	else:
			        		echo ">";
			        	endif;
			        ?>
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

			    $db_grupos = & JDatabase::getInstance( $option );
			    $query_grupos = "SELECT grupo.id_grupo as id_g, grupo.descripcion as descr_grupo, grupo.tipo_grupo as tipo_grupo
			    FROM grupo
			    WHERE grupo.id_torneo = ".$id_torneo;  
			    $db_grupos->setQuery($query_grupos);
			    $db_grupos->execute();
			    $numRows_grupos = $db_grupos->getNumRows(); 
			    $results_grupos = $db_grupos->loadObjectList();	

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
			        <div role="tabpanel" class="tab-pane fade 
						<?php 
				        	if(isset($_SESSION['id_tabx'])):
				        		if($_SESSION['id_tabx'] == 0):
				        			echo "in active";
				        		endif;
				        	else:
				        		echo "in active";
				        	endif;
				        ?>" id="pnl-resumen">
			       	<div class="container">
				    	<form id="resumen" class="col-sm-3" role='form' action="validaciones/v_torneos_publicos.php" target="_parent" method="post">
				    		<input type="hidden" name="id_tab" value="0">
				    		<input type="hidden" name="id_tor" value="<?php echo $id_torneo;?>">
				    		<div class="form-group">
					    		<label class="control-label" for="resumen">Mostrar Resumen de</label>
						    	<select class='form-control select-size-small' id='cmb_grupos' name='cmb_grupos' onchange='this.form.submit()'>
						    		<option value="0">Todo el Torneo</option>
						    	<?php

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
						    			
						    			<th style="text-align: left;" class="col-sm-3">Equipo 1</th>
						    			<th></th>
						    			<th style="text-align: right;" class="col-sm-3">Equipo 2</th>
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
						    			
						    			<th style="text-align: left;" class="col-sm-3">Equipo 1</th>
						    			<th>Fecha</th>
						    			<th style="text-align: right;" class="col-sm-3">Equipo 2</th>
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
							    			<td><strong>".$results_proximos_p[$i]->p_fecha.", ".$results_proximos_p[$i]->p_hora.", ".$results_proximos_p[$i]->p_lugar."</strong></td>
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
							    			<td><strong>".$results_proximos_p[$i]->p_fecha.", ".$results_proximos_p[$i]->p_hora.", ".$results_proximos_p[$i]->p_lugar."</strong></td>
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
							    			<td><strong>".$results_proximos_p[$i]->p_fecha.", ".$results_proximos_p[$i]->p_hora.", ".$results_proximos_p[$i]->p_lugar."</strong></td>
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
						</div>

			        </div> 

			       <!-- Tab Resumen End -->
			       <!-- Tab Clasificacion -->
			        <div role="tabpanel" class="tab-pane fade 
						<?php 
				        	if(isset($_SESSION['id_tabx'])):
				        		if($_SESSION['id_tabx'] == 1):
				        			echo "in active";
				        		endif;
				        	endif;
				        ?>" id="pnl-clasificacion">
			        	<div class="container">
			        		<?php

						    $db_e = & JDatabase::getInstance( $option );
						    $query_e = "SELECT *
						    FROM grupo
						    WHERE id_torneo =".$id_torneo." AND tipo_grupo = 0 ORDER BY id_grupo"; 
						    $db_e->setQuery($query_e);
						    $db_e->execute();
						    $numRows_e = $db_e->getNumRows(); 
						    $results_e = $db_e->loadObjectList();

						    $db_l = & JDatabase::getInstance( $option );
						    $query_l = "SELECT *
						    FROM grupo
						    WHERE id_torneo =".$id_torneo." AND tipo_grupo = 1 ORDER BY id_grupo"; 
						    $db_l->setQuery($query_l);
						    $db_l->execute();
						    $numRows_l = $db_l->getNumRows(); 
						    $results_l = $db_l->loadObjectList();

						    $db_equi_no_g = & JDatabase::getInstance( $option );
						    $db_jornadas_e = & JDatabase::getInstance( $option );
						    $db_tabla_partidos1 = & JDatabase::getInstance( $option );
						    $db_tabla_partidos2 = & JDatabase::getInstance( $option );


							$db_tabla_grupo = & JDatabase::getInstance( $option );
						    $db_combo_jornadas = & JDatabase::getInstance( $option );
						    $db_tabla_filas_validas1 = & JDatabase::getInstance( $option );
						    $db_tabla_filas_validas2 = & JDatabase::getInstance( $option );

						    $resultados_partidos1 = array();
						    $resultados_partidos2 = array();
			        		?>
					    	<!-- <form id="clasif" class="col-sm-3" role='form' action="validaciones/v_torneos_publicos.php" target="_parent" method="post">
					    		<div class="form-group">
					    			<input type="hidden" name="id_tab" value="1">
					    			<input type="hidden" name="id_tor1" value="<?php echo $id_torneo;?>">
						    		<label class="control-label" for="clasif">Mostrar Clasificación de</label>
							    	<select class='form-control select-size-small' id='cmb_clasif' name='cmb_clasif' onchange='this.form.submit()'>
							    		<option value="0">Todo el Torneo</option>
							    		<?php
							    			for ($i=0; $i < $numRows_grupos ; $i++):
										    	echo "<option ";
										    	if(isset($_SESSION['grupo_select1'])):
										    		if($_SESSION['grupo_select1'] == $results_grupos[$i]->id_g):
										    			echo "selected";
										    		endif;								    		
										    	endif;
										    	 echo" value='".$results_grupos[$i]->id_g."'>".$results_grupos[$i]->descr_grupo."</option>";
										    endfor;
							    		?>
							    	</select>
						    	</div>
							</form> -->
						</div>
<ul class="nav nav-tabs">
    <?php
      for($i = 0; $i < $numRows_grupos; $i++):
        echo "<li";
      if($i == 0):        
        echo " class='active'";
      endif;  
      echo"><a data-toggle='tab' href='#".$results_grupos[$i]->id_g."'>".$results_grupos[$i]->descr_grupo."</a></li>";
      endfor;
    ?>
  </ul>

  <div class="tab-content">
<?php 
      for ($i=0; $i < $numRows_grupos; $i++): 
        if($results_grupos[$i]->tipo_grupo == 1):        
        echo "
      <div id='".$results_grupos[$i]->id_g."' class='tab-pane fade";
      if($i == 0):        
        echo " in active";
      endif;  
      echo "'>
    
    <table class='table table-hover'>
    <thead>
      <tr>
        <th>POS</th>
        <th>NOMBRE</th>
        <th>P</th>
        <th>PJ</th>
        <th>PG</th>
        <th>PE</th>
        <th>PP</th>
        <th>F</th>
        <th>C</th>
        <th>D</th>
      </tr>
      </thead>
      <tbody  >"; 
        $db_tabla_grupo = & JDatabase::getInstance( $option );       
        $query_tabla_grupo = "SELECT equipo.nombre as nombre_equipo, equipo_grupo.id_equipo as id_eq, p
        FROM equipo_grupo, equipo
        WHERE equipo_grupo.id_equipo = equipo.id_equipo AND equipo_grupo.id_grupo =".$results_grupos[$i]->id_g." ORDER BY p DESC, d DESC, f DESC, pe DESC";  
        $db_tabla_grupo->setQuery($query_tabla_grupo);
        $db_tabla_grupo->execute();   
        $numRows_tabla_grupo = $db_tabla_grupo->getNumRows();      
        $results_tabla_grupo = $db_tabla_grupo->loadObjectList();


        
          //  endbloque
        $db_tabla_grupo2 = & JDatabase::getInstance( $option );
        $query_tabla_grupo2 = "SELECT equipo.nombre as nombre_equipo, equipo_grupo.id_equipo as id_eq, pg, pj, p, pp, pe, f, c, d, equipo.id_equipo as id_eq
        FROM equipo_grupo, equipo
        WHERE equipo_grupo.id_equipo = equipo.id_equipo AND equipo_grupo.id_grupo =".$results_grupos[$i]->id_g." ORDER BY p DESC, d DESC, f DESC, pe DESC";  
        $db_tabla_grupo2->setQuery($query_tabla_grupo2);
        $db_tabla_grupo2->execute(); 
        $numRows_tabla_grupo2 = $db_tabla_grupo2->getNumRows();        
        $results_tabla_grupo2 = $db_tabla_grupo2->loadObjectList();
 
        for ($q=0; $q < $numRows_tabla_grupo2; $q++): 
          if($q == 0 && $q != $numRows_tabla_grupo2-1):
            echo "<tr style='background-color:#9FFFA2;'>";
          else:
            echo "<tr>";
          endif;
          if($q == $numRows_tabla_grupo2-1 && $q != 0):
            echo "<tr style='background-color:#FF7070;'>";
          endif;
          echo "
          <td>".($q+1)."</td>          
          <td>".$results_tabla_grupo2[$q]->nombre_equipo."</td>          
          <td>".$results_tabla_grupo2[$q]->p."</td>          
          <td>".$results_tabla_grupo2[$q]->pj."</td>          
          <td>".$results_tabla_grupo2[$q]->pg."</td>          
          <td>".$results_tabla_grupo2[$q]->pe."</td>          
          <td>".$results_tabla_grupo2[$q]->pp."</td>          
          <td>".$results_tabla_grupo2[$q]->f."</td>          
          <td>".$results_tabla_grupo2[$q]->c."</td>          
          <td>".$results_tabla_grupo2[$q]->d."</td>          

        </tr>"; 
        endfor;       
      echo "
    </tbody>    
    </table>  
   </div>
      ";
      elseif($results_grupos[$i]->tipo_grupo == 0):
        echo "
      <div id='".$results_grupos[$i]->id_g."' class='tab-pane fade";
      if($i == 0):        
        echo " in active";
      endif;  
      echo "'>
    ";

    $db_eli_creada = & JDatabase::getInstance( $option );
          $query_eli_creada = "SELECT count(partido.id_partido) as cant_partidos
          FROM partido, jornada, grupo
          WHERE grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada = partido.id_jornada AND grupo.id_grupo = ".$results_grupos[$i]->id_g;  
          $db_eli_creada->setQuery($query_eli_creada);
          $db_eli_creada->execute();
          $numRows_eli_creada = $db_eli_creada->getNumRows(); 
          $results_eli_creada = $db_eli_creada->loadObjectList();

          if($results_eli_creada[0]->cant_partidos > 0):
          
    echo "
   <!-- Caja de posiciones-->   
      <div class='box-info full relative'>
        
      <div id='play-off-cross' class='top-bordered'>
        <div class='cruces-eliminatoria'>
          <div>
   ";
   $query_jornadas_e = "SELECT jornada.descripcion as descr_jornada, jornada.id_jornada as id_jor
        FROM jornada
        WHERE jornada.id_grupo =".$results_grupos[$i]->id_g;  
        $db_jornadas_e->setQuery($query_jornadas_e);
        $db_jornadas_e->execute();   
        $numRows_jornadas_e = $db_jornadas_e->getNumRows();      
        $results_jornadas_e = $db_jornadas_e->loadObjectList(); 
        $u = 0;
    for ($z=$numRows_jornadas_e-1; $z >= 0; $z--) : 
      try{
              

                $query_tabla_partidos1 = "SELECT DISTINCT partido_equipos.id_equipo1 as id_eq1, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo1 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_jornadas_e[$z]->id_jor." AND jornada.id_grupo =".$results_grupos[$i]->id_g;  

                $query_tabla_partidos2 = "SELECT DISTINCT partido_equipos.id_equipo2 as id_eq2, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo2 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_jornadas_e[$z]->id_jor." AND jornada.id_grupo =".$results_grupos[$i]->id_g; 
             
              
              $db_tabla_partidos1->setQuery($query_tabla_partidos1);
              $db_tabla_partidos1->execute();   
              $numRows_tabla_partidos1 = $db_tabla_partidos1->getNumRows();      
              $results_tabla_partidos1 = $db_tabla_partidos1->loadObjectList();

              $db_tabla_partidos2->setQuery($query_tabla_partidos2);
              $db_tabla_partidos2->execute();   
              $numRows_tabla_partidos2 = $db_tabla_partidos2->getNumRows();      
              $results_tabla_partidos2 = $db_tabla_partidos2->loadObjectList();


              $size_ronda = pow(2, $u);

              echo "
                <div class='ronda'>
                <div class='h5'>".$results_jornadas_e[$z]->descr_jornada."</div>";

              for ($j=0; $j < $numRows_tabla_partidos1; $j++): 
                
                echo "
                <div style='height: ".$size_ronda."00px;'>
                <div class='linea-vertical'>
                <div class='linea-horizontal'></div>
                <div class='caja-participantes'>                      
                <div class='"; 
                if($results_tabla_partidos1[$j]->tantos_1 > $results_tabla_partidos1[$j]->tantos_2):
                  echo "equipo-cruce ganador";
                else:
                  echo "equipo-cruce";
                endif;
                

                echo "'>";

                if(file_exists("img/escudos/".$results_tabla_partidos1[$j]->id_eq1.".png")):
                echo "<img src='img/escudos/".$results_tabla_partidos1[$j]->id_eq1.".png' alt='' width='30px' height='30px'>";
              else:
                echo "<img src='img/escudos/base.png' alt='' width='30px' height='30px'>";
              endif;  
              if($results_tabla_partidos1[$j]->id_eq1 != 26):
                echo "
                  <a href='#' title='Editar'>
          ".$results_tabla_partidos1[$j]->nombre_equipo."
          </a>
                    <span>
                          ".$results_tabla_partidos2[$j]->tantos_1."                         
                        </span>
                </div>

                <div class='";
                else:
                  echo "
                <a href='#' title='Editar'>
          ".$results_tabla_partidos1[$j]->nombre_equipo."
            </a>
                    <span>
                          ".$results_tabla_partidos2[$j]->tantos_1."                         
                        </span>
                </div>

                <div class='";
              endif;
                
                if($results_tabla_partidos1[$j]->tantos_2 > $results_tabla_partidos1[$j]->tantos_1):
                  echo "equipo-cruce ganador";
                else:
                  echo "equipo-cruce";
                endif;

                echo "'>";

                if(file_exists("img/escudos/".$results_tabla_partidos2[$j]->id_eq2.".png")):
                  echo "<img src='img/escudos/".$results_tabla_partidos2[$j]->id_eq2.".png' alt='' width='30px' height='30px'>";
                else:
                  echo "<img src='img/escudos/base.png' alt='' width='30px' height='30px'>";
                endif;  
                if($results_tabla_partidos2[$j]->id_eq2 != 26):
                  echo "
                <a href='#'>
          ".$results_tabla_partidos2[$j]->nombre_equipo."
          </a>
                  <span>
                    ".$results_tabla_partidos2[$j]->tantos_2."                         
                    </span>
                </div>  
                </div>
                </div>
                </div>
              ";
                else:
                  echo "
                <a href='#' title='Editar'>
          ".$results_tabla_partidos2[$j]->nombre_equipo."
          </a>
                  <span>
                    ".$results_tabla_partidos2[$j]->tantos_2."                         
                    </span>
                </div>  
                </div>
                </div>
                </div>
              ";
                endif;
                



                // echo "<td>".$results_tabla_partidos1[$j]->nombre_equipo."</td>          
                // <td><a href='partidos.php?id_partido=".$results_tabla_partidos1[$j]->this_id_p."&id_equipo1=".$results_tabla_partidos1[$j]->id_eq1."&id_equipo2=".$results_tabla_partidos2[$j]->id_eq2."&n_equipo1=".$results_tabla_partidos1[$j]->nombre_equipo."&n_equipo2=".$results_tabla_partidos2[$j]->nombre_equipo."' title='Editar'>
              //".$results_tabla_partidos2[$j]->tantos_1." - ".$results_tabla_partidos2[$j]->tantos_2."</a></td>          
                // <td>".$results_tabla_partidos2[$j]->nombre_equipo."</td>   

              endfor;   
        }catch(Exception $e){
          echo $e;
        }

              echo "
             </div>
              
            
                ";

        $u++;
      endfor;
echo "
</div>
<div><!-- Linea de los titulos -->&nbsp;</div>
    </div>
  </div>
        
  </div>

   </div>

<!--END Caja de posiciones-->   
      ";
            else:
                $db_eli_eq = & JDatabase::getInstance( $option );
                $query_eli_eq = "SELECT equipo.nombre as nombre_equipo, equipo_grupo.orden as orden_eq, equipo.id_equipo as this_id_equipo
                FROM equipo, equipo_grupo
                WHERE equipo.id_equipo = equipo_grupo.id_equipo AND equipo_grupo.id_grupo = ".$results_grupos[$i]->id_g." ORDER BY equipo_grupo.orden";  
                $db_eli_eq->setQuery($query_eli_eq);
                $db_eli_eq->execute();
                $numRows_eli_eq = $db_eli_eq->getNumRows(); 
                $results_eli_eq = $db_eli_eq->loadObjectList();

                echo "
                <div class='col-sm-5' style='margin-top:30px;'>
                <table class='table table-hover table-bordered col-sm-6'>
                  <thead>
                    <tr>
                      <th>ESCUDO</th>
                      <th>NOMBRE</th>
                      <th>ORDEN</th>
                    </tr>
                    </thead>
                    <tbody  > ";
                  for ($l=0; $l < $numRows_eli_eq; $l++):
                                      echo " <tr>";
                        if(file_exists("img/escudos/".$results_eli_eq[$l]->this_id_equipo.".png")):
                        echo"
                          <td>
                            <img src='img/escudos/".$results_eli_eq[$l]->this_id_equipo.".png' height='24px' width='24px'>   
                          </td>";
                        elseif(file_exists("img/escudos/".$results_eli_eq[$l]->this_id_equipo.".jpg")):
                        echo"
                          <td>
                            <img src='img/escudos/".$results_eli_eq[$l]->this_id_equipo.".jpg' height='24px' width='24px'>   
                          </td>";
                        else:
                          echo"
                          <td>
                            <img src='img/escudos/base.png' height='24px' width='24px'>   
                          </td>";
                        endif;
                        echo "
                          <td>
                            <a href='ficha_equipo.php?id_equipo=".$results_eli_eq[$l]->this_id_equipo."' title='Editar'>
                            ".$results_eli_eq[$l]->nombre_equipo."
                            </a>
                          </td>     
                          <td>                           
                            ".$results_eli_eq[$l]->orden_eq."                          
                          </td>     
                            
                        </tr>
                        ";        
                                      
                  endfor;
                      
                echo "
                    </tbody>
                  </thead>
                </table>
                </div>
                ";


            endif;
      endif;
      endfor;
      ?>
      </div>

			        </div>
			        <!-- Tab Clasificacion end-->
			        <!-- Tab Calendario -->
			        <div role="tabpanel" class="tab-pane fade 
						<?php 
				        	if(isset($_SESSION['id_tabx'])):
				        		if($_SESSION['id_tabx'] == 2):
				        			echo "in active";
				        		endif;
				        	endif;
				        ?>" id="pnl-calendario">
						<div class="container">
					    	<!-- <form id="clasif" class="col-sm-3" role='form' action="validaciones/v_torneos_publicos.php" target="_parent" method="post">
					    		<div class="form-group">
					    			<input type="hidden" name="id_tab" value="2">
					    			<input type="hidden" name="id_tor2" value="<?php echo $id_torneo;?>">
						    		<label class="control-label" for="clasif">Mostrar Calendario de</label>
							    	<select class='form-control select-size-small' id='cmb_calend' name='cmb_calend' onchange='this.form.submit()'>
							    		<option value="0">Todo el Torneo</option>
							    		<?php
							    			for ($i=0; $i < $numRows_grupos ; $i++):
										    	echo "<option ";
										    	if(isset($_SESSION['grupo_select2'])):
										    		if($_SESSION['grupo_select2'] == $results_grupos[$i]->id_g):
										    			echo "selected";
										    		endif;								    		
										    	endif;
										    	 echo" value='".$results_grupos[$i]->id_g."'>".$results_grupos[$i]->descr_grupo."</option>";
										    endfor;
							    		?>
							    	</select>
						    	</div>
							</form> -->
						</div>

<ul class="nav nav-tabs">
    <?php
      for($i = 0; $i < $numRows_grupos; $i++):
        echo "<li ";
      if(isset($_SESSION['id_tab'])):
        if($i == $_SESSION['id_tab']):        
          echo "class= 'active'";
        endif;
      else:
        if($i == 0):        
          echo "class= 'active'";
        endif;
      endif;
      echo"><a data-toggle='tab' href='#cal".$results_grupos[$i]->id_g."'>".$results_grupos[$i]->descr_grupo."</a></li>";
      endfor;
    ?>
  </ul>

  <div class="tab-content">
    <?php 
      for ($i=0; $i < $numRows_grupos; $i++): 

        $query_combo_jornadas = "SELECT jornada.descripcion as descr_jornada, jornada.id_jornada as id_jor
        FROM jornada
        WHERE jornada.id_grupo =".$results_grupos[$i]->id_g;  
        $db_combo_jornadas->setQuery($query_combo_jornadas);
        $db_combo_jornadas->execute();   
        $numRows_combo_jornadas = $db_combo_jornadas->getNumRows();      
        $results_combo_jornadas = $db_combo_jornadas->loadObjectList(); 
        
        if($results_grupos[$i]->tipo_grupo == 1):        
        echo "
      <div id='cal".$results_grupos[$i]->id_g."' class='tab-pane fade";
      if(isset($_SESSION['id_tab'])):
        if($i == $_SESSION['id_tab']):        
          echo " in active";
        endif;
      else:
        if($i == 0):        
          echo " in active";
        endif;
      endif;
      echo "'>
    <div class='btn-toolbar pull-right' style='margin-top:7px;' role='toolbar' aria-label='Toolbar with button groups'>
      <div class='btn-group'>
      <form action='validaciones/v_torneos_publicos.php' role='form' method='post' target='_parent'>
      <input type='hidden' name='id_tabx' value='2'>
      <input type='hidden' name='id_tor' value='".$id_torneo."'>
      <input type='hidden' name='id_tab' value='".$i."'>
      <select class='form-control select-size-small' name='lista_jornadas' onchange='this.form.submit()'>
      <option value='0'>Mostrar Partidos</option>
      ";

        for ($m=0; $m < $numRows_combo_jornadas; $m++):
          echo "<option value='".$results_combo_jornadas[$m]->id_jor."' ";
        if(isset($_SESSION['id_jornada'])):
        if($results_combo_jornadas[$m]->id_jor == $_SESSION['id_jornada']):
          echo "selected";
        endif;
        endif;
        echo">".$results_combo_jornadas[$m]->descr_jornada."</option>";
        endfor;
      echo "</select>
      </form>
      </div>
    </div> 
    <div class='col-sm-2 pull-right'>    
      <form action='validaciones/v_torneos_publicos.php' name='formLigaEli' id='formLigaEli' class='navbar-form' role='form' method='post' target='_parent'>
    <div class='btn-group'>
      <input type='hidden' name='tipo_grupo' value='".$results_grupos[$i]->tipo_grupo."'>
      <input type='hidden' name='id_grupo' value='".$results_grupos[$i]->id_g."'>
      </span>
    </div>
    </form>
    </div>
    <table class='table table-hover'>
    <thead>
      <tr>
        <th>EQUIPO 1</th>
        <th>RESULTADO</th>
        <th>EQUIPO 2</th>
        <th>FECHA</th>
        <th>HORA</th>
        <th>LUGAR</th>
        <th>ESTADO</th>
      </tr>
      </thead>
      <tbody  >"; 
      if($numRows_combo_jornadas > 0):

            try{        
             
            
              if(isset($_SESSION['id_jornada'])):
               $query_tabla_partidos1 = "SELECT DISTINCT partido_equipos.id_equipo1 as id_eq1, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
              FROM partido_equipos, equipo, partido, jornada, grupo 
              WHERE partido_equipos.id_equipo1 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND  partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$_SESSION['id_jornada']." AND jornada.id_grupo =".$results_grupos[$i]->id_g;  

              $query_tabla_partidos2 = "SELECT DISTINCT partido_equipos.id_equipo2 as id_eq2, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
              FROM partido_equipos, equipo, partido, jornada, grupo
              WHERE partido_equipos.id_equipo2 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$_SESSION['id_jornada']." AND jornada.id_grupo =".$results_grupos[$i]->id_g;  

              else:

                $query_tabla_partidos1 = "SELECT DISTINCT partido_equipos.id_equipo1 as id_eq1, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo1 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_combo_jornadas[0]->id_jor." AND jornada.id_grupo =".$results_grupos[$i]->id_g;  

                $query_tabla_partidos2 = "SELECT DISTINCT partido_equipos.id_equipo2 as id_eq2, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo2 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_combo_jornadas[0]->id_jor." AND jornada.id_grupo =".$results_grupos[$i]->id_g;  
              endif;
              // unset($_SESSION['id_jornada']);

             
              
              $db_tabla_partidos1->setQuery($query_tabla_partidos1);
              $db_tabla_partidos1->execute();   
              $numRows_tabla_partidos1 = $db_tabla_partidos1->getNumRows();      
              $results_tabla_partidos1 = $db_tabla_partidos1->loadObjectList();

              $db_tabla_partidos2->setQuery($query_tabla_partidos2);
              $db_tabla_partidos2->execute();   
              $numRows_tabla_partidos2 = $db_tabla_partidos2->getNumRows();      
              $results_tabla_partidos2 = $db_tabla_partidos2->loadObjectList();

              for ($j=0; $j < $numRows_tabla_partidos1; $j++): 
                
                echo "<tr>
                <td>".$results_tabla_partidos1[$j]->nombre_equipo."</td>          
                <td><a href='#'>".$results_tabla_partidos2[$j]->tantos_1." - ".$results_tabla_partidos2[$j]->tantos_2."</a></td>          
                <td>".$results_tabla_partidos2[$j]->nombre_equipo."</td>   
                <td>".$results_tabla_partidos2[$j]->fecha_p."</td>          
                <td>".$results_tabla_partidos2[$j]->hora_p."</td>          
                <td>".$results_tabla_partidos2[$j]->lugar_p."</td>";
                if($results_tabla_partidos2[$j]->jugado_p == 0):
                  echo "<td><div class='dot-warning' title='Pendiente'></div></td>";
                else:
                  echo "<td><div class='dot-success' title='Terminado'></div></td>";
                endif;
              echo "</tr>";     
              endfor;   
        }catch(Exception $e){
          echo $e;
        }
      
      endif;
          

        
      echo "
    </tbody>    
    </table>  
   </div>
      ";
      elseif($results_grupos[$i]->tipo_grupo == 0):
       echo "
      <div id='cal".$results_grupos[$i]->id_g."' class='tab-pane fade";
      if(isset($_SESSION['id_tab'])):
        if($i == $_SESSION['id_tab']):        
          echo " in active";
        endif;
      else:
        if($i == 0):        
          echo " in active";
        endif;
      endif;
      echo "'>
    <div class='btn-toolbar pull-right' style='margin-top:7px;' role='toolbar' aria-label='Toolbar with button groups'>
      <div class='btn-group'>
      <form action='validaciones/v_torneos_publicos.php' role='form' method='post' target='_parent'>
      <input type='hidden' name='id_tabx' value='2'>
      <input type='hidden' name='id_tor' value='".$id_torneo."'>
      <input type='hidden' name='id_tab' value='".$i."'>
      <select class='form-control select-size-small' name='lista_jornadas' onchange='this.form.submit()'>
      <option value='0'>Mostrar Partidos</option>
      ";
        for ($n = $numRows_combo_jornadas-1; $n >= 0; $n--):
          echo $_SESSION['id_jornada'];
          echo "<option value='".$results_combo_jornadas[$n]->id_jor."' ";
        if(isset($_SESSION['id_jornada'])):
          echo $_SESSION['id_jornada'];
        if($results_combo_jornadas[$n]->id_jor == $_SESSION['id_jornada']):
          echo "selected";
        endif;
        endif;
        echo">".$results_combo_jornadas[$n]->descr_jornada."</option>";
        endfor;
      echo "</select>
      </form>
      </div>
    </div> 
    <div class='col-sm-2 pull-right'>    
      <form action='validaciones/v_torneos_publicos.php' name='formLigaEli' id='formLigaEli' class='navbar-form' role='form' method='post' target='_parent'>
    <div class='btn-group'>
      <input type='hidden' name='tipo_grupo' value='".$results_grupos[$i]->tipo_grupo."'>
      <input type='hidden' name='id_grupo' value='".$results_grupos[$i]->id_g."'>
      </span>
    </div>
    </form>
    </div>
    <table class='table table-hover'>
    <thead>
      <tr>
        <th>EQUIPO 1</th>
        <th>RESULTADO</th>
        <th>EQUIPO 2</th>
        <th>FECHA</th>
        <th>HORA</th>
        <th>LUGAR</th>
        <th>ESTADO</th>
      </tr>
      </thead>
      <tbody  >"; 
        try{
          if($numRows_combo_jornadas != 0):
              if(isset($_SESSION['id_jornada'])):
               $query_tabla_partidos1 = "SELECT DISTINCT partido_equipos.id_equipo1 as id_eq1, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
              FROM partido_equipos, equipo, partido, jornada, grupo 
              WHERE partido_equipos.id_equipo1 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND  partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$_SESSION['id_jornada']." AND jornada.id_grupo =".$results_grupos[$i]->id_g;  

              $query_tabla_partidos2 = "SELECT DISTINCT partido_equipos.id_equipo2 as id_eq2, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
              FROM partido_equipos, equipo, partido, jornada, grupo
              WHERE partido_equipos.id_equipo2 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$_SESSION['id_jornada']." AND jornada.id_grupo =".$results_grupos[$i]->id_g;  

              else:
               
                $query_tabla_partidos1 = "SELECT DISTINCT partido_equipos.id_equipo1 as id_eq1, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo1 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_combo_jornadas[0]->id_jor." AND jornada.id_grupo =".$results_grupos[$i]->id_g;  

                $query_tabla_partidos2 = "SELECT DISTINCT partido_equipos.id_equipo2 as id_eq2, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo2 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_combo_jornadas[0]->id_jor." AND jornada.id_grupo =".$results_grupos[$i]->id_g;  
              endif;
              // unset($_SESSION['id_jornada']);

             
              
              $db_tabla_partidos1->setQuery($query_tabla_partidos1);
              $db_tabla_partidos1->execute();   
              $numRows_tabla_partidos1 = $db_tabla_partidos1->getNumRows();      
              $results_tabla_partidos1 = $db_tabla_partidos1->loadObjectList();

              $db_tabla_partidos2->setQuery($query_tabla_partidos2);
              $db_tabla_partidos2->execute();   
              $numRows_tabla_partidos2 = $db_tabla_partidos2->getNumRows();      
              $results_tabla_partidos2 = $db_tabla_partidos2->loadObjectList();

              for ($j=0; $j < $numRows_tabla_partidos1; $j++): 
                
                echo "<tr>
                <td>".$results_tabla_partidos1[$j]->nombre_equipo."</td>          
                <td><a href='#'>".$results_tabla_partidos2[$j]->tantos_1." - ".$results_tabla_partidos2[$j]->tantos_2."</a></td>          
                <td>".$results_tabla_partidos2[$j]->nombre_equipo."</td>          
                <td>".$results_tabla_partidos2[$j]->fecha_p."</td>          
                <td>".$results_tabla_partidos2[$j]->hora_p."</td>          
                <td>".$results_tabla_partidos2[$j]->lugar_p."</td>";
                if($results_tabla_partidos2[$j]->jugado_p == 0):
                  echo "<td><div class='dot-warning' title='Pendiente'></div></td>";
                else:
                  echo "<td><div class='dot-success' title='Terminado'></div></td>";
                endif;
              echo "</tr>";                 
              endfor;   

          else:
          endif;
        }catch(Exception $e){
          echo $e;
        }
          
        
      echo "
    </tbody>    
    </table>  
   </div>
      ";
      endif;
      endfor;
    ?>

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