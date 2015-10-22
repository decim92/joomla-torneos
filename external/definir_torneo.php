<!DOCTYPE html>
<html lang="es">
<head>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/custom.css">
</head>
<script type="text/javascript" src="../media/jui/js/jquery.js"></script>
<script type="text/javascript" src="js/automapa.js"></script>
<script>
// $(document).ready(function(){
// $("select").change(function(){
// // Vector para saber cuál es el siguiente combo a llenar
// var combos = new Array();
// combos['pais'] = "estado";
// //combos['estado'] = "ciudad";
// // Tomo el nombre del combo al que se le a dado el clic por ejemplo: país
// posicion = $(this).attr("name");
// // Tomo el valor de la opción seleccionada
// valor = $(this).val()
// // Evaluó  que si es país y el valor es 0, vacié los combos de estado y ciudad
// if(posicion == 'pais' && valor==0){
// $("#estado").html('    <option value="0" selected="selected">----------------</option>')
// //$("#ciudad").html('    <option value="0" selected="selected">----------------</option>')
// }else{
//  En caso contrario agregado el letreo de cargando a el combo siguiente
// Ejemplo: Si seleccione país voy a tener que el siguiente según mi vector combos es: estado  por qué  combos [país] = estado

// $("#"+combos[posicion]).html('<option selected="selected" value="0">Cargando...</option>')
// /* Verificamos si el valor seleccionado es diferente de 0 y si el combo es diferente de ciudad, esto porque no tendría caso hacer la consulta a ciudad porque no existe un combo dependiente de este */
// if(valor!="0" || posicion !='ciudad'){
// // Llamamos a pagina de combos.php donde ejecuto las consultas para llenar los combos
// $.post("combos.php",{
// combo:$(this).attr("name"), // Nombre del combo
// id:$(this).val() // Valor seleccionado
// },function(data){
// $("#"+combos[posicion]).html(data);    //Tomo el resultado de pagina e inserto los datos en el combo indicado
// })
// }
// }
// })
// })
</script>
<body>
	<?php

	session_start();
	include "conexion.php";
	// $id_torneo = $_GET['id_torneo'];
	// echo $id_torneo;

	// $db = & JDatabase::getInstance( $option );
	// $db_tt = & JDatabase::getInstance( $option );
	$db_cate = & JDatabase::getInstance( $option );
	$db_dep = & JDatabase::getInstance( $option );
	$db_ciud = & JDatabase::getInstance( $option );

	// $query = "SELECT UPPER(nombre) as nomb, id_pais FROM pais";	
	// $db->setQuery($query);
	// $db->execute();
	// $numRows = $db->getNumRows();	
	// $results = $db->loadObjectList();

	// $query_tt = "SELECT UPPER(descripcion) as descr_tt, id_tipo_torneo FROM tipo_torneo";	
	// $db_tt->setQuery($query_tt);
	// $db_tt->execute();
	// $numRows_tt = $db_tt->getNumRows();	
	// $results_tt = $db_tt->loadObjectList();

	$query_cate = "SELECT UPPER(descripcion) as descr_cate, id_categoria FROM categoria";	
	$db_cate->setQuery($query_cate);
	$db_cate->execute();
	$numRows_cate = $db_cate->getNumRows();	
	$results_cate = $db_cate->loadObjectList();

	$query_dep = "SELECT UPPER(nombre) as nombre_dep, individual, id_deporte FROM deporte";	
	$db_dep->setQuery($query_dep);
	$db_dep->execute();
	$numRows_dep = $db_dep->getNumRows();	
	$results_dep = $db_dep->loadObjectList();

	// $query_ciud = "SELECT UPPER(nombre) as nombre_ciud FROM ciudad WHERE id_pais = ";	
	// $db_ciud->setQuery($query_ciud);
	// $db_ciud->execute();
	// $numRows_ciud = $db_ciud->getNumRows();	
	// $results_ciud = $db_ciud->loadObjectList();
	if(isset($_GET['id_torneo'])):
		$_SESSION['id_torneo'] = $_GET['id_torneo'];
		$_SESSION['correcto'] = 1;
	endif;
?>
<?php
	if(isset($_SESSION['correcto'])):		
	if($_SESSION['correcto'] == 1):
		// unset($_SESSION['correcto']);
		// if(isset($_GET['id_torneo'])):
		// 	echo "<div class='alert alert-success col-xs-12 col-sm-12' role='alert'>BIENVENIDO</div>";
		// else:
		// 	echo "<div class='alert alert-success col-xs-12 col-sm-12 pull-left' role='alert'>EXITO</div>";
		// endif;		
		echo "<div class='panel panel-primary hidden'>";		
	else:
		echo "<div class='panel panel-primary'>";
	endif;	
	else:
		echo "<div class='panel panel-primary'>";
	endif;
?>
<div class="panel-heading">CREAR TORNEO NUEVO</div>
<div class="panel-body">

