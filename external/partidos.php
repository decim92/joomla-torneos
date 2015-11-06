<?php 
    session_start();
  include "conexion.php";
  if(isset($_SESSION['id_torneo'])):
  endif;
?>

  <!DOCTYPE html>
  <html lang="en">
  <head>
  	<meta charset="UTF-8">
  	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  	<title>Document</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/my_navbars.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css">

</head>
<script type="text/javascript" src="js/automapa.js"></script>
<script type="text/javascript" src="../media/jui/js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-toaster.js"></script>
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript" src="js/locales.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>

  <body>
<?php
	// echo $_GET['id_equipo1'];
	// echo "<br>";
	// echo $_GET['id_equipo2'];
	// echo "<br>";
	// echo $_GET['id_partido'];
$db_p = & JDatabase::getInstance( $option );
    $query_p = "SELECT fecha, hora, lugar, id_partido
    FROM partido
    WHERE id_torneo =".$_SESSION['id_torneo']." AND id_partido=".$_GET['id_partido']; 
    $db_p->setQuery($query_p);
    $db_p->execute();
    $numRows_p = $db_p->getNumRows(); 
    $results_p = $db_p->loadObjectList();

$db_p_tantos = & JDatabase::getInstance( $option );
    $query_p_tantos = "SELECT tantos1, tantos2
    FROM partido_equipos
    WHERE id_partido=".$_GET['id_partido']; 
    $db_p_tantos->setQuery($query_p_tantos);
    $db_p_tantos->execute();
    $numRows_p_tantos = $db_p_tantos->getNumRows(); 
    $results_p_tantos = $db_p_tantos->loadObjectList();
	
?>
<h4>Configurando Partido</h4>
	<form action="validaciones/v_partido.php" class="form" role="form" name="partido" id="partido" method="post" target="_parent">
        <div class="form-group col-sm-3">
        <label for="equipo1" class="control-label">EQUIPO 1</label>           
          <input type="text" class="form-control" disabled id="equipo1" name="equipo1" value="<?php echo $_GET['n_equipo1'];?>">
        </div>
        <div class="form-group col-sm-2">
        <label for="tantos1" class="control-label">TANTOS 1</label>           
          <input type="number" min="0" class="form-control" id="tantos1" name="tantos1" value="<?php echo $results_p_tantos[0]->tantos1;?>">
        </div>
        <div class="form-group col-sm-1 text-center" style="margin-top: 30px;">
        <strong>:</strong>
        </div>
        <div class="form-group col-sm-2">
        <label for="tantos2" class="control-label">TANTOS 2</label>           
          <input type="number" min="0" class="form-control" id="tantos2" name="tantos2" value="<?php echo $results_p_tantos[0]->tantos2;?>">
        </div>
        <div class="form-group col-sm-3">
        <label for="equipo2" class="control-label">EQUIPO2</label>           
          <input type="text" class="form-control" disabled id="equipo2" name="equipo2" value="<?php echo $_GET['n_equipo2'];?>">
        </div>
        

		            <div class="form-group col-sm-3">
		            <label class="control-label" for="fecha">FECHA:</label>
		                <div class='input-group date' id='datetimepicker1'>
		                    <input type='text' class="form-control" name="fecha" value="<?php echo $results_p[0]->fecha;?>"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
		            </div>
		        </div>
		        <script type="text/javascript">
		            $(function () {
		                $('#datetimepicker1').datetimepicker({
		                	format: 'YYYY-MM-DD',
		                	locale: 'es'
		            });
		                
		            });
		        </script>

		        <div class="form-group col-sm-3">
		            <label class="control-label" for="fecha">HORA:</label>
		                <div class='input-group date' id='datetimepicker2'>
		                    <input type='text' class="form-control" name="hora" value="<?php echo $results_p[0]->hora;?>"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-time"></span>
		                    </span>
		                </div>
		            </div>
		        </div>
		        <script type="text/javascript">
		            $(function () {
		                $('#datetimepicker2').datetimepicker({
		                	// format: 'LT'
		                	format: 'HH:mm:ss'
		            });
		                
		            });
		        </script>
        
        <div class="form-group col-sm-5">
        <label for="pac-input" class="control-label">LUGAR</label>           
          <input id='pac-input' name='pac-input' class='form-control' type='text' placeholder='Ingrese Ubicacion' value="<?php echo $results_p[0]->lugar;?>">
        </div>          
        
        <input type="hidden" name="id_partido" value="<?php echo $_GET['id_partido'];?>">
        <input type="hidden" name="id_equipo1" value="<?php echo $_GET['id_equipo1'];?>">
        <input type="hidden" name="id_equipo2" value="<?php echo $_GET['id_equipo2'];?>">
        <div class="col-sm-9 col-sm-offset-1">
        <input type="submit" class="btn btn-success btn-block" name="btnPartido" id="btnPartido" value="ACTUALIZAR"></input>
        </div>
      </form>
<div id="map"></div>
</body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDow8Qmh2-GzKZY1CZ-NXsC7vL89-qYrVs&signed_in=true&libraries=places&callback=initMap"
        async defer></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</html>