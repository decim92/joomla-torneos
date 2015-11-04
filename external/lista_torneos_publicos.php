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

  <div style="margin-top: 20px;" class='panel panel-primary'>
  
<div class="panel-heading">TORNEOS PUBLICADOS</div>
<div class="panel-body">

<div style="margin-bottom: 16px; margin-right: 100px;" class="col-sm-5 pull-right">
  <form  action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" id="form_busqueda" role"search" >
    <div class="input-group input-group-sm">
      <input type="text" class="form-control" placeholder="Buscar Torneo" name = "buscara">
      <span class="input-group-btn">
        <button type="submit" name='btnBuscar' class="btn btn-primary"><span class="glyphicon glyphicon-search "></span></button>
      </span>
      </div>
  </form>
  </div>
<div class="col-sm-10 col-sm-offset-1"> 
    <table class="table table-striped ">
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
</div>
  </div>
  </div>
</body>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="js/jasny-bootstrap.min.js"></script>
</html>
