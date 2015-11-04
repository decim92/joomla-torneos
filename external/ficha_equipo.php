<?php 
  session_start();
  include "conexion.php";
  if(isset($_SESSION['id_torneo'])):

    $db_equipo = & JDatabase::getInstance( $option );
    $query_equipo = "SELECT DISTINCT equipo.nombre as nombre_equipo, color1, color2, equipo.ubicacion as ubicacion_equipo, equipo.id_equipo as this_id_equipo, deporte.nombre as nombre_d
    FROM jugador_equipo_t, equipo, deporte, torneo
    WHERE deporte.id_deporte = torneo.id_deporte and equipo.id_equipo = jugador_equipo_t.id_equipo and jugador_equipo_t.id_torneo =".$_SESSION['id_torneo']. " AND equipo.id_equipo = ".$_GET['id_equipo']; 

    $db_equipo->setQuery($query_equipo);
    $db_equipo->execute();
    $numRows_equipo = $db_equipo->getNumRows(); 
    $results_equipo = $db_equipo->loadObjectList();    

  else:
   echo "WTF";
  endif;
?>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	<title>Document</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">  
<link rel="stylesheet" type="text/css" href="css/my_navbars.css">
<link rel="stylesheet" href="css/jasny-bootstrap.min">

<link rel="stylesheet" type="text/css" href="css/custom.css">
</head>
<script type="text/javascript" src="js/automapa.js"></script>
<script type="text/javascript" src="../media/jui/js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-toaster.js"></script>

<style>
.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;


}
</style>

<body>

<ol class="breadcrumb">
  <li><a href="index.php/../../equipos" target="_parent">EQUIPO</a></li>
  <li><a class="active"><?php echo $results_equipo[0]->nombre_equipo;?></a></li>
</ol>
<div class="row">
  <div class="col-xs-1 col-sm-1">
    <a href="#modalAEquipo" class="thumbnail" data-toggle="modal" data-backdrop="static">
    <?php
    if(file_exists("img/escudos/".$results_equipo[0]->this_id_equipo.".png")):
      echo "<img src='img/escudos/".$results_equipo[0]->this_id_equipo.".png' alt='' width='60px' height='60px'>";
    else:
      echo "<img src='img/escudos/base.png' alt='' width='60px' height='60px'>";
    endif;
    ?>
      
    </a>
  </div>
    <h4><?php echo $results_equipo[0]->nombre_equipo;?></h4>
    <h4><?php echo $results_equipo[0]->nombre_d;?></h4>
</div>
<!-- <h2>FICHA EQUIPO</h2> -->
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#info_equipo">INFORMACIÓN</a></li>
    <li><a data-toggle="tab" href="#lista_jugadores">JUGADORES</a></li>
  </ul>

  <div class="tab-content">
    <div id="info_equipo" class="tab-pane fade in active">
      <h3>INFORMACIÓN</h3>
      
      <form action="validaciones/v_actualizar_e.php" class="form" role="form" name="equipo" id="equipo" method="post" target="_parent">
        <div class="form-group col-sm-6">
        <label for="nombreEquipo" class="control-label">NOMBRE EQUIPO *</label>           
          <input type="text" class="form-control" id="a_nombre_equipo" name="a_nombre_equipo" value="<?php echo $results_equipo[0]->nombre_equipo;?>">
        </div>
        <div class="form-group col-sm-6">
        <label for="pac-input" class="control-label">UBICACIÓN</label>           
          <input id='pac-input' name='pac-input' class='form-control' type='text' placeholder='Ingrese Ubicacion' value="<?php echo $results_equipo[0]->ubicacion_equipo;?>">
        </div>          
        <div class="form-group col-sm-6">
        <label for="color1Equipo" class="control-label">EQUIPACION 1 </label>           
        <div class="row">
        <div class="col-sm-6 pull-right">
        <?php
          $array_color1= $results_equipo[0]->color1;
          $color1_explode = explode('|', $array_color1);
          $color11= $color1_explode[0];
          $color12= $color1_explode[1];

          $array_color2= $results_equipo[0]->color2;
          $color2_explode = explode('|', $array_color2);
          $color21= $color2_explode[0];
          $color22= $color2_explode[1];
        ?>
          <input type='color' class="form-control" name='color11Equipo' value="#<?php echo $color12;?>"/>
        </div>
        <div class="col-sm-6 pull-right">          
          <input type='color' class="form-control" name='color1Equipo' value="#<?php echo $color11;?>"/>
        </div>
        </div>
        </div>
        <div class="form-group col-sm-6">
        <label for="color2Equipo" class="control-label">EQUIPACION 2 </label>           
          <div class="row">
        <div class="col-sm-6 pull-right">
          <input type='color' class="form-control" name='color22Equipo' value="#<?php echo $color22;?>"/>
        </div>
        <div class="col-sm-6 pull-right">
          <input type='color' class="form-control" name='color2Equipo' value="#<?php echo $color21;?>"/>          
        </div>
        </div>
        </div>
        <input type="hidden" name="idAEquipo" value="<?php echo $results_equipo[0]->this_id_equipo;?>">
        <div class="col-sm-10 col-sm-offset-1">
        <input type="submit" class="btn btn-success btn-block" name="btnAEquipo" id="btnAEquipo" value="ACTUALIZAR"></input>
        </div>
      </form>

    </div>
    <div id="lista_jugadores" class="tab-pane fade">
      <h3>JUGADORES</h3>
      <table class="table table-hover">
  <thead>
    <tr>
      <th>P</th>
      <th>NOMBRES</th>
      <th>APELLIDOS</th>
      <th>PJ</th>
      <th>PG</th>
      <th>PE</th>
      <th>PP</th>
      <th>F</th>
      <th>C</th>
      <th>D</th>
    </tr>
  </thead>
  <tbody data-link="row" class="rowlink">
  </tbody>
  </table>
    </div>
  </div>
<div id="map"></div>

<?php
  if(isset($_SESSION['equipo_a'])):
    if($_SESSION['equipo_a'] == 1):
      echo "
      <script type='text/javascript'>$.toaster({ priority : 'success', title : 'EQUIPO', message : 'Actualizado'});</script>
    ";
    unset($_SESSION['equipo_a']);
    endif;
  endif;
?>

</body>


<div id="modalAEquipo" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Content will be loaded here from "remote.php" file -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">CAMBIAR ESCUDO</h4>
            </div>
            <div class="modal-body">
            <div class=" container">
          <div class="col-sm-5 col-sm-offset-1">
      <form action="validaciones/v_escudo.php" class="form" role="form" name="equipo" id="equipo" method="post" target="_parent" enctype="multipart/form-data">
      <input type="hidden" name="id_equipo" value="<?php echo $_GET['id_equipo'];?>">
        <div class="form-group col-sm-8">
        <!-- <label for="escudo" class="control-label">ESCUDO </label>            -->
        <span class="btn btn-info btn-file">
         ELEGIR ESCUDO <input type="file"  name="escudo" id="escudo"> 
        </span>
        </div>

        
        <input type="submit" class="btn btn-success" name="btnAEscudo" id="btnAEscudo" value="ACEPTAR"></input>
      </form>
      </div>
      
      </div>
      </div>
        </div>
    </div>
</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDow8Qmh2-GzKZY1CZ-NXsC7vL89-qYrVs&signed_in=true&libraries=places&callback=initMap"
        async defer></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jasny-bootstrap.min.js"></script>
</html>

