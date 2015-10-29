 
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

<script type="text/javascript">
$(document).ready(function(){
    $(".icon-input-btn").each(function(){
        var btnFont = $(this).find(".btn").css("font-size");
        var btnColor = $(this).find(".btn").css("color");
        $(this).find(".glyphicon").css("font-size", btnFont);
        $(this).find(".glyphicon").css("color", btnColor);
        if($(this).find(".btn-xs").length){
            $(this).find(".glyphicon").css("top", "24%");
        }
    }); 
});
</script>

  <body>

 
<?php 
    session_start();
  include "conexion.php";
  if(isset($_SESSION['id_torneo'])):
    $db_all_g = & JDatabase::getInstance( $option );
    $query_all_g = "SELECT *
    FROM grupo
    WHERE id_torneo =".$_SESSION['id_torneo']." ORDER BY id_grupo"; 
    $db_all_g->setQuery($query_all_g);
    $db_all_g->execute();
    $numRows_all_g = $db_all_g->getNumRows(); 
    $results_all_g = $db_all_g->loadObjectList();

    $db_e = & JDatabase::getInstance( $option );
    $query_e = "SELECT *
    FROM grupo
    WHERE id_torneo =".$_SESSION['id_torneo']." AND tipo_grupo = 0";  
    $db_e->setQuery($query_e);
    $db_e->execute();
    $numRows_e = $db_e->getNumRows(); 
    $results_e = $db_e->loadObjectList();

    $db_l = & JDatabase::getInstance( $option );
    $query_l = "SELECT *
    FROM grupo
    WHERE id_torneo =".$_SESSION['id_torneo']." AND tipo_grupo = 1";  
    $db_l->setQuery($query_l);
    $db_l->execute();
    $numRows_l = $db_l->getNumRows(); 
    $results_l = $db_l->loadObjectList();

    $db_tabla_grupo = & JDatabase::getInstance( $option );
    $db_equi_no_g = & JDatabase::getInstance( $option );
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
      <span class="icon-input-btn"><span class="glyphicon glyphicon-calendar"></span>
      <input type="submit" class="btn btn-default" value="CREAR CALENDARIO" id="btnAutoCalen" name="btnAutoCalen">
      </span>
      <span class="icon-input-btn"><span class="glyphicon glyphicon-plus"></span>
      <input type="submit" class="btn btn-default" value="NUEVA JORNADA" id="btnNuevaJor" name="btnNuevaJor">
      </span>
    </form>
  </div>  
</nav>
<?php 
?>
  <ul class="nav nav-tabs">
    <?php
    if(isset($_SESSION['id_torneo'])):
      for($i = 0; $i < $numRows_all_g; $i++):
        echo "<li";
      if($i == 0):        
        echo " class='active'";
      endif;  
      echo"><a data-toggle='tab' href='#".$results_all_g[$i]->id_grupo."'>".$results_all_g[$i]->descripcion."</a></li>";
      endfor;
    ?>
  </ul>

  <div class="tab-content">
    <?php 
      for ($i=0; $i < $numRows_all_g; $i++): 

        echo "
      <div id='".$results_all_g[$i]->id_grupo."' class='tab-pane fade";
      if($i == 0):        
        echo " in active";
      endif;  
      echo "'>
    <div class='btn-toolbar pull-right' role='toolbar' aria-label='Toolbar with button groups'>
      <div class='btn-group'>
      <a href='#aniadirEquipo".$results_all_g[$i]->id_grupo."' class='btn btn-primary btn-sm' role='button' data-toggle='modal' data-backdrop='static'>NUEVO PARTIDO</a>      
      </div>
      <div class='btn-group'>
      <div class='dropdown'>
        <button class='btn btn-primary dropdown-toggle btn-sm' type='button' data-toggle='dropdown'>JORNADA        
        <span class='caret'></span></button>
        <ul class='dropdown-menu' style='right: 0; left: auto; top: 27px;'>
          <li><a href='#config".$results_all_g[$i]->id_grupo."' role='button' data-toggle='modal' data-backdrop='static'><span class='glyphicon glyphicon-cog'></span> CONFIGURAR JORNADA</a></li>
          <li><a href='#config".$results_all_g[$i]->id_grupo."' role='button' data-toggle='modal' data-backdrop='static'><span class='glyphicon glyphicon-trash'></span> ELIMINAR JORNADA</a></li>
        </ul>
      </div>
      
      </div>
    </div> 
    <table class='table table-hover'>
    <thead>
      <tr>
        <th>EQUIPO 1</th>
        <th>RESULTADO</th>
        <th>EQUIPO 2</th>
        <th>FECHA</th>
        <th>HORA</th>
        <th>LUGAR</th>
        <th>ESTADO</th>
      </tr>
      </thead>
      <tbody data-link='row' class='rowlink'>";        
        $query_tabla_grupo = "SELECT equipo.nombre as nombre_equipo
        FROM equipo_grupo, equipo
        WHERE equipo_grupo.id_equipo = equipo.id_equipo AND equipo_grupo.id_grupo =".$results_all_g[$i]->id_grupo;  
        $db_tabla_grupo->setQuery($query_tabla_grupo);
        $db_tabla_grupo->execute();   
        $numRows_tabla_grupo = $db_tabla_grupo->getNumRows();      
        $results_tabla_grupo = $db_tabla_grupo->loadObjectList();

        for ($j=0; $j < $numRows_tabla_grupo; $j++): 
          echo "<tr>
          <td>#</td>          
          <td>".$results_tabla_grupo[$j]->nombre_equipo."</td>          
        </tr>"; 
        endfor;       
      echo "
    <tbody>    
    </table>  
   </div>
      ";
      endfor;
    endif;
    ?>
   
    <!-- <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div> -->
  </div>

