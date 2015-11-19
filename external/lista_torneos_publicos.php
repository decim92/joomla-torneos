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
            $query_consulta = " SELECT torneo.descripcion AS nombre_torneo, torneo.id_torneo as this_id_torneo, deporte.nombre as nombre_deporte,
                                       categoria.descripcion AS categoria
                                FROM torneo, categoria, deporte
                                WHERE categoria.id_categoria = torneo.id_categoria and deporte.id_deporte = torneo.id_deporte and
                                      torneo.publicado=1 and torneo.descripcion LIKE '%".$_POST['buscara']."%'"; 
            $db_consulta->setQuery($query_consulta);
            $db_consulta->execute();
            $numRows_buscar = $db_consulta->getNumRows();   // obtener numero de filas
            $results_buscar = $db_consulta->loadObjectList(); // carga array de los resultados
        }else{
            $query_consulta = " SELECT torneo.descripcion AS nombre_torneo, torneo.id_torneo as this_id_torneo, deporte.nombre as nombre_deporte,
                                       categoria.descripcion AS categoria
                                FROM torneo, categoria, deporte
                                WHERE categoria.id_categoria = torneo.id_categoria and deporte.id_deporte = torneo.id_deporte and
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
            <thead>
              <tr>
              <th>LOGO</th>
               <th>NOMBRE TORNEO</th>
               <th>DEPORTE</th>
               <th>CATEGORIA</th>
              </tr>
            </thead>
            <tbody data-link="row" class="rowlink">
    	
    	<?php 
    		for ($i=0; $i <$numRows_buscar ; $i++):
    		   echo "<tr>";
         if(file_exists("img/torneos/".$results_buscar[$i]->this_id_torneo.".png")):
          echo"
            <td>
              <img src='img/torneos/".$results_buscar[$i]->this_id_torneo.".png' height='24px' width='24px'>   
            </td>";
          elseif(file_exists("img/torneos/".$results_buscar[$i]->this_id_torneo.".jpg")):
          echo"
            <td>
              <img src='img/torneos/".$results_buscar[$i]->this_id_torneo.".jpg' height='24px' width='24px'>   
            </td>";
          else:
            echo"
            <td>
              <img src='img/torneos/trophy.png' height='24px' width='24px'>   
            </td>";
          endif;
         echo"
    		     <td><a href='vista_publica_torneos.php?id_torneo=".$results_buscar[$i]->this_id_torneo."'>".$results_buscar[$i]->nombre_torneo."</a></td>    		     
              <td>".$results_buscar[$i]->nombre_deporte."</td>
                 <td>".$results_buscar[$i]->categoria."</td>
    		   </tr>";
    		endfor;    	
    	?>
      </tbody>
    </table>	
</div>
  </div>
  </div>
</body>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="js/jasny-bootstrap.min.js"></script>
</html>
