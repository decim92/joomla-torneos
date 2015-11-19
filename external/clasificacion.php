 
  <!DOCTYPE html>
  <html lang="en">
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
  <body>
<script language="javascript">// <![CDATA[
// $(document).ready(function() {
// //  $("#btnCrearEquipo").click(function(){
//     // Interceptamos el evento submit
//     $('#anadirEquipo').submit(function() {
//       var orden = $('#orden').val();
//   // Enviamos el formulario usando AJAX
//     if(orden != ""){
//         // $.ajax({
//         //     type: 'POST',
//         //     url: $(this).attr('action'),
//         //     data: $(this).serialize(),
//         //     // Mostramos un mensaje con la respuesta de PHP
//         //     success: function(data) {
//         //         $('#result').html(data);
//         //     }
//         // })        
//       $("#div_orden").addClass("has-success");  
//         return true;

//         }else{
//     $("#div_orden").addClass("has-error");  
//     return false;
//   };
//     });
// })
// // ]]></script>

 
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
    WHERE id_torneo =".$_SESSION['id_torneo']." AND tipo_grupo = 0 ORDER BY id_grupo"; 
    $db_e->setQuery($query_e);
    $db_e->execute();
    $numRows_e = $db_e->getNumRows(); 
    $results_e = $db_e->loadObjectList();

    $db_l = & JDatabase::getInstance( $option );
    $query_l = "SELECT *
    FROM grupo
    WHERE id_torneo =".$_SESSION['id_torneo']." AND tipo_grupo = 1 ORDER BY id_grupo"; 
    $db_l->setQuery($query_l);
    $db_l->execute();
    $numRows_l = $db_l->getNumRows(); 
    $results_l = $db_l->loadObjectList();




    $db_equi_no_g = & JDatabase::getInstance( $option );
    $db_jornadas_e = & JDatabase::getInstance( $option );
    $db_tabla_partidos1 = & JDatabase::getInstance( $option );
    $db_tabla_partidos2 = & JDatabase::getInstance( $option );
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
    <form name="formLigaEli" id="formLigaEli" action="validaciones/v_clasificacion.php" class="navbar-form" role="form" method="post" target="_parent">
      <input type="hidden" name="elis" value="<?php $cant_e =$numRows_e+1; echo $cant_e?>">
      <input type="hidden" name="ligas" value="<?php $cant_l =$numRows_l+1; echo $cant_l?>">
      <input type="submit" class="btn btn-default" value="NUEVA LIGA" id="btnNuevaLig" name="btnNuevaLig">
      
      <input type="submit" class="btn btn-default" value="NUEVA ELIMINATORIA" id="btnNuevaEli" name="btnNuevaEli">
      <input type="submit" class="btn btn-default" value="DESEMPATE" id="btnDesempate" name="btnDesempate">
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
        if($results_all_g[$i]->tipo_grupo == 1):        
        echo "
      <div id='".$results_all_g[$i]->id_grupo."' class='tab-pane fade";
      if($i == 0):        
        echo " in active";
      endif;  
      echo "'>
    <div class='btn-toolbar pull-right' role='toolbar' aria-label='Toolbar with button groups'>
      <div class='btn-group'>
      <a href='#aniadirEquipo".$results_all_g[$i]->id_grupo."' class='btn btn-primary btn-sm' role='button' data-toggle='modal' data-backdrop='static'> AÑADIR EQUIPO</a>      
      </div>
      <div class='btn-group'>
      <div class='dropdown'>
        <button class='btn btn-primary dropdown-toggle btn-sm' type='button' data-toggle='dropdown'>CONFIGURAR LIGA
        <span class='caret'></span></button>
        <ul class='dropdown-menu' style='right: 0; left: auto; top: 27px;'>
          <li><a href='#config".$results_all_g[$i]->id_grupo."' role='button' data-toggle='modal' data-backdrop='static'>CAMBIAR NOMBRE</a></li>    
          <li><a href='#eliminarG".$results_all_g[$i]->id_grupo."' role='button' data-toggle='modal' data-backdrop='static'><span class='glyphicon glyphicon-trash'></span> ELIMINAR</a></li>
        </ul>
      </div>
      
      </div>
    </div> 
    <table class='table table-hover'>
    <thead>
      <tr>
        <th>POS</th>
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
      <tbody data-link='row' class='rowlink'>"; 
        $db_tabla_grupo = & JDatabase::getInstance( $option );       
        $query_tabla_grupo = "SELECT equipo.nombre as nombre_equipo, equipo_grupo.id_equipo as id_eq, p
        FROM equipo_grupo, equipo
        WHERE equipo_grupo.id_equipo = equipo.id_equipo AND equipo_grupo.id_grupo =".$results_all_g[$i]->id_grupo." ORDER BY p DESC, d DESC, f DESC, pe DESC";  
        $db_tabla_grupo->setQuery($query_tabla_grupo);
        $db_tabla_grupo->execute();   
        $numRows_tabla_grupo = $db_tabla_grupo->getNumRows();      
        $results_tabla_grupo = $db_tabla_grupo->loadObjectList();


        for ($j=0; $j < $numRows_tabla_grupo; $j++): 

            //bloque clasificacion ligas
              //ganados
                $db_ganados = & JDatabase::getInstance( $option );
                      $query_ganados = "SELECT COUNT(id_ganador) as cont_g, id_ganador
                      FROM partido, jornada, grupo
                      WHERE partido.id_jornada = jornada.id_jornada AND jornada.id_grupo = grupo.id_grupo AND grupo.id_grupo = ".$results_all_g[$i]->id_grupo." AND  id_ganador = ".$results_tabla_grupo[$j]->id_eq;
                      $db_ganados->setQuery($query_ganados);
                      $db_ganados->execute();
                      $numRows_ganados = $db_ganados->getNumRows(); 
                      $results_ganados = $db_ganados->loadObjectList();

                $ganados = $results_ganados[0]->cont_g;
              //perdidos
                $db_perdidos = & JDatabase::getInstance( $option );
                      $query_perdidos = "SELECT COUNT(id_perdedor) as cont_p, id_perdedor
                      FROM partido, jornada, grupo
                      WHERE partido.id_jornada = jornada.id_jornada AND jornada.id_grupo = grupo.id_grupo AND grupo.id_grupo = ".$results_all_g[$i]->id_grupo." AND  id_perdedor = ".$results_tabla_grupo[$j]->id_eq;
                      $db_perdidos->setQuery($query_perdidos);
                      $db_perdidos->execute();
                      $numRows_perdidos = $db_perdidos->getNumRows(); 
                      $results_perdidos = $db_perdidos->loadObjectList(); 

                $perdidos = $results_perdidos[0]->cont_p;
              //empatados
                $db_empatados1 = & JDatabase::getInstance( $option );
                      $query_empatados1 = "SELECT COUNT(id_equipo1) as cont_e, id_equipo1
                      FROM partido, jornada, grupo, partido_equipos
                      WHERE partido.id_partido = partido_equipos.id_partido  AND partido.id_jornada = jornada.id_jornada AND jornada.id_grupo = grupo.id_grupo AND grupo.id_grupo = ".$results_all_g[$i]->id_grupo." AND empatado = 1 AND id_equipo1 = ".$results_tabla_grupo[$j]->id_eq;
                      $db_empatados1->setQuery($query_empatados1);
                      $db_empatados1->execute();
                      $numRows_empatados1 = $db_empatados1->getNumRows(); 
                      $results_empatados1 = $db_empatados1->loadObjectList(); 

                $empatados1 = $results_empatados1[0]->cont_e;

                $db_empatados2 = & JDatabase::getInstance( $option );
                      $query_empatados2 = "SELECT COUNT(id_equipo2) as cont_e, id_equipo2
                      FROM partido, jornada, grupo, partido_equipos
                      WHERE partido.id_partido = partido_equipos.id_partido  AND partido.id_jornada = jornada.id_jornada AND jornada.id_grupo = grupo.id_grupo AND grupo.id_grupo = ".$results_all_g[$i]->id_grupo." AND empatado = 1 AND id_equipo2 = ".$results_tabla_grupo[$j]->id_eq;
                      $db_empatados2->setQuery($query_empatados2);
                      $db_empatados2->execute();
                      $numRows_empatados2 = $db_empatados2->getNumRows(); 
                      $results_empatados2 = $db_empatados2->loadObjectList(); 
                  
                $empatados2 = $results_empatados2[0]->cont_e;

                $empatados = $empatados1 + $empatados2;
              //jugados

                $jugados = $ganados + $perdidos + $empatados;

              //puntos
              $db_puntuacion = & JDatabase::getInstance( $option );
                      $query_puntuacion = "SELECT puntos_p, puntos_g, puntos_e
                      FROM torneo
                      WHERE id_torneo =".$_SESSION['id_torneo'];
                      $db_puntuacion->setQuery($query_puntuacion);
                      $db_puntuacion->execute();
                      $numRows_puntuacion = $db_puntuacion->getNumRows(); 
                      $results_puntuacion = $db_puntuacion->loadObjectList(); 

              $puntos_g = $ganados * $results_puntuacion[0]->puntos_g;
              $puntos_p = $perdidos * $results_puntuacion[0]->puntos_p;
              $puntos_e = $empatados * $results_puntuacion[0]->puntos_e;
              $puntos = $puntos_e + $puntos_g + $puntos_p;

              //a favor y en contra

              $db_fc1 = & JDatabase::getInstance( $option );
                      $query_fc1 = "SELECT SUM(tantos1) as favor, SUM(tantos2) as contra
                      FROM partido, jornada, grupo, partido_equipos
                      WHERE partido.id_partido = partido_equipos.id_partido  AND partido.id_jornada = jornada.id_jornada AND jornada.id_grupo = grupo.id_grupo AND grupo.id_grupo = ".$results_all_g[$i]->id_grupo." AND id_equipo1 = ".$results_tabla_grupo[$j]->id_eq;
                      $db_fc1->setQuery($query_fc1);
                      $db_fc1->execute();
                      $numRows_fc1 = $db_fc1->getNumRows(); 
                      $results_fc1 = $db_fc1->loadObjectList(); 

              $db_fc2 = & JDatabase::getInstance( $option );
                      $query_fc2 = "SELECT SUM(tantos1) as contra, SUM(tantos2) as favor
                      FROM partido, jornada, grupo, partido_equipos
                      WHERE partido.id_partido = partido_equipos.id_partido  AND partido.id_jornada = jornada.id_jornada AND jornada.id_grupo = grupo.id_grupo AND grupo.id_grupo = ".$results_all_g[$i]->id_grupo." AND id_equipo2 = ".$results_tabla_grupo[$j]->id_eq;
                      $db_fc2->setQuery($query_fc2);
                      $db_fc2->execute();
                      $numRows_fc2 = $db_fc2->getNumRows(); 
                      $results_fc2 = $db_fc2->loadObjectList(); 
              
              $favor1 = $results_fc1[0]->favor;
              $favor2 = $results_fc2[0]->favor;
              $favor = $favor1 + $favor2;

              $contra1 = $results_fc1[0]->contra;
              $contra2 = $results_fc2[0]->contra;
              $contra = $contra1 + $contra2;

              //diferencia

              $diferencia = $favor - $contra;

                      //actualizar
             
                      
                      $db_act_clasi_l = & JDatabase::getInstance( $option );

                      $query_act_clasi_l = $db_act_clasi_l->getQuery(true);

                      $fields = array(
                        $db_act_clasi_l->quoteName('pg') . ' = ' . $ganados,
                        $db_act_clasi_l->quoteName('pj') . ' = ' . $jugados,
                        $db_act_clasi_l->quoteName('p') . ' = ' . $puntos,
                        $db_act_clasi_l->quoteName('pp') . ' = ' . $perdidos,
                        $db_act_clasi_l->quoteName('pe') . ' = ' . $empatados,
                        $db_act_clasi_l->quoteName('f') . ' = ' . $favor,
                        $db_act_clasi_l->quoteName('c') . ' = ' . $contra,
                        $db_act_clasi_l->quoteName('d') . ' = ' . $diferencia
                         
                        );
                      $conditions = array(
                        $db_act_clasi_l->quoteName('id_equipo') . ' = ' . $results_tabla_grupo[$j]->id_eq
                        );
                       
                      $query_act_clasi_l
                          ->update($db_act_clasi_l->quoteName('equipo_grupo'))
                          ->set($fields)
                          ->where($conditions);
                      $db_act_clasi_l->setQuery($query_act_clasi_l);
                      $db_act_clasi_l->execute();
                      // echo $puntos." ".$jugados." ".$ganados." ".$empatados." ".$perdidos." ".$favor." ".$contra." ".$diferencia."<br>";
        endfor;
          //  endbloque
        $db_tabla_grupo2 = & JDatabase::getInstance( $option );
        $query_tabla_grupo2 = "SELECT equipo.nombre as nombre_equipo, equipo_grupo.id_equipo as id_eq, pg, pj, p, pp, pe, f, c, d, equipo.id_equipo as id_eq
        FROM equipo_grupo, equipo
        WHERE equipo_grupo.id_equipo = equipo.id_equipo AND equipo_grupo.id_grupo =".$results_all_g[$i]->id_grupo." ORDER BY p DESC, d DESC, f DESC, pe DESC";  
        $db_tabla_grupo2->setQuery($query_tabla_grupo2);
        $db_tabla_grupo2->execute(); 
        $numRows_tabla_grupo2 = $db_tabla_grupo2->getNumRows();        
        $results_tabla_grupo2 = $db_tabla_grupo2->loadObjectList();
 
        for ($q=0; $q < $numRows_tabla_grupo2; $q++): 
          if($q == 0 && $q != $numRows_tabla_grupo2-1):
            echo "<tr style='background-color:#9FFFA2;'>";
          else:
            echo "<tr>";
          endif;
          if($q == $numRows_tabla_grupo2-1 && $q != 0):
            echo "<tr style='background-color:#FF7070;'>";
          endif;
          echo "
          <td>".($q+1)."</td>          
          <td>
          <a href='ficha_equipo.php?id_equipo=".$results_tabla_grupo2[$q]->id_eq."' title='Editar'>
          ".$results_tabla_grupo2[$q]->nombre_equipo."
          </a>
          </td>          
          <td>".$results_tabla_grupo2[$q]->p."</td>          
          <td>".$results_tabla_grupo2[$q]->pj."</td>          
          <td>".$results_tabla_grupo2[$q]->pg."</td>          
          <td>".$results_tabla_grupo2[$q]->pe."</td>          
          <td>".$results_tabla_grupo2[$q]->pp."</td>          
          <td>".$results_tabla_grupo2[$q]->f."</td>          
          <td>".$results_tabla_grupo2[$q]->c."</td>          
          <td>".$results_tabla_grupo2[$q]->d."</td>          

        </tr>"; 
        endfor;       
      echo "
    </tbody>    
    </table>  
   </div>
      ";
      elseif($results_all_g[$i]->tipo_grupo == 0):
        echo "
      <div id='".$results_all_g[$i]->id_grupo."' class='tab-pane fade";
      if($i == 0):        
        echo " in active";
      endif;  
      echo "'>
    <div class='btn-toolbar pull-right' role='toolbar' aria-label='Toolbar with button groups'>
      <div class='btn-group'>
      <a href='#aniadirEquipo".$results_all_g[$i]->id_grupo."' class='btn btn-primary btn-sm' role='button' data-toggle='modal' data-backdrop='static'> AÑADIR EQUIPO</a>      
      </div>
      <div class='btn-group'>
       <div class='dropdown'>
        <button class='btn btn-primary dropdown-toggle btn-sm' type='button' data-toggle='dropdown'>CONFIGURAR ELIMINATORIA
        <span class='caret'></span></button>
        <ul class='dropdown-menu' style='right: 0; left: auto; top: 27px;'>
          <li><a href='#config".$results_all_g[$i]->id_grupo."' role='button' data-toggle='modal' data-backdrop='static'>CAMBIAR NOMBRE</a></li>    
          <li><a href='#eliminarG".$results_all_g[$i]->id_grupo."' role='button' data-toggle='modal' data-backdrop='static'><span class='glyphicon glyphicon-trash'></span> ELIMINAR</a></li>
        </ul>
      </div>
      
      </div>
    </div> ";

    $db_eli_creada = & JDatabase::getInstance( $option );
          $query_eli_creada = "SELECT count(partido.id_partido) as cant_partidos
          FROM partido, jornada, grupo
          WHERE grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada = partido.id_jornada AND grupo.id_grupo = ".$results_all_g[$i]->id_grupo;  
          $db_eli_creada->setQuery($query_eli_creada);
          $db_eli_creada->execute();
          $numRows_eli_creada = $db_eli_creada->getNumRows(); 
          $results_eli_creada = $db_eli_creada->loadObjectList();

          if($results_eli_creada[0]->cant_partidos > 0):
          
    echo "
   <!-- Caja de posiciones-->   
      <div class='box-info full relative'>
        
      <div id='play-off-cross' class='top-bordered'>
        <div class='cruces-eliminatoria'>
          <div>
   ";
   $query_jornadas_e = "SELECT jornada.descripcion as descr_jornada, jornada.id_jornada as id_jor
        FROM jornada
        WHERE jornada.id_grupo =".$results_all_g[$i]->id_grupo;  
        $db_jornadas_e->setQuery($query_jornadas_e);
        $db_jornadas_e->execute();   
        $numRows_jornadas_e = $db_jornadas_e->getNumRows();      
        $results_jornadas_e = $db_jornadas_e->loadObjectList(); 
        $u = 0;
    for ($z=$numRows_jornadas_e-1; $z >= 0; $z--) : 
      try{
              

                $query_tabla_partidos1 = "SELECT DISTINCT partido_equipos.id_equipo1 as id_eq1, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo1 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_jornadas_e[$z]->id_jor." AND jornada.id_grupo =".$results_all_g[$i]->id_grupo;  

                $query_tabla_partidos2 = "SELECT DISTINCT partido_equipos.id_equipo2 as id_eq2, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo2 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_jornadas_e[$z]->id_jor." AND jornada.id_grupo =".$results_all_g[$i]->id_grupo; 
             
              
              $db_tabla_partidos1->setQuery($query_tabla_partidos1);
              $db_tabla_partidos1->execute();   
              $numRows_tabla_partidos1 = $db_tabla_partidos1->getNumRows();      
              $results_tabla_partidos1 = $db_tabla_partidos1->loadObjectList();

              $db_tabla_partidos2->setQuery($query_tabla_partidos2);
              $db_tabla_partidos2->execute();   
              $numRows_tabla_partidos2 = $db_tabla_partidos2->getNumRows();      
              $results_tabla_partidos2 = $db_tabla_partidos2->loadObjectList();


              $size_ronda = pow(2, $u);

              echo "
                <div class='ronda'>
                <div class='h5'>".$results_jornadas_e[$z]->descr_jornada."</div>";

              for ($j=0; $j < $numRows_tabla_partidos1; $j++): 
                
                echo "
                <div style='height: ".$size_ronda."00px;'>
                <div class='linea-vertical'>
                <div class='linea-horizontal'></div>
                <div class='caja-participantes'>                      
                <div class='"; 
                if($results_tabla_partidos1[$j]->tantos_1 > $results_tabla_partidos1[$j]->tantos_2):
                  echo "equipo-cruce ganador";
                else:
                  echo "equipo-cruce";
                endif;
                

                echo "'>";

                if(file_exists("img/escudos/".$results_tabla_partidos1[$j]->id_eq1.".png")):
                echo "<img src='img/escudos/".$results_tabla_partidos1[$j]->id_eq1.".png' alt='' width='30px' height='30px'>";
              else:
                echo "<img src='img/escudos/base.png' alt='' width='30px' height='30px'>";
              endif;  
              if($results_tabla_partidos1[$j]->id_eq1 != 26):
                echo "
                  <a href='ficha_equipo.php?id_equipo=".$results_tabla_partidos1[$j]->id_eq1."' title='Editar'>
          ".$results_tabla_partidos1[$j]->nombre_equipo."
          </a>
                    <span>
                          ".$results_tabla_partidos2[$j]->tantos_1."                         
                        </span>
                </div>

                <div class='";
                else:
                  echo "
                <a href='#' title='Editar'>
          ".$results_tabla_partidos1[$j]->nombre_equipo."
            </a>
                    <span>
                          ".$results_tabla_partidos2[$j]->tantos_1."                         
                        </span>
                </div>

                <div class='";
              endif;
                
                if($results_tabla_partidos1[$j]->tantos_2 > $results_tabla_partidos1[$j]->tantos_1):
                  echo "equipo-cruce ganador";
                else:
                  echo "equipo-cruce";
                endif;

                echo "'>";

                if(file_exists("img/escudos/".$results_tabla_partidos2[$j]->id_eq2.".png")):
                  echo "<img src='img/escudos/".$results_tabla_partidos2[$j]->id_eq2.".png' alt='' width='30px' height='30px'>";
                else:
                  echo "<img src='img/escudos/base.png' alt='' width='30px' height='30px'>";
                endif;  
                if($results_tabla_partidos2[$j]->id_eq2 != 26):
                  echo "
                <a href='ficha_equipo.php?id_equipo=".$results_tabla_partidos2[$j]->id_eq2."' title='Editar'>
          ".$results_tabla_partidos2[$j]->nombre_equipo."
          </a>
                  <span>
                    ".$results_tabla_partidos2[$j]->tantos_2."                         
                    </span>
                </div>  
                </div>
                </div>
                </div>
              ";
                else:
                  echo "
                <a href='#' title='Editar'>
          ".$results_tabla_partidos2[$j]->nombre_equipo."
          </a>
                  <span>
                    ".$results_tabla_partidos2[$j]->tantos_2."                         
                    </span>
                </div>  
                </div>
                </div>
                </div>
              ";
                endif;
                



                // echo "<td>".$results_tabla_partidos1[$j]->nombre_equipo."</td>          
                // <td><a href='partidos.php?id_partido=".$results_tabla_partidos1[$j]->this_id_p."&id_equipo1=".$results_tabla_partidos1[$j]->id_eq1."&id_equipo2=".$results_tabla_partidos2[$j]->id_eq2."&n_equipo1=".$results_tabla_partidos1[$j]->nombre_equipo."&n_equipo2=".$results_tabla_partidos2[$j]->nombre_equipo."' title='Editar'>
              //".$results_tabla_partidos2[$j]->tantos_1." - ".$results_tabla_partidos2[$j]->tantos_2."</a></td>          
                // <td>".$results_tabla_partidos2[$j]->nombre_equipo."</td>   

              endfor;   
        }catch(Exception $e){
          echo $e;
        }

              echo "
             </div>
              
            
                ";

        $u++;
      endfor;