<div id="result"></div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  </body>


<!--MODALS-->  
<!-- <div> -->
<!-- <a href="equipos.php" role="button" class="btn btn-large btn-primary" data-toggle="modal" data-target="#myModal">Launch Demo Modal</a> -->
 
 <?php
 if(isset($_SESSION['id_torneo'])):
      for($i = 0; $i < $numRows_all_g; $i++):
      echo "
<div id='aniadirEquipo".$results_all_g[$i]->id_grupo."' class='modal fade'>
    <div class='modal-dialog'>
        <div class='modal-content'>            
            <div class='modal-header'>
                <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>
                <h4 class='modal-title'>AÑADIR EQUIPO</h4>
            </div>
            <div class='modal-body'>
            <div id='cr_equipo'>
            <div class='container'>
        <form action='validaciones/v_clasificacion.php' role='form' name='anadirEquipo' id='equipo' method='post' target='_parent'>
            <input type='hidden' name ='idGrupo' value='".$results_all_g[$i]->id_grupo."'>
        <div class='form-group col-sm-5'>
        <label for='nombreEquipo' class='control-label'>EQUIPO:</label>          
        <select class='form-control' name='aEquipo' id='aEquipo' form='anadirEquipo'>
        <option value='0'>-</option>
          ";          
        $query_equi_no_g = "SELECT DISTINCT equipo.nombre as nombre_equipo, jugador_equipo_t.id_equipo as id_equip
        FROM jugador_equipo_t, equipo
        WHERE jugador_equipo_t.id_equipo = equipo.id_equipo AND jugador_equipo_t.id_equipo 
        NOT IN (SELECT id_equipo FROM equipo_grupo WHERE id_grupo =".$results_all_g[$i]->id_grupo.")";  
        $db_equi_no_g->setQuery($query_equi_no_g);
        $db_equi_no_g->execute();   
        $numRows_equi_no_g = $db_equi_no_g->getNumRows();      
        $results_equi_no_g = $db_equi_no_g->loadObjectList();
        for ($j=0; $j < $numRows_equi_no_g; $j++): 
          echo "<option value='".$results_equi_no_g[$j]->id_equip."'>".$results_equi_no_g[$j]->nombre_equipo."</option>";
        endfor;      
      echo"
        </select>
        </div>        
        <div class='col-sm-12 col-sm-offset-1'>
        <input type='submit' class='btn btn-success' name='btnCrearEquipo' id='btnCrearEquipo' value='ACEPTAR'></input>
        <input type='button' class='btn btn-default' data-dismiss='modal' value='CANCELAR'></input>
        </div>
      </form>
      </div>
      </div>
      </div>
        </div>
    </div>
</div>

<div id='config".$results_all_g[$i]->id_grupo."' class='modal fade'>
    <div class='modal-dialog'>
        <div class='modal-content'>            
            <div class='modal-header'>
                <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>
                <h4 class='modal-title'>CAMBIAR NOMBRE</h4>
            </div>
            <div class='modal-body'>
            <div id='cr_equipo'>
            <div class='container'>
            <form action='validaciones/v_clasificacion.php' role='form' name='anadirEquipo' id='equipo' method='post' target='_parent'>
        <div class='form-group col-sm-5'>
        <label for='nombreEquipo' class='control-label'>NOMBRE:</label>          
        <input type='text' name='nombreLiga' class='form-control' id='nombreLiga'>
        </div>        
        <div class='col-sm-12 col-sm-offset-1'>
        <input type='submit' class='btn btn-success' name='btnCrearEquipo' id='btnCrearEquipo' value='ACEPTAR'></input>
        <input type='button' class='btn btn-default' data-dismiss='modal' value='CANCELAR'></input>
        </div>
      </form>
      </div>
      </div>
      </div>
        </div>
    </div>
</div> 
    ";
      endfor;
endif;
    ?>
  </html>