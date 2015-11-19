<?php
	session_start();
	include"conexion.php";
	// $cn = mysqli_connect("localhost", "root", "12345", "torneos") or die ("ERROR AL INTENTAR CONECTAR");
		$db_torneo_publico = & JDatabase::getInstance( $option );
		$user = JFactory::getUser();
		$query_torneo_publico = "SELECT torneo.descripcion as descr_torneo, ubicacion, categoria.descripcion as descr_categoria, deporte.nombre as nombre_deporte, publicado, puntos_p, puntos_g, puntos_e   
						FROM torneo, categoria, deporte 
						WHERE deporte.id_deporte = torneo.id_deporte AND categoria.id_categoria = torneo.id_categoria AND id_torneo = ".$_GET['id_torneo']." AND estado = 1 ORDER BY torneo.descripcion";	
		$db_torneo_publico->setQuery($query_torneo_publico);
		$db_torneo_publico->execute();	
		$results_torneo_publico = $db_torneo_publico->loadObjectList();
	// $query_torneo = mysqli_query($cn, "SELECT torneo.descripcion as descr_torneo, ubicacion, categoria.descripcion as descr_categoria, deporte.nombre as nombre_deporte, publicado, puntos_p, puntos_g, puntos_e   
	// 					FROM torneo, categoria, deporte 
	// 					WHERE deporte.id_deporte = torneo.id_deporte AND categoria.id_categoria = torneo.id_categoria AND id_torneo = ".$_GET['id_torneo']." AND estado = 1 ORDER BY torneo.descripcion");
	// $line = mysqli_fetch_array($query_torneo);
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">  
    <link rel="stylesheet" type="text/css" href="css/my_navbars.css">
    <link rel="stylesheet" href="css/jasny-bootstrap.min">
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
<body>
	<div class="jumbotron ">
		<div class="container">
			<div class="row">
			  <div class="col-xs-4 col-sm-4" style="margin-bottom: 30px">
			    
			    <?php
			    if(file_exists("img/torneos/".$_GET['id_torneo'].".png")):
			      echo "<img src='img/torneos/".$_GET['id_torneo'].".png' alt='' width='200px' height='200px' class='img-circle'>";
			    elseif(file_exists("img/torneos/".$_GET['id_torneo'].".jpg")):
			      echo "<img src='img/torneos/".$_GET['id_torneo'].".jpg' alt='' width='200px' height='200px' class='img-circle'>";
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
			    <div class="tab-content">
			        <div role="tabpanel" class="tab-pane active" id="pnl-resumen">
			        	<div class="container">
				    	<form id="resumen" class="col-sm-3" role='form' action="">
				    		<div class="form-group">
					    		<label class="control-label" for="resumen">Mostrar Resumen de</label>
						    	<select class='form-control select-size-small' id='resumen' name='resumen' onchange='this.form.submit()'>
						    		<option value="0">Todo el Torneo</option>
						    	</select>
					    	</div>
						</form>
					</div>
			        	<div class="panel panel-default">
						  <div class="panel-heading">
						    <h3 style="text-shadow: none;" class="panel-title">Úlitmos Resultados</h3>
						  </div>
						  <div class="panel-body">
						    <table class="table table-striped table-hover center-text">
						    	<thead>
						    		<tr>
						    			<th>Grupo</th>
						    			<th style="text-align: left;">Equipo 1</th>
						    			<th></th>
						    			<th style="text-align: right;">Equipo 2</th>
						    		</tr>
						    	</thead>
						    	<tbody>
						    		<tr>
						    			<td></td>
						    			<td style='text-align: left;'></td>
						    			<td>-</td>
						    			<td style='text-align: right;'></td>
						    		</tr>
						    	</tbody>
						    </table>
						  </div>
						</div>

						<div class="panel panel-default">
						  <div class="panel-heading">
						    <h3 style="text-shadow: none;" class="panel-title">Próximos Partidos</h3>
						  </div>
						  <div class="panel-body">
						    <table class="table table-striped table-hover center-text">
						    	<thead>
						    		<tr>
						    			<th>Grupo</th>
						    			<th style="text-align: left;">Equipo 1</th>
						    			<th></th>
						    			<th style="text-align: right;">Equipo 2</th>
						    		</tr>
						    	</thead>
						    	<tbody>
						    		<tr>
						    			<td style='text-align: left;'></td>
						    			<td>Fecha, hora, Lugar</td>
						    			<td style='text-align: right;'></td>
						    		</tr>
						    	</tbody>
						    </table>
						  </div>
						</div>

			        </div>
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
			    </div>
	</div>

		
</body>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="js/jasny-bootstrap.min.js"></script>
</html>