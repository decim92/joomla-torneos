<?php 
  session_start();
  include "conexion.php";
  if(isset($_SESSION['id_torneo'])):

    $db_ju = & JDatabase::getInstance( $option );
    $query_ju = "SELECT  nombres, apellidos, documento, f_nacimiento, direccion, jugador.id_jugador as id_ju, telefono, email, equipo.nombre as nombre_equipo, jugador_equipo_t.id_equipo as id_eq
    FROM jugador_equipo_t, jugador, equipo
    WHERE equipo.id_equipo = jugador_equipo_t.id_equipo AND jugador.id_jugador = jugador_equipo_t.id_jugador and jugador_equipo_t.id_torneo =".$_SESSION['id_torneo']. " AND jugador_equipo_t.id_equipo = ".$_GET['id_equipo']." AND jugador_equipo_t.id_jugador = ".$_GET['id_jugador']; 

    $db_ju->setQuery($query_ju);
    $db_ju->execute();
    $numRows_ju = $db_ju->getNumRows(); 
    $results_ju = $db_ju->loadObjectList();    

  else:
   echo "WTF";
  endif;
?>

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
  <li><a href='index.php/../../equipos?id_equipo=".$results_ju->id_eq."' target="_parent"><?php echo $results_ju[0]->nombre_equipo;?></a></li>
  <li><a class="active"><?php echo $results_ju[0]->nombres." ".$results_ju[0]->apellidos;?></a></li>
</ol>
<div class="row">
  <div class="col-xs-1 col-sm-1">
    <a href="#modalAJugador" class="thumbnail" data-toggle="modal" data-backdrop="static">
    <?php
    if(file_exists("img/fotos/".$results_ju[0]->id_ju.".png")):
      echo "<img src='img/fotos/".$results_ju[0]->id_ju.".png' alt='' width='60px' height='60px'>";
    elseif(file_exists("img/fotos/".$results_ju[0]->id_ju.".jpg")):
      echo "<img src='img/fotos/".$results_ju[0]->id_ju.".jpg' alt='' width='60px' height='60px'>";
    else:
      echo "<img src='img/fotos/anonimo.png' alt='' width='60px' height='60px'>";
    endif;
    ?>
      
    </a>
  </div>
    <h4><?php echo $results_ju[0]->nombres." ".$results_ju[0]->apellidos;?></h4>
    <h4><?php echo $results_ju[0]->nombre_equipo;?></h4>
</div>

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#info_jugador">INFORMACIÓN</a></li>
  </ul>

  <div class="tab-content">
    <div id="info_jugador" class="tab-pane fade in active">
      <h3>INFORMACIÓN</h3>
      
      <form action="validaciones/v_actualizar_e.php" class="form" role="form" name="equipo" id="equipo" method="post" target="_parent">
        <div class="form-group col-sm-6">
        <label for="a_nombres_j" class="control-label">NOMBRES*</label>           
          <input type="text" class="form-control" id="a_nombres_j" name="a_nombres_j" value="<?php echo $results_ju[0]->nombres;?>">
        </div>
        <div class="form-group col-sm-6">
        <label for="a_apellidos_j" class="control-label">APELLIDOS*</label>           
          <input type="text" class="form-control" id="a_apellidos_j" name="a_apellidos_j" value="<?php echo $results_ju[0]->apellidos;?>">
        </div>
        <div class="form-group col-sm-6">
        <label for="a_documento" class="control-label">DOCUMENTO*</label>           
          <input type="text" class="form-control" id="a_documento" name="a_documento" value="<?php echo $results_ju[0]->documento;?>">
        </div>
        <?php 

        ?>
        <div class="form-group col-sm-6">
        <label for="nombreEquipo" class="control-label">FECHA NACIMIENTO*</label>           
          <input type="text" class="form-control" id="a_nombre_equipo" name="a_nombre_equipo" value="<?php echo $results_equipo[0]->nombre_equipo;?>">
        </div>
        <div class="form-group col-sm-6">
        <label for="a_direccion" class="control-label">DIRECCIÓN*</label>           
          <input type="text" class="form-control" id="a_direccion" name="a_direccion" value="<?php echo $results_ju[0]->direccion;?>">
        </div>
        <div class="form-group col-sm-6">
        <label for="a_telefono" class="control-label">TELÉFONO*</label>           
          <input type="text" class="form-control" id="a_telefono" name="a_telefono" value="<?php echo $results_ju[0]->telefono;?>">
        </div>
        <div class="form-group col-sm-6">
        <label for="a_email" class="control-label">EMAIL*</label>           
          <input type="email" class="form-control" id="a_email" name="a_email" value="<?php echo $results_ju[0]->email;?>">
        </div>
        
        <input type="hidden" name="idAJugador" value="<?php echo $results_ju[0]->id_ju;?>">
        <div class="col-sm-10 col-sm-offset-1">
        <input type="submit" class="btn btn-success btn-block" name="btnAJugador" id="btnAJugador" value="ACTUALIZAR"></input>
        </div>
      </form>


    </div>
  </div>
	
</body>

<div id="modalAJugador" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Content will be loaded here from "remote.php" file -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">CAMBIAR FOTO</h4>
            </div>
            <div class="modal-body">
            <div class=" container">
          <div class="col-sm-5 col-sm-offset-1">
      <form action="validaciones/v_foto.php" class="form" role="form" name="jugador" id="jugador" method="post" target="_parent" enctype="multipart/form-data">
      <input type="hidden" name="id_jugador" value="<?php echo $results_ju[0]->id_ju;?>">
        <div class="form-group col-sm-8">
        <!-- <label for="escudo" class="control-label">ESCUDO </label>            -->
        <span class="btn btn-info btn-file">
         ELEGIR FOTO <input type="file"  name="foto" id="foto"> 
        </span>
        </div>

        
        <input type="submit" class="btn btn-success" name="btnAFoto" id="btnAFoto" value="ACEPTAR"></input>
      </form>
      </div>
      
      </div>
      </div>
        </div>
    </div>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jasny-bootstrap.min.js"></script>
</html>