echo "
</div>
<div><!-- Linea de los titulos -->&nbsp;</div>
    </div>
  </div>
        
  </div>

   </div>

<!--END Caja de posiciones-->   
      ";
            else:
                $db_eli_eq = & JDatabase::getInstance( $option );
                $query_eli_eq = "SELECT equipo.nombre as nombre_equipo, equipo_grupo.orden as orden_eq, equipo.id_equipo as this_id_equipo
                FROM equipo, equipo_grupo
                WHERE equipo.id_equipo = equipo_grupo.id_equipo AND equipo_grupo.id_grupo = ".$results_all_g[$i]->id_grupo." ORDER BY equipo_grupo.orden";  
                $db_eli_eq->setQuery($query_eli_eq);
                $db_eli_eq->execute();
                $numRows_eli_eq = $db_eli_eq->getNumRows(); 
                $results_eli_eq = $db_eli_eq->loadObjectList();

                echo "
                <div class='col-sm-5' style='margin-top:30px;'>
                <table class='table table-hover table-bordered col-sm-6'>
                  <thead>
                    <tr>
                      <th>ESCUDO</th>
                      <th>NOMBRE</th>
                      <th>ORDEN</th>
                    </tr>
                    </thead>
                    <tbody data-link='row' class='rowlink'> ";
                  for ($l=0; $l < $numRows_eli_eq; $l++):
                                      echo " <tr>";
                        if(file_exists("img/escudos/".$results_eli_eq[$l]->this_id_equipo.".png")):
                        echo"
                          <td>
                            <img src='img/escudos/".$results_eli_eq[$l]->this_id_equipo.".png' height='24px' width='24px'>   
                          </td>";
                        elseif(file_exists("img/escudos/".$results_eli_eq[$l]->this_id_equipo.".jpg")):
                        echo"
                          <td>
                            <img src='img/escudos/".$results_eli_eq[$l]->this_id_equipo.".jpg' height='24px' width='24px'>   
                          </td>";
                        else:
                          echo"
                          <td>
                            <img src='img/escudos/base.png' height='24px' width='24px'>   
                          </td>";
                        endif;
                        echo "
                          <td>
                            <a href='ficha_equipo.php?id_equipo=".$results_eli_eq[$l]->this_id_equipo."' title='Editar'>
                            ".$results_eli_eq[$l]->nombre_equipo."
                            </a>
                          </td>     
                          <td>                           
                            ".$results_eli_eq[$l]->orden_eq."                          
                          </td>     
                            
                        </tr>
                        ";        
                                      
                  endfor;
                      
                echo "
                    </tbody>
                  </thead>
                </table>
                </div>
                ";


            endif;
      endif;
      endfor;
    endif;
    ?>
   
    <!-- <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div> -->

  </div>
  <?php
          if(isset($_SESSION['equipo_vacio'])):
            if($_SESSION['equipo_vacio'] == 1):
              echo "
              <script type='text/javascript'>$.toaster({ priority : 'danger', title : 'CAMPO', message : 'Vacío'});</script>
            ";
            unset($_SESSION['equipo_vacio']);
            endif;
          endif;

          if(isset($_SESSION['no_agrega'])):
            if($_SESSION['no_agrega'] == 1):
              echo "
              <script type='text/javascript'>$.toaster({ priority : 'danger', title : 'CALENDARIO', message : 'Calendario Existe, imposible añadir más equipos'});</script>
            ";
            unset($_SESSION['no_agrega']);
            endif;
          endif;
          if(isset($_SESSION['orden_existe'])):
            if($_SESSION['orden_existe'] == 1):
              echo "
              <script type='text/javascript'>$.toaster({ priority : 'danger', title : 'ORDEN', message : 'Orden Repetido, imposible añadir equipo'});</script>
            ";
            unset($_SESSION['orden_existe']);
            endif;
          endif;
          if(isset($_SESSION['orden_vacio'])):
            if($_SESSION['orden_vacio'] == 1):
              echo "
              <script type='text/javascript'>$.toaster({ priority : 'danger', title : 'ORDEN', message : 'Orden Vacío, imposible añadir equipo'});</script>
            ";
            unset($_SESSION['orden_vacio']);
            endif;
          endif;
  ?>
