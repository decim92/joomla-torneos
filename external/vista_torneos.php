<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/jasny-bootstrap.min">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

</head>
<script type="text/javascript" src="../media/jui/js/jquery.js"></script>
<body>

<?php 
include "conexion.php";
	
	$db = & JDatabase::getInstance( $option );
	$user = JFactory::getUser();
	// $query = "SELECT id_torneo, descripcion FROM torneo WHERE id_usuario = ".$user->id;	
	$query = "SELECT torneo.id_torneo as id_t, torneo.descripcion as descr_t, categoria.descripcion as descr_c, deporte.nombre as nombre_d, torneo.publicado as estado, puntos_p, puntos_g, puntos_e, ubicacion 
	FROM torneo, categoria, deporte WHERE categoria.id_categoria = torneo.id_categoria and deporte.id_deporte = torneo.id_deporte and id_usuario=".$user->id;
	$db->setQuery($query);
	$db->execute();
	$numRows = $db->getNumRows();	
	$results = $db->loadObjectList();
?>
	<div class='panel panel-primary'>
	<div class="panel-heading">MIS TORNEOS</div>
	<div class="panel-body">
	<table class="table table-hover">
	 <thead>
    <tr>
      <th>ID</th>
      <th>NOMBRE</th>
      <th>UBICACION</th>
      <th>DEPORTE</th>
      <th>CATEGORIA</th>
      <th>ESTADO</th>
    </tr>
  	</thead>
	<tbody data-link="row" class="rowlink">
	<?php 
	//<a href='../index.php/definir-tor?id_torneo=".$id_t."&descripcion=".$descripcion."' target='_parent'>
	//<a href='../index.php/definir-tor?id_torneo=".$id_t."' target='_parent'>
	//class='btn btn-info' role='button'
		for($i = 0; $i<$numRows; $i++):
			$id_t = $results[$i]->id_t;
			//$descripcion = $results[$i]->descripcion;
			echo "			
		<tr>
			<td>
				".$results[$i]->id_t."		
			</td>
			<td>
				<a href='../definir-tor/".$id_t."' target='_parent' title='Editar'>
				".$results[$i]->descr_t."
				</a>
			</td>
			<td>
				".$results[$i]->ubicacion."		
			</td>
			<td>				
				".$results[$i]->nombre_d."
				</a>
			</td>		
			<td>
				".$results[$i]->descr_c."		
			</td>
			<td>
				";
				if($results[$i]->estado == 1):
					echo "publicado";
				elseif($results[$i]->estado == 0):
					echo "configurando";
				endif;			

				echo "		
			</td>

		</tr>
		";  			
  		endfor;  			  	

  		if(isset($_SESSION['correcto'])):
  			unset($_SESSION['correcto']);
  		endif;		  		
  		if(isset($_SESSION['id_torneo'])):
  			unset($_SESSION['id_torneo']);
  		endif; 		
  		
	?>		
	</tbody>
	</table>
	</div>
	</div>
	</div>
	<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jasny-bootstrap.min.js"></script>
</body>
</html>