<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="../media/jui/css/bootstrap.min.css">
</head>
<body>
	<?php
	include "conexion.php";

	$query = "SELECT nombre FROM pais";	
	$db->setQuery($query);
	$db->execute();
	$numRows = $db->getNumRows();	
	$results = $db->loadObjectList();
?>

<form action="." id="defTorneo" class="form-horizontal" role="form">
	<div class="form-group">
	<label for="nombre" class="col-sm-3 control-label">Nombre:</label> 
		<div class="col-lg-10">
		<input type="text" class="form-control" name="nombre" id="nombre">
		</div>
	</div>
	<div class="form-group">
	<label for="cant_equipos" class="control-label">Número de equipos:</label> 
		<div class="col-lg-10">	
		<input type="text" class="form-control" name="nEquipos" id="nEquipos">
		</div>
	País:
	<select name='listaPais' form='defTorneo'>;  		

  		<?php 		 		  	
  			echo "<option value=".$results[0]->nombre.">".$results[0]->nombre."</option>";
  			for($i = 0; $i<$numRows; $i++):
  			echo "<option value='".$results[$i]->nombre."'>".$results[$i]->nombre."</option>";	
  			endfor;  			  			  		
  		?>
<?php
	$query = "SELECT nombre FROM pais";	
	$db->setQuery($query);
	$db->execute();
	$numRows = $db->getNumRows();	
	$results = $db->loadObjectList();
 ?>    					
  	</select>
</form>
	<script type="text/javascript" src="../media/jui/js/jquery.js"></script>
	<script type="text/javascript" src="../media/jui/js/bootstrap.min.js"></script>
</body>
</html>