<form action="validaciones/v_torneo.php" id="defTorneo" role="form" method="post" target="_parent">
  	<?php
  	if(isset($_SESSION['categ'])):
		if($_SESSION['categ'] == 0):
		echo "<div class='form-group col-sm-4 col-xs-4 has-error'>";
		unset($_SESSION['categ']);
	else:
		echo "<div class='form-group col-sm-4 col-xs-4'>";
		endif;	
	else:
		echo "<div class='form-group col-sm-4 col-xs-4'>";
	endif;
	?>
	<!-- <div class='form-group col-sm-4 col-xs-4'> -->
	<label for="cate" class="control-label">CATEGORÍA:</label> 
		<select name='listaCate' class="form-control" form='defTorneo' id="cate">;  		
	  		<?php 		 		  	
	  			echo "<option value='0'>SELECCIONE UNA CATEGORÍA</option>";
	  			for($i = 0; $i<$numRows_cate; $i++):
	  			echo "<option value='".$results_cate[$i]->id_categoria."'>".$results_cate[$i]->descr_cate."</option>";	
	  			endfor;  			  			  		
	  		?>  					
	  	</select>
  	</div>
  	<?php 
  	if(isset($_SESSION['deport'])):
		if($_SESSION['deport'] == 0):
		echo "<div class='form-group col-sm-4 col-xs-4 has-error'>";
		unset($_SESSION['deport']);
	else:
		echo "<div class='form-group col-sm-4 col-xs-4'>";
		endif;	
	else:
		echo "<div class='form-group col-sm-4 col-xs-4'>";
	endif;
	?>
	<!-- <div class='form-group col-sm-4 col-xs-4'> -->
	<label for="deporte" class="control-label">DEPORTE:</label> 
		<select  class="form-control" name='listaDeporte' form='defTorneo' id="deporte">;  		
	  		<?php 		 		  	
	  			echo "<option value='0|0'>SELECCIONE UN DEPORTE</option>";
	  			for($i = 0; $i<$numRows_dep; $i++):
	  			echo "<option value='".$results_dep[$i]->individual."|".$results_dep[$i]->id_deporte."'>".$results_dep[$i]->nombre_dep."</option>";	
	  			endfor;  			  			  		
	  		?>  					
	  	</select>
  	</div>
	<?php 
	if(isset($_SESSION['descrip'])):
		if($_SESSION['descrip'] == ""):
		echo "<div class='form-group col-sm-4 col-xs-4 has-error'>";
		unset($_SESSION['descrip']);
	else:
		echo "<div class='form-group col-sm-4 col-xs-4'>";
		endif;	
	else:
		echo "<div class='form-group col-sm-4 col-xs-4'>";
	endif;
	?>
	<!-- <div class='form-group col-sm-4 col-xs-4'> -->
	<label for="descripcion" class="control-label">NOMBRE:</label> 
		<input type="text" class="form-control" name="descripcion" id="descripcion">
	</div>
	<?php 
	if(isset($_SESSION['ubica'])):
		if($_SESSION['ubica'] == ""):
		echo "<div class='form-group col-sm-6 col-xs-6 has-error'>";
		unset($_SESSION['ubica']);
	else:
		echo "<div class='form-group col-sm-6 col-xs-6'>";
		endif;	
	else:
		echo "<div class='form-group col-sm-6 col-xs-6'>";
	endif;
	?>
	<!-- <div class='form-group col-sm-4 col-xs-4'> -->
	<label for="descripcion" class="control-label">UBICACIÓN:</label> 
	<?php
	if(isset($_SESSION['correcto'])):		
	if($_SESSION['correcto'] == 1):
		// unset($_SESSION['correcto']);
		// if(isset($_GET['id_torneo'])):
		// 	echo "<div class='alert alert-success col-xs-12 col-sm-12' role='alert'>BIENVENIDO</div>";
		// else:
		// 	echo "<div class='alert alert-success col-xs-12 col-sm-12 pull-left' role='alert'>EXITO</div>";
		// endif;		
		echo "<input id='no-place' name='no-place' class='form-control' type='text' placeholder='Ingrese Ubicacion'>";
	else:
		echo "<input id='pac-input' name='pac-input' class='form-control' type='text' placeholder='Ingrese Ubicacion'>";
	endif;	
	else:
		echo "<input id='pac-input' name='pac-input' class='form-control' type='text' placeholder='Ingrese Ubicacion'>";
	endif;
?>
<!-- 		<input id="pac-input" name="pac-input" class="form-control" type="text" placeholder="Ingrese Ubicacion">							 -->
	</div>

	  	<div class="form-group col-sm-6 col-xs-6">
  	<!-- <input type="hidden" name="val" value=""> -->
  	<label > </label> 
  		<input type="submit" class="btn btn-primary btn-lg btn-block" name="btnCrearTorneo" id="btnCrearTorneo" value="CREAR TORNEO"></input>
  	</div>
</form>
</div>
</div>
<?php
	if(isset($_SESSION['correcto'])):
	if($_SESSION['correcto'] == 0):
		echo "<div class='alert alert-danger col-xs-12 col-sm-12 pull-left' role='alert'>Fallo</div>";
	else:
		echo "";
	endif;	
	endif;
