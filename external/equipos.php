  
<!-- <div> -->
<!-- <a href="equipos.php" role="button" class="btn btn-large btn-primary" data-toggle="modal" data-target="#myModal">Launch Demo Modal</a> -->
<?php
  session_start();

  if(isset($_GET['id_equipo'])):
      header('Location: ficha_equipo.php?id_equipo='.$_GET['id_equipo']);     
      echo "hola";
  endif;
  include "conexion.php";
?>
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
 <div id="modalCrearEquipo" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Content will be loaded here from "remote.php" file -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">CREAR EQUIPO</h4>
            </div>
            <div class="modal-body">
            
            <div class=" container">
          <div class="col-sm-5 col-sm-offset-1">
            <form action="validaciones/v_equipo.php" class="form" role="form" name="equipo" id="equipo" method="post" target="_parent" enctype="multipart/form-data">
			  <div class="form-group" id="divNombreEquipo">
			  <label for="nombreEquipo" class="control-label">NOMBRE EQUIPO *</label> 			    
			    <input type="text" class="form-control" id="nombreEquipo" name="nombreEquipo">
			  </div>
        <div class="form-group">
        <label for="pac-input" class="control-label">UBICACIÓN</label>           
          <input id='pac-input' name='pac-input' class='form-control' type='text' placeholder='Ingrese Ubicacion'>
        </div>          
        <div class="form-group">
        <label for="color1Equipo" class="control-label">EQUIPACION 1 </label>           
        <div class="row">
        <div class="col-sm-6 pull-right">
          <input type='color' class="form-control" name='color11Equipo' />
        </div>
        <div class="col-sm-6 pull-right">
          <input type='color' class="form-control" name='color1Equipo' />          
        </div>
        </div>
        </div>
        <div class="form-group">
        <label for="color2Equipo" class="control-label">EQUIPACION 2 </label>           
          <div class="row">
        <div class="col-sm-6 pull-right">
          <input type='color' class="form-control" name='color22Equipo' />
        </div>
        <div class="col-sm-6 pull-right">
          <input type='color' class="form-control" name='color2Equipo' />          
        </div>
        </div>
        </div>
        <div class="form-group col-sm-8">
        <!-- <label for="escudo" class="control-label">ESCUDO </label>            -->
        <span class="btn btn-info btn-file">
         ELEGIR ESCUDO <input type="file"  name="escudo" id="escudo"> 
        </span>
        </div>

			  
			  <input type="submit" class="btn btn-success" name="btnCrearEquipo" id="btnCrearEquipo" value="CREAR"></input>
			</form>
      </div>
      
			</div>
			</div>
        </div>
    </div>
</div>
<!-- </div> -->

  <!DOCTYPE html>
  <html lang="en">
  <head>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  	<meta charset="UTF-8">
  	<title>Document</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">  
<link rel="stylesheet" type="text/css" href="css/my_navbars.css">
<link rel="stylesheet" href="css/jasny-bootstrap.min">

<link rel="stylesheet" type="text/css" href="css/custom.css">
<script src='js/spectrum.js'></script>
<link rel="stylesheet" href="css/spectrum.css">

</head>
<script type="text/javascript" src="js/automapa.js"></script>
<script type="text/javascript" src="../media/jui/js/jquery.js"></script>
  <body>

 <script language="javascript">// <![CDATA[
$(document).ready(function() {
// 	$("#btnCrearEquipo").click(function(){
		// Interceptamos el evento submit
    $('#equipo').submit(function() {
    	var nombreE = $('#nombreEquipo').val();
  // Enviamos el formulario usando AJAX
  	if(nombreE != ""){
        // $.ajax({
        //     type: 'POST',
        //     url: $(this).attr('action'),
        //     data: $(this).serialize(),
        //     // Mostramos un mensaje con la respuesta de PHP
        //     success: function(data) {
        //         $('#result').html(data);
        //     }
        // })        
    	$("#divNombreEquipo").addClass("has-success");	
        return true;

        }else{
		$("#divNombreEquipo").addClass("has-error");	
		return false;
	};
    });
})
// ]]></script>
 
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
      <li><a href="#modalCrearEquipo" data-toggle="modal" data-backdrop="static">CREAR EQUIPO</a></li>
    </ul>
    <div style='margin-top:2px;'>
    <form class="navbar-form navbar-right" role="search" method="post" action="">
      <div class="input-group input-group-sm">
      <input type="text" class="form-control" placeholder="Buscar Equipo" name = "txtBEquipo">
      <span class="input-group-btn">

      <button type="submit" name='btnBuscarEquipo' class="btn btn-default"><span class="glyphicon glyphicon-search "></span></button>
      </span>
        
      </div>
      
    </form>
    </div>
  </div>  