<div id="result"></div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jasny-bootstrap.min.js"></script>
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
            <div>
            <div class='container'>
        <form action='validaciones/v_clasificacion.php' role='form' name='anadirEquipo' id='anadirEquipo' method='post' target='_parent'>
            <input type='hidden' name ='idGrupo' value='".$results_all_g[$i]->id_grupo."'>
            <input type='hidden' name ='tipo_grupo' value='".$results_all_g[$i]->tipo_grupo."'>
        <div class='form-group col-sm-4 ";
        if($results_all_g[$i]->tipo_grupo == 1):
        echo "col-sm-offset-1";
        endif;
        echo"'>
        <label for='aEquipo' class='control-label'>EQUIPO:</label>          
        <select class='form-control' name='aEquipo' id='aEquipo'>
        <option value='0'>-</option>
          ";          
        $query_equi_no_g = "SELECT DISTINCT equipo.nombre as nombre_equipo, jugador_equipo_t.id_equipo as id_equip
        FROM jugador_equipo_t, equipo
        WHERE jugador_equipo_t.id_equipo = equipo.id_equipo AND jugador_equipo_t.id_torneo = ".$_SESSION['id_torneo']." AND jugador_equipo_t.id_equipo 
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
        </div>";
        if($results_all_g[$i]->tipo_grupo == 0):
        echo "<div class='form-group col-sm-2' id='div_orden'>
          <label for='aEquipo' class='control-label'>ORDEN:</label> 
          <input type='number' min='1' max='33' id='orden' name='orden' class='form-control'>
        </div>";
        endif;
        echo "<div class='col-sm-12 col-sm-offset-1'>
        <input type='submit' class='btn btn-success' name='btnAniadirEquipo' id='btnAniadirEquipo' value='ACEPTAR'></input>
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
        <input type='text' name='nombreGrupo' class='form-control' id='nombreGrupo' value='".$results_all_g[$i]->descripcion."'>
        </div>        
        <div class='col-sm-12 col-sm-offset-1'>
        <input type='hidden' name ='idGrupo' value='".$results_all_g[$i]->id_grupo."'>
        <input type='submit' class='btn btn-success' name='btnConfigG' id='btnConfigG' value='ACEPTAR'></input>
        <input type='button' class='btn btn-default' data-dismiss='modal' value='CANCELAR'></input>
        </div>
      </form>
      </div>
      </div>
      </div>
        </div>
    </div>
</div> 

<div id='eliminarG".$results_all_g[$i]->id_grupo."' class='modal fade'>
    <div class='modal-dialog'>
        <div class='modal-content'>            
            <div class='modal-header'>
                <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>
                <h4 class='modal-title'>SEGURO</h4>
            </div>
            <div class='modal-body'>
            <div id='cr_equipo'>
            <div class='container'>
      <form action='validaciones/v_clasificacion.php' role='form' name='eliminarGrupo' id='eliminarGrupo' method='post' target='_parent'>        
        <div class='col-sm-12 col-sm-offset-1'>
        <input type='hidden' name ='idGrupo' value='".$results_all_g[$i]->id_grupo."'>
        <input type='submit' class='btn btn-danger' name='btnEliminarG' id='btnEliminarG' value='ACEPTAR'></input>
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