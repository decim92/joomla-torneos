

<?php

include "conexion.php";

	$query = "SELECT nombre FROM pais";	
	$db->setQuery($query);
	$db->execute();
	$numRows = $db->getNumRows();	
	$results = $db->loadObjectList();
?>

<form action="." id="defTorneo">
	Nombre: 
	<input type="text" name="nombre" id="nombre">
	Número de equipos:
	<input type="text" name="nEquipos" id="nEquipos">
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
