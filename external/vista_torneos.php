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
	$query = "SELECT id_torneo, descripcion FROM torneo WHERE id_usuario = ".$user->id;	
	$db->setQuery($query);
	$db->execute();
	$numRows = $db->getNumRows();	
	$results = $db->loadObjectList();
?>

	<table class="table table-hover">
	<tbody data-link="row" class="rowlink">
	<?php 
	//<a href='../index.php/definir-tor?id_torneo=".$id_t."&descripcion=".$descripcion."' target='_parent'>
	//<a href='../index.php/definir-tor?id_torneo=".$id_t."' target='_parent'>
	//class='btn btn-info' role='button'
		for($i = 0; $i<$numRows; $i++):
			$id_t = $results[$i]->id_torneo;
			//$descripcion = $results[$i]->descripcion;
			echo "			
		<tr>
			<td>
				".$results[$i]->id_torneo."		
			</td>
			<td>
				<a href='../definir-tor/".$id_t."' target='_parent'>
				".$results[$i]->descripcion."
				</a>
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
	<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jasny-bootstrap.min.js"></script>
</body>
</html>