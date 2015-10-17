<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

</head>
<script type="text/javascript" src="../media/jui/js/jquery.js"></script>
<script>
$(document).ready(function(){
$("select").change(function(){
// Vector para saber cuál es el siguiente combo a llenar
var combos = new Array();
combos['pais'] = "estado";
//combos['estado'] = "ciudad";
// Tomo el nombre del combo al que se le a dado el clic por ejemplo: país
posicion = $(this).attr("name");
// Tomo el valor de la opción seleccionada
valor = $(this).val()
// Evaluó  que si es país y el valor es 0, vacié los combos de estado y ciudad
if(posicion == 'pais' && valor==0){
$("#estado").html('    <option value="0" selected="selected">----------------</option>')
//$("#ciudad").html('    <option value="0" selected="selected">----------------</option>')
}else{
/* En caso contrario agregado el letreo de cargando a el combo siguiente
Ejemplo: Si seleccione país voy a tener que el siguiente según mi vector combos es: estado  por qué  combos [país] = estado
*/
$("#"+combos[posicion]).html('<option selected="selected" value="0">Cargando...</option>')
/* Verificamos si el valor seleccionado es diferente de 0 y si el combo es diferente de ciudad, esto porque no tendría caso hacer la consulta a ciudad porque no existe un combo dependiente de este */
if(valor!="0" || posicion !='ciudad'){
// Llamamos a pagina de combos.php donde ejecuto las consultas para llenar los combos
$.post("combos.php",{
combo:$(this).attr("name"), // Nombre del combo
id:$(this).val() // Valor seleccionado
},function(data){
$("#"+combos[posicion]).html(data);    //Tomo el resultado de pagina e inserto los datos en el combo indicado
})
}
}
})
})
</script>
<body>
	<?php

	session_start();
	include "conexion.php";
	// $id_torneo = $_GET['id_torneo'];
	// echo $id_torneo;

	$db = & JDatabase::getInstance( $option );
	$db_tt = & JDatabase::getInstance( $option );
	$db_cate = & JDatabase::getInstance( $option );
	$db_dep = & JDatabase::getInstance( $option );
	$db_ciud = & JDatabase::getInstance( $option );

	$query = "SELECT UPPER(nombre) as nomb, id_pais FROM pais";	
	$db->setQuery($query);
	$db->execute();
	$numRows = $db->getNumRows();	
	$results = $db->loadObjectList();

	$query_tt = "SELECT UPPER(descripcion) as descr_tt, id_tipo_torneo FROM tipo_torneo";	
	$db_tt->setQuery($query_tt);
	$db_tt->execute();
	$numRows_tt = $db_tt->getNumRows();	
	$results_tt = $db_tt->loadObjectList();

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
		if(isset($_GET['id_torneo'])):
			echo "<div class='alert alert-success col-xs-12 col-sm-12 pull-left' role='alert'>BIENVENIDO</div>";
		else:
			echo "<div class='alert alert-success col-xs-12 col-sm-12 pull-left' role='alert'>EXITO</div>";
		endif;		
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
	if(isset($_SESSION['tipo_to'])):
		if($_SESSION['tipo_to'] == 0):
		echo "<div class='form-group col-sm-3 col-xs-3 has-error'>";
		unset($_SESSION['tipo_to']);
	else:
		echo "<div class='form-group col-sm-3 col-xs-3'>";
		endif;	
	else:
		
		echo "<div class='form-group col-sm-3 col-xs-3'>";
	endif;
	?>
	<!-- <div class='form-group col-sm-3 col-xs-3'> -->
	<label for="tipo_t" class="control-label">TIPO:</label> 
		<select name='listaTipoT' class="form-control" form='defTorneo' id="tipo_t">  		
	  		<?php 		 		  	
	  			echo "<option value='0'>SELECCIONE UN TIPO</option>";
	  			for($i = 0; $i<$numRows_tt; $i++):
	  			echo "<option value='".$results_tt[$i]->id_tipo_torneo."'>".$results_tt[$i]->descr_tt."</option>";	
	  			endfor;  			  			  		
	  		?>  					
	  	</select>
  	</div>
  	<?php
  	if(isset($_SESSION['categ'])):
		if($_SESSION['categ'] == 0):
		echo "<div class='form-group col-sm-3 col-xs-3 has-error'>";
		unset($_SESSION['categ']);
	else:
		echo "<div class='form-group col-sm-3 col-xs-3'>";
		endif;	
	else:
		echo "<div class='form-group col-sm-3 col-xs-3'>";
	endif;
	?>
	<!-- <div class='form-group col-sm-3 col-xs-3'> -->
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
		echo "<div class='form-group col-sm-3 col-xs-3 has-error'>";
		unset($_SESSION['deport']);
	else:
		echo "<div class='form-group col-sm-3 col-xs-3'>";
		endif;	
	else:
		echo "<div class='form-group col-sm-3 col-xs-3'>";
	endif;
	?>
	<!-- <div class='form-group col-sm-3 col-xs-3'> -->
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
		echo "<div class='form-group col-sm-3 col-xs-3 has-error'>";
		unset($_SESSION['descrip']);
	else:
		echo "<div class='form-group col-sm-3 col-xs-3'>";
		endif;	
	else:
		echo "<div class='form-group col-sm-3 col-xs-3'>";
	endif;
	?>
	<!-- <div class='form-group col-sm-3 col-xs-3'> -->
	<label for="descripcion" class="control-label">NOMBRE:</label> 
		<input type="text" class="form-control" name="descripcion" id="descripcion">
	</div>
	<?php 
	if(isset($_SESSION['pai'])):
		if($_SESSION['pai'] == "0"):
		echo "<div class='form-group col-sm-3 col-xs-3 has-error'>";
	else:
		echo "<div class='form-group col-sm-3 col-xs-3'>";
		endif;	
	else:
		echo "<div class='form-group col-sm-3 col-xs-3'>";
	endif;
	?>
	<!-- <div class='form-group col-sm-3 col-xs-3'> -->
	<label for="pais" class="control-label">PAIS:</label> 
		<select name='pais' id="pais" class="form-control" form='defTorneo'>;  		
			<option selected="selected" value="0">SELECCIONE UN PAÍS</option>";
	  		<?php 		 		  		  			
	  			for($i = 0; $i<$numRows; $i++):
	  			echo "<option value='".$results[$i]->id_pais."'>".$results[$i]->nomb."</option>";	
	  			endfor;  			  			  		
	  		?>  					
	  	</select>
  	</div>
	<?php
	if(isset($_SESSION['pai'])):
		if($_SESSION['pai'] == "0"):
		echo "<div class='form-group col-sm-3 col-xs-3 has-error'>";
		unset($_SESSION['pai']);
	else:
		echo "<div class='form-group col-sm-3 col-xs-3'>";
		endif;	
	else:
		echo "<div class='form-group col-sm-3 col-xs-3'>";
	endif;
	?>
	<label for="estado" class="control-label">CIUDAD:</label> 
		<select name='estado' class="form-control" form='defTorneo' id="estado">;  		
			<option value="0" selected="selected">SELECCIONE UNA CIUDAD</option>
	  	</select>
  	</div>
  	<div class="form-group col-sm-6 col-xs-6">
  	<!-- <input type="hidden" name="val" value=""> -->
  	<label > </label> 
  		<input type="submit" class="btn btn-primary btn-lg btn-block" name="btnCrearTorneo" id="btnCrearTorneo" value="CREAR TORNEO"></input>
  	</div>
</form>
</div>
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

	<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>

