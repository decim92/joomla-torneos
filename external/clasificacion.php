 
  <!DOCTYPE html>
  <html lang="en">
  <head>
  	<meta charset="UTF-8">
  	<title>Document</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/my_navbars.css">

<link rel="stylesheet" type="text/css" href="css/custom.css">
</head>
<script type="text/javascript" src="../media/jui/js/jquery.js"></script>
  <body>

 
<?php 
  	session_start();
	include "conexion.php";
	if(isset($_SESSION['id_torneo'])):
		$db_all_g = & JDatabase::getInstance( $option );
		$query_all_g = "SELECT *
		FROM grupo
		WHERE id_torneo =".$_SESSION['id_torneo'];	
		$db_all_g->setQuery($query_all_g);
		$db_all_g->execute();
		$numRows_all_g = $db_all_g->getNumRows();	
		$results_all_g = $db_all_g->loadObjectList();

    $db_e = & JDatabase::getInstance( $option );
    $query_e = "SELECT DISTINCT (equipo.id_equipo) as this_id_equipo, equipo.nombre as nombre_equipo  
    FROM equipo, jugador_equipo_t   
    WHERE equipo.id_equipo = jugador_equipo_t.id_equipo and jugador_equipo_t.id_torneo =".$_SESSION['id_torneo']; 
    $db_e->setQuery($query_e);
    $db_e->execute();
    $numRows_e = $db_e->getNumRows(); 
    $results_e = $db_e->loadObjectList();

    $db_l = & JDatabase::getInstance( $option );
    $query_l = "SELECT DISTINCT (equipo.id_equipo) as this_id_equipo, equipo.nombre as nombre_equipo  
    FROM equipo, jugador_equipo_t   
    WHERE equipo.id_equipo = jugador_equipo_t.id_equipo and jugador_equipo_t.id_torneo =".$_SESSION['id_torneo']; 
    $db_l->setQuery($query_l);
    $db_l->execute();
    $numRows_l = $db_l->getNumRows(); 
    $results_l = $db_l->loadObjectList();
	else:
		echo "<p>WTF</p>";
	endif;
	
?>
  	<nav class="navbar navbar-default" role="navigation">
  <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-ex1-collapse">
      <span class="sr-only">Desplegar navegación</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">MiTD</a>
  </div>
 
  <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
  <div class="collapse navbar-collapse navbar-ex1-collapse navbar-right">
    <ul class="nav navbar-nav">
    

      <!-- <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          PARTICIPANTES <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="#">AÑADIR PARTICIPANTE</a></li>
          <li class="divider"></li>
          <li><a href="#">IMPORTAR EXISTENTE</a></li>
        </ul>
      </li> -->
    </ul>
    <form name="formLigaEli" id="formLigaEli" action="" class="navbar-form" role="form" method="post">

      <input type="submit" class="btn btn-default" value="NUEVA LIGA" id="btnNuevaLig" name="btnNuevaLig">
      
      <input type="submit" class="btn btn-default" value="NUEVA ELIMINATORIA" id="btnNuevaEli" name="btnNuevaEli">
    </form>
  </div>  
</nav>
<?php 
?>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#liga1">Home</a></li>
    <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
  </ul>

  <div class="tab-content">
    <div id="liga1" class="tab-pane fade in active">
    <div class="btn-toolbar pull-right" role="toolbar" aria-label="Toolbar with button groups">
      <div class="btn-group">
      <a href="#aniadirEquipoL" class="btn btn-primary btn-sm" role="button" data-toggle="modal" data-backdrop="static"> AÑADIR EQUIPO A LIGA</a>      
      </div>
      <div class="btn-group">
      <a href="#configL" class="btn btn-primary btn-sm" role="button" data-toggle="modal" data-backdrop="static">CONFIGURAR LIGA</a>
      </div>
    </div> 
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
  </div>

<table class="table table-hover">
  <thead>
    <tr>
      <th>P</th>
      <th>NOMBRE</th>
      <th>P</th>
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

<div id="result"></div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  </body>


<!--MODALS-->  
<!-- <div> -->
<!-- <a href="equipos.php" role="button" class="btn btn-large btn-primary" data-toggle="modal" data-target="#myModal">Launch Demo Modal</a> -->
 
 <div id="aniadirEquipoL" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Content will be loaded here from "remote.php" file -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">CREAR EQUIPO</h4>
            </div class="modal-body">
            <div id="cr_equipo">
            <div class=" container">

            <form action="validaciones/v_equipo.php" class="form-inline" role="form" name="equipo" id="equipo" method="post" target="_parent">
        <div class="form-group" id="divNombreEquipo">
        <label for="nombreEquipo" class="control-label">NOMBRE EQUIPO:</label>          
          <input type="text" class="form-control" id="nombreEquipo" name="nombreEquipo">
        </div>
        
        <input type="submit" class="btn btn-default" name="btnCrearEquipo" id="btnCrearEquipo" value="CREAR"></input>
      </form>
      </div>
      </div>
        </div>
    </div>
</div>
<!-- </div> -->

<div id="configL" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Content will be loaded here from "remote.php" file -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">CREAR EQUIPO</h4>
            </div class="modal-body">
            <div id="cr_equipo">
            <div class=" container">

            <form action="validaciones/v_equipo.php" class="form-inline" role="form" name="equipo" id="equipo" method="post" target="_parent">
        <div class="form-group" id="divNombreEquipo">
        <label for="nombreEquipo" class="control-label">NOMBRE EQUIPO:</label>          
          <input type="text" class="form-control" id="nombreEquipo" name="nombreEquipo">
        </div>
        
        <input type="submit" class="btn btn-default" name="btnCrearEquipo" id="btnCrearEquipo" value="CREAR"></input>
      </form>
      </div>
      </div>
        </div>
    </div>
</div>

  </html>