</nav>


	<?php 
	//<a href='../index.php/definir-tor?id_torneo=".$id_t."&descripcion=".$descripcion."' target='_parent'>
	//<a href='../index.php/definir-tor?id_torneo=".$id_t."' target='_parent'>
	//class='btn btn-info' role='button'
	if(isset($_SESSION['id_torneo'])):
    ?>
  
  <table class="table table-hover">
  <thead>
    <tr>
      <th>ESCUDO</th>
      <th>NOMBRE</th>
      <th>UBICACIÓN</th>
      <th>EQUIPACION 1</th>
      <th>EQUIPACION 2</th>
    </tr>
  </thead>
  <tbody data-link="row" class="rowlink">

  <?php

  try{
    $db_jet = & JDatabase::getInstance( $option );
    if(isset($_POST['btnBuscarEquipo'])):
      

        $query_jet = "SELECT DISTINCT (equipo.id_equipo) as this_id_equipo, equipo.nombre as nombre_equipo, color1, color2, ubicacion  
        FROM equipo, jugador_equipo_t   
        WHERE equipo.id_equipo = jugador_equipo_t.id_equipo and jugador_equipo_t.id_torneo =".$_SESSION['id_torneo']. " AND equipo.nombre LIKE '%".$_POST['txtBEquipo']."%'";        

    else:
      $query_jet = "SELECT DISTINCT (equipo.id_equipo) as this_id_equipo, equipo.nombre as nombre_equipo, color1, color2, ubicacion 
      FROM equipo, jugador_equipo_t   
      WHERE equipo.id_equipo = jugador_equipo_t.id_equipo and jugador_equipo_t.id_torneo =".$_SESSION['id_torneo']; 
      
    endif;

      $db_jet->setQuery($query_jet);
      $db_jet->execute();
      $numRows_jet = $db_jet->getNumRows(); 
      $results_jet = $db_jet->loadObjectList();    
        


  }catch(Exception $e){
    echo $e;
  }

      for($i = 0; $i<$numRows_jet; $i++):
        $id_e = $results_jet[$i]->this_id_equipo;
      if(!is_null($results_jet[$i]->color1)):
      $array_color1= $results_jet[$i]->color1;
      $color1_explode = explode('|', $array_color1);
      $color11= $color1_explode[0];
      $color12= $color1_explode[1];

      $array_color2= $results_jet[$i]->color2;
      $color2_explode = explode('|', $array_color2);
      $color21= $color2_explode[0];
      $color22= $color2_explode[1];
      endif;
        //$descripcion = $results[$i]->descripcion;
        echo "      
      <tr>";
      if(file_exists("img/escudos/".$results_jet[$i]->this_id_equipo.".png")):
      echo"
        <td>
          <img src='img/escudos/".$results_jet[$i]->this_id_equipo.".png' height='24px' width='24px'>   
        </td>";
      elseif(file_exists("img/escudos/".$results_jet[$i]->this_id_equipo.".jpg")):
      echo"
        <td>
          <img src='img/escudos/".$results_jet[$i]->this_id_equipo.".jpg' height='24px' width='24px'>   
        </td>";
      else:
        echo"
        <td>
          <img src='img/escudos/base.png' height='24px' width='24px'>   
        </td>";
      endif;
      echo "
        <td>
          <a href='ficha_equipo.php?id_equipo=".$results_jet[$i]->this_id_equipo."' title='Editar'>
          ".$results_jet[$i]->nombre_equipo."
          </a>
        </td>     
        <td>
          <a href='ficha_equipo.php?id_equipo=".$results_jet[$i]->this_id_equipo."' title='Editar'>
          ".$results_jet[$i]->ubicacion."
          </a>
        </td>     
        <td>
          <input type='text' class='disabled' size='1' style='border-radius: 5px; border: none; background-color: ".$color11.";'>
          <input type='text' class='disabled' size='1' style='border-radius: 5px; border: none; background-color: ".$color12.";'>
        </td>
        <td>
          <input type='text' class='disabled' size='1' style='border-radius: 5px; border: none; background-color: ".$color21.";'>
          <input type='text' class='disabled' size='1' style='border-radius: 5px; border: none; background-color: ".$color22.";'>
          </a>
        </td>     
      </tr>
      ";        
        endfor;        
		
  	else:
  		echo "WTF";
  	endif;
	?>		
	</tbody>
	</table>
  <div id="map"></div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDow8Qmh2-GzKZY1CZ-NXsC7vL89-qYrVs&signed_in=true&libraries=places&callback=initMap"
        async defer></script>
<script src="js/jasny-bootstrap.min.js"></script>
  </body>
  </html>