?>

<?php
	if(isset($_SESSION['correcto'])):
	if($_SESSION['correcto'] == 1):
		$db_datos_torneo = & JDatabase::getInstance( $option );
		$query_datos_torneo = "SELECT UPPER(descripcion) as descr_torneo, id_deporte FROM torneo WHERE id_torneo =".$_SESSION['id_torneo'];	
		$db_datos_torneo->setQuery($query_datos_torneo);
		$db_datos_torneo->execute();		
		$results_datos_torneo = $db_datos_torneo->loadObjectList();
?>
	<div class="panel panel-primary">
		<div class="panel-heading">DATOS DEL TORNEO</div>
		<div class="panel-body">
			<div class="row">
				<div class="col-sm-8 vr">
				<form action="validaciones/v_actualizar_t.php" id="actualizar_torneo" name="actualizar_torneo" method="post" role="form" target="_parent">
					<div class="row">					
					<div class="col-sm-12">					
						<div class="form-group">
							<label class="control-label" for="a_nombre_torneo">NOMBRE</label>
							<input type="text" id="a_nombre_torneo" name="a_nombre_torneo" placeholder="NOMBRE TORNEO" class="form-control">
						</div>			
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label class="control-laber" for="direccion">UBICACIÓN	</label>
							<?php
								if(isset($_SESSION['correcto'])):		
								if($_SESSION['correcto'] == 1):
									// unset($_SESSION['correcto']);
									// if(isset($_GET['id_torneo'])):
									// 	echo "<div class='alert alert-success col-xs-12 col-sm-12' role='alert'>BIENVENIDO</div>";
									// else:
									// 	echo "<div class='alert alert-success col-xs-12 col-sm-12 pull-left' role='alert'>EXITO</div>";
									// endif;		
									echo "<input id='pac-input' name='pac-input' class='form-control' type='text' placeholder='Ingrese Ubicacion'>";
								else:
									echo "<input id='no-place' name='no-place' class='form-control' type='text' placeholder='Ingrese Ubicacion'>";									
								endif;	
								else:
									echo "<input id='no-place' name='no-place' class='form-control' type='text' placeholder='Ingrese Ubicacion'>";									
								endif;
							?>
							<!-- <input id="pac-input" name="pac-input" class="form-control" type="text" placeholder="Ingrese Ubicacion">							 -->
						</div>
					</div>
					<div class="col-sm-12">					
						<div class="form-group">
							<label class="control-label" for="a_nombre_torneo">NOMBRE</label>
							<input type="text" id="a_nombre_torneo" name="a_nombre_torneo" placeholder="NOMBRE TORNEO" class="form-control">
						</div>			
					</div>
					<div class="col-sm-12">					
						<div class="form-group">
							<label class="control-label" for="a_nombre_torneo">NOMBRE</label>
							<input type="text" id="a_nombre_torneo" name="a_nombre_torneo" placeholder="NOMBRE TORNEO" class="form-control">
						</div>			
					</div>
					<div class="col-sm-4">
						<div class="form-group">
						<label class="control-label" for="a_puntos_g">PUNTOS POR GANAR</label>
							<input type="text" id="a_puntos_g" name="a_puntos_g" value="NOMBRE TORNEO" class="form-control">
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
						<label class="control-label" for="a_puntos_p">PUNTOS POR PERDER</label>
							<input type="text" id="a_puntos_P" name="a_puntos_P" value="NOMBRE TORNEO" class="form-control">
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
						<label class="control-label" for="a_puntos_e">PUNTOS POR EMPATAR</label>
							<input type="text" id="a_puntos_e" name="a_puntos_e" value="NOMBRE TORNEO" class="form-control">						
						</div>	
					</div>
					<div class="col-xs-4 text-center">
					
					<input type="submit" class="btn-primary btn btn-block btn-md" name="btn_a_torneo" id="btn_a_torneo" value="GUARDAR">
					</div>										
					</div>
					</form>
				</div>
				<div class="col-sm-4">
				<a class="a_ns" href="#modal_estado_t">
				<div class="well">	
				<span class="media-heading h4 clearfix text-primary">PUBLICADO</span>				
					"SI ESTA PUBLICADO LO PODRAN VER LOS DEMAS USUARIOS REGISTRADOS"
				</div>
				</a>					
					<form action="validaciones/v_eliminar_t.php" id="eliminar_torneo" name="eliminar_torneo" method="post" role="form" target="_parent">
						<input  type="submit" class="btn-danger btn btn-sm pull-right" name="btn_a_torneo" id="btn_a_torneo" value="ELIMINAR TORNEO">
					</form>
					
				</div>
			</div>
		</div>
	</div>
<?php
	endif;
	endif;
?>
<div id="map"></div>
</body>
	<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDow8Qmh2-GzKZY1CZ-NXsC7vL89-qYrVs&signed_in=true&libraries=places&callback=initMap"
        async defer></script>
</html>

