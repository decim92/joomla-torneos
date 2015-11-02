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
<body>
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
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          EQUIPOS <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="#modalCrearEquipo" data-toggle="modal" data-backdrop="static">CREAR EQUIPO</a></li>
          <li class="divider"></li>
          <li><a href="#">IMPORTAR EXISTENTE</a></li>          
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          JUGADORES <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="#">AÑADIR JUGADOR</a></li>
          <li class="divider"></li>
          <li><a href="#">IMPORTAR EXISTENTE</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          PARTICIPANTES <b class="caret"></b>
        </a>
        <ul class="dropdown-menu">
          <li><a href="#">AÑADIR PARTICIPANTE</a></li>
          <li class="divider"></li>
          <li><a href="#">IMPORTAR EXISTENTE</a></li>
        </ul>
      </li>
    </ul>
 
    <form class="navbar-form navbar-right" role="search">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Buscar">
      </div>
      <button type="submit" class="btn btn-default">Enviar</button>
    </form>
  </div>  
</nav>
</body>

<!-- <div> -->
<!-- <a href="equipos.php" role="button" class="btn btn-large btn-primary" data-toggle="modal" data-target="#myModal">Launch Demo Modal</a> -->
 
 <div id="modalCrearEquipo" class="modal fade">
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
<ol class="breadcrumb">
  <li><a href="equipos.php">EQUIPO</a></li>
  <li><a class="active">NOMBRE EQUIPO</a></li>
</ol>
<div class="row">
  <div class="col-xs-1 col-sm-1">
    <a href="#" class="thumbnail">
      <img src="img/escudos/x.jpg" alt="" width="60px" height="60px">
    </a>
  </div>
  <form action="validaciones/v_escudo.php" method="post" enctype="multipart/form-data">
            <input type="text" name="nombre" placeholder="nombre del equipo/jugador"> <br>
            <input type="file" name="imagen"/> <br>
            <input type="submit" value="guardar"/> 
  </form>
    <h4>FICHA EQUIPO</h4>
    <h4>DEPORTE</h4>
</div>
<!-- <h2>FICHA EQUIPO</h2> -->
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#info_equipo">INFORMACIÓN</a></li>
    <li><a data-toggle="tab" href="#lista_jugadores">JUGADORES</a></li>
  </ul>

  <div class="tab-content">
    <div id="info_equipo" class="tab-pane fade in active">
      <h3>INFORMACIÓN</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="lista_jugadores" class="tab-pane fade">
      <h3>JUGADORES</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
  </div>

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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jasny-bootstrap.min.js"></script>
</html>