
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

  <h2>Dynamic Tabs</h2>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
    <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
    <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
  </div>

  <table class="table table-hover">
  <thead>
    <tr>
      <th>EQUIPO 1</th>      
      <th>RESULTADO</th>
      <th>EQUIPO 2</th>
      <th>FECHA</th>
      <th>HORA</th>
      <th>LUGAR?</th>
      <th>ESTADO</th>
    </tr>
  </thead>
  <tbody data-link="row" class="rowlink">
  </tbody>
  </table>
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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jasny-bootstrap.min.js"></script>
</html>