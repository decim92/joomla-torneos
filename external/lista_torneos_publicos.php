<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">  
    <link rel="stylesheet" type="text/css" href="css/my_navbars.css">
    <link rel="stylesheet" href="css/jasny-bootstrap.min">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
</head>
	<script type="text/javascript" src="../media/jui/js/jquery.js"></script>
	<?php 
		include"conexion.php";
	 ?>
<body>
	<form  action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" id="form_busqueda" role"form" >
		<div class="class=form-group col-sm-10 col-xs-10">
            <input type="text" class="form-control" id="buscar" name="buscara" form="form_busqueda">
		</div>
        <div class="form-group col-sm-3">
            <label> </label>
            <input type="submit" class="btn btn-primary btn-block btn-lg" value="BUSCAR" id="btnBuscar" name="btnBuscar">  
        </div>	</form>
	<?php 
  $db_consulta= & JDatabase::getInstance( $option );
            $user = JFactory::getUser();
        if (isset($_REQUEST["btnBuscar"])) {
            $query_consulta = " SELECT torneo.descripcion AS nombre_torneo,
                                       categoria.descripcion AS categoria
                                FROM torneo, categoria
                                WHERE categoria.id_categoria = torneo.id_categoria and
                                      torneo.publicado=1 and torneo.descripcion LIKE '%".$_POST['buscara']."%'"; 
            $db_consulta->setQuery($query_consulta);
            $db_consulta->execute();
            $numRows_buscar = $db_consulta->getNumRows();   // obtener numero de filas
            $results_buscar = $db_consulta->loadObjectList(); // carga array de los resultados
        }else{
            $query_consulta = " SELECT torneo.descripcion AS nombre_torneo,
                                       categoria.descripcion AS categoria
                                FROM torneo, categoria
                                WHERE categoria.id_categoria = torneo.id_categoria and
                                      torneo.publicado=1"; 
            $db_consulta->setQuery($query_consulta);
            $db_consulta->execute();
            $numRows_buscar = $db_consulta->getNumRows();   // obtener numero de filas
            $results_buscar = $db_consulta->loadObjectList(); // carga array de los resultados
        }
    ?>
    <table class="table table-default">
    	<tr>
            <thead>
               <th>NOMBRE TORNEO</th>
               <th>TIPO</th>
               <th>CATEGORIA</th>
               <th>USUARIO</th> 
            </thead>
    	</tr>
    	<?php 
    		for ($i=0; $i <$numRows_buscar ; $i++):
    		   echo "<tr>
    		     <td>".$results_buscar[$i]->nombre_torneo."</td>    		     
                 <td>".$results_buscar[$i]->categoria."</td>
                 <td>".$user->username."</td>
    		   </tr>";
    		endfor;    	
    	?>
    </table>	
</body>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="js/jasny-bootstrap.min.js"></script>
</html>
