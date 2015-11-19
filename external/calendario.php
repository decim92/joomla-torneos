 
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Document</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jasny-bootstrap.min">
<link rel="stylesheet" type="text/css" href="css/my_navbars.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
</head>
<script type="text/javascript" src="../media/jui/js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-toaster.js"></script>
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

    $db_tabla_grupo = & JDatabase::getInstance( $option );
    $db_combo_jornadas = & JDatabase::getInstance( $option );
    $db_tabla_partidos1 = & JDatabase::getInstance( $option );
    $db_tabla_partidos2 = & JDatabase::getInstance( $option );
    $db_tabla_filas_validas1 = & JDatabase::getInstance( $option );
    $db_tabla_filas_validas2 = & JDatabase::getInstance( $option );

    $resultados_partidos1 = array();
    $resultados_partidos2 = array();
  else:
    echo "<p>WTF</p>";
  endif;
  
?>


<?php 
?>
  <ul class="nav nav-tabs">
    <?php
    if(isset($_SESSION['id_torneo'])):
      for($i = 0; $i < $numRows_all_g; $i++):
        echo "<li ";
      if(isset($_SESSION['id_tab'])):
        if($i == $_SESSION['id_tab']):        
          echo "class= 'active'";
        endif;
      else:
        if($i == 0):        
          echo "class= 'active'";
        endif;
      endif;
      echo"><a data-toggle='tab' href='#".$results_all_g[$i]->id_grupo."'>".$results_all_g[$i]->descripcion."</a></li>";
      endfor;
    ?>
  </ul>

  <div class="tab-content">
    <?php 
      for ($i=0; $i < $numRows_all_g; $i++): 

        $query_combo_jornadas = "SELECT jornada.descripcion as descr_jornada, jornada.id_jornada as id_jor
        FROM jornada
        WHERE jornada.id_grupo =".$results_all_g[$i]->id_grupo;  
        $db_combo_jornadas->setQuery($query_combo_jornadas);
        $db_combo_jornadas->execute();   
        $numRows_combo_jornadas = $db_combo_jornadas->getNumRows();      
        $results_combo_jornadas = $db_combo_jornadas->loadObjectList(); 
        
        if($results_all_g[$i]->tipo_grupo == 1):        
        echo "
      <div id='".$results_all_g[$i]->id_grupo."' class='tab-pane fade";
      if(isset($_SESSION['id_tab'])):
        if($i == $_SESSION['id_tab']):        
          echo " in active";
        endif;
      else:
        if($i == 0):        
          echo " in active";
        endif;
      endif;
      echo "'>
    <div class='btn-toolbar pull-right' style='margin-top:7px;' role='toolbar' aria-label='Toolbar with button groups'>
      <div class='btn-group'>
      <form action='validaciones/v_calendario.php' role='form' method='post' target='_parent'>
      <input type='hidden' name='id_tab' value='".$i."'>
      <select class='form-control select-size-small' name='lista_jornadas' onchange='this.form.submit()'>
      <option value='0'>Mostrar Partidos</option>
      ";

        for ($m=0; $m < $numRows_combo_jornadas; $m++):
          echo "<option value='".$results_combo_jornadas[$m]->id_jor."' ";
        if(isset($_SESSION['id_jornada'])):
        if($results_combo_jornadas[$m]->id_jor == $_SESSION['id_jornada']):
          echo "selected";
        endif;
        endif;
        echo">".$results_combo_jornadas[$m]->descr_jornada."</option>";
        endfor;
      echo "</select>
      </form>
      </div>
      <div class='btn-group'>
      <a href='#config".$results_all_g[$i]->id_grupo."' role='button' data-toggle='modal' data-backdrop='static' class='btn btn-primary btn-sm'><span class='glyphicon glyphicon-cog'></span> CONFIGURAR JORNADA</a>       
      </div>
    </div> 
    <div class='col-sm-2 pull-right'>    
      <form action='validaciones/v_calendario.php' name='formLigaEli' id='formLigaEli' class='navbar-form' role='form' method='post' target='_parent'>
    <div class='btn-group'>
      <span class='icon-input-btn'><span class='glyphicon glyphicon-calendar'></span>
      <input type='hidden' name='tipo_grupo' value='".$results_all_g[$i]->tipo_grupo."'>
      <input type='hidden' name='id_grupo' value='".$results_all_g[$i]->id_grupo."'>
      <input type='submit' class='btn btn-default btn-sm' value='CREAR CALENDARIO' id='btnAutoCalen' name='btnAutoCalen'>
      </span>
    </div>
    </form>
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
      if($numRows_combo_jornadas > 0):

            try{        
             
            
              if(isset($_SESSION['id_jornada'])):
               $query_tabla_partidos1 = "SELECT DISTINCT partido_equipos.id_equipo1 as id_eq1, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
              FROM partido_equipos, equipo, partido, jornada, grupo 
              WHERE partido_equipos.id_equipo1 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND  partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$_SESSION['id_jornada']." AND jornada.id_grupo =".$results_all_g[$i]->id_grupo;  

              $query_tabla_partidos2 = "SELECT DISTINCT partido_equipos.id_equipo2 as id_eq2, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
              FROM partido_equipos, equipo, partido, jornada, grupo
              WHERE partido_equipos.id_equipo2 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$_SESSION['id_jornada']." AND jornada.id_grupo =".$results_all_g[$i]->id_grupo;  

              else:

                $query_tabla_partidos1 = "SELECT DISTINCT partido_equipos.id_equipo1 as id_eq1, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo1 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_combo_jornadas[0]->id_jor." AND jornada.id_grupo =".$results_all_g[$i]->id_grupo;  

                $query_tabla_partidos2 = "SELECT DISTINCT partido_equipos.id_equipo2 as id_eq2, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo2 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_combo_jornadas[0]->id_jor." AND jornada.id_grupo =".$results_all_g[$i]->id_grupo;  
              endif;
              // unset($_SESSION['id_jornada']);

             
              
              $db_tabla_partidos1->setQuery($query_tabla_partidos1);
              $db_tabla_partidos1->execute();   
              $numRows_tabla_partidos1 = $db_tabla_partidos1->getNumRows();      
              $results_tabla_partidos1 = $db_tabla_partidos1->loadObjectList();

              $db_tabla_partidos2->setQuery($query_tabla_partidos2);
              $db_tabla_partidos2->execute();   
              $numRows_tabla_partidos2 = $db_tabla_partidos2->getNumRows();      
              $results_tabla_partidos2 = $db_tabla_partidos2->loadObjectList();

              for ($j=0; $j < $numRows_tabla_partidos1; $j++): 
                
                echo "<tr>
                <td>".$results_tabla_partidos1[$j]->nombre_equipo."</td>          
                <td><a href='partidos.php?id_partido=".$results_tabla_partidos1[$j]->this_id_p."&id_equipo1=".$results_tabla_partidos1[$j]->id_eq1."&id_equipo2=".$results_tabla_partidos2[$j]->id_eq2."&n_equipo1=".$results_tabla_partidos1[$j]->nombre_equipo."&n_equipo2=".$results_tabla_partidos2[$j]->nombre_equipo."' title='Editar'>".$results_tabla_partidos2[$j]->tantos_1." - ".$results_tabla_partidos2[$j]->tantos_2."</a></td>          
                <td>".$results_tabla_partidos2[$j]->nombre_equipo."</td>   
                <td>".$results_tabla_partidos2[$j]->fecha_p."</td>          
                <td>".$results_tabla_partidos2[$j]->hora_p."</td>          
                <td>".$results_tabla_partidos2[$j]->lugar_p."</td>";
                if($results_tabla_partidos2[$j]->jugado_p == 0):
                  echo "<td><div class='dot-warning' title='Pendiente'></div></td>";
                else:
                  echo "<td><div class='dot-success' title='Terminado'></div></td>";
                endif;
              echo "</tr>";     
              endfor;   
        }catch(Exception $e){
          echo $e;
        }
      
      endif;
          

        
      echo "
    </tbody>    
    </table>  
   </div>
      ";
      elseif($results_all_g[$i]->tipo_grupo == 0):
       echo "
      <div id='".$results_all_g[$i]->id_grupo."' class='tab-pane fade";
      if(isset($_SESSION['id_tab'])):
        if($i == $_SESSION['id_tab']):        
          echo " in active";
        endif;
      else:
        if($i == 0):        
          echo " in active";
        endif;
      endif;
      echo "'>
    <div class='btn-toolbar pull-right' style='margin-top:7px;' role='toolbar' aria-label='Toolbar with button groups'>
      <div class='btn-group'>
      <form action='validaciones/v_calendario.php' role='form' method='post' target='_parent'>
      <input type='hidden' name='id_tab' value='".$i."'>
      <select class='form-control select-size-small' name='lista_jornadas' onchange='this.form.submit()'>
      <option value='0'>Mostrar Partidos</option>
      ";
        for ($n = $numRows_combo_jornadas-1; $n >= 0; $n--):
          echo $_SESSION['id_jornada'];
          echo "<option value='".$results_combo_jornadas[$n]->id_jor."' ";
        if(isset($_SESSION['id_jornada'])):
          echo $_SESSION['id_jornada'];
        if($results_combo_jornadas[$n]->id_jor == $_SESSION['id_jornada']):
          echo "selected";
        endif;
        endif;
        echo">".$results_combo_jornadas[$n]->descr_jornada."</option>";
        endfor;
      echo "</select>
      </form>
      </div>
      <div class='btn-group'>
      <a href='#config".$results_all_g[$i]->id_grupo."' role='button' data-toggle='modal' data-backdrop='static' class='btn btn-primary btn-sm'><span class='glyphicon glyphicon-cog'></span> CONFIGURAR JORNADA</a>       
      </div>
    </div> 
    <div class='col-sm-2 pull-right'>    
      <form action='validaciones/v_calendario.php' name='formLigaEli' id='formLigaEli' class='navbar-form' role='form' method='post' target='_parent'>
    <div class='btn-group'>
      <span class='icon-input-btn'><span class='glyphicon glyphicon-calendar'></span>
      <input type='hidden' name='tipo_grupo' value='".$results_all_g[$i]->tipo_grupo."'>
      <input type='hidden' name='id_grupo' value='".$results_all_g[$i]->id_grupo."'>
      <input type='submit' class='btn btn-default btn-sm' value='CREAR CALENDARIO' id='btnAutoCalen' name='btnAutoCalen'>
      </span>
    </div>
    </form>
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
        try{
          if($numRows_combo_jornadas != 0):
              if(isset($_SESSION['id_jornada'])):
               $query_tabla_partidos1 = "SELECT DISTINCT partido_equipos.id_equipo1 as id_eq1, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
              FROM partido_equipos, equipo, partido, jornada, grupo 
              WHERE partido_equipos.id_equipo1 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND  partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$_SESSION['id_jornada']." AND jornada.id_grupo =".$results_all_g[$i]->id_grupo;  

              $query_tabla_partidos2 = "SELECT DISTINCT partido_equipos.id_equipo2 as id_eq2, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
              FROM partido_equipos, equipo, partido, jornada, grupo
              WHERE partido_equipos.id_equipo2 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$_SESSION['id_jornada']." AND jornada.id_grupo =".$results_all_g[$i]->id_grupo;  

              else:
               
                $query_tabla_partidos1 = "SELECT DISTINCT partido_equipos.id_equipo1 as id_eq1, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo1 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_combo_jornadas[0]->id_jor." AND jornada.id_grupo =".$results_all_g[$i]->id_grupo;  

                $query_tabla_partidos2 = "SELECT DISTINCT partido_equipos.id_equipo2 as id_eq2, equipo.nombre as nombre_equipo, partido_equipos.id_partido as this_id_p, partido.fecha as fecha_p, partido.hora as hora_p, partido.lugar as lugar_p, partido.jugado as jugado_p, partido_equipos.tantos1 as tantos_1, partido_equipos.tantos2 as tantos_2
                FROM partido_equipos, equipo, partido, jornada, grupo
                WHERE partido_equipos.id_equipo2 = equipo.id_equipo AND partido.id_partido = partido_equipos.id_partido AND partido.id_jornada = jornada.id_jornada AND grupo.id_grupo = jornada.id_grupo AND jornada.id_jornada =".$results_combo_jornadas[0]->id_jor." AND jornada.id_grupo =".$results_all_g[$i]->id_grupo;  
              endif;
              // unset($_SESSION['id_jornada']);

             
              
              $db_tabla_partidos1->setQuery($query_tabla_partidos1);
              $db_tabla_partidos1->execute();   
              $numRows_tabla_partidos1 = $db_tabla_partidos1->getNumRows();      
              $results_tabla_partidos1 = $db_tabla_partidos1->loadObjectList();

              $db_tabla_partidos2->setQuery($query_tabla_partidos2);
              $db_tabla_partidos2->execute();   
              $numRows_tabla_partidos2 = $db_tabla_partidos2->getNumRows();      
              $results_tabla_partidos2 = $db_tabla_partidos2->loadObjectList();

              for ($j=0; $j < $numRows_tabla_partidos1; $j++): 
                
                echo "<tr>
                <td>".$results_tabla_partidos1[$j]->nombre_equipo."</td>          
                <td><a href='partidos.php?id_partido=".$results_tabla_partidos1[$j]->this_id_p."&id_equipo1=".$results_tabla_partidos1[$j]->id_eq1."&id_equipo2=".$results_tabla_partidos2[$j]->id_eq2."&n_equipo1=".$results_tabla_partidos1[$j]->nombre_equipo."&n_equipo2=".$results_tabla_partidos2[$j]->nombre_equipo."' title='Editar'>".$results_tabla_partidos2[$j]->tantos_1." - ".$results_tabla_partidos2[$j]->tantos_2."</a></td>          
                <td>".$results_tabla_partidos2[$j]->nombre_equipo."</td>          
                <td>".$results_tabla_partidos2[$j]->fecha_p."</td>          
                <td>".$results_tabla_partidos2[$j]->hora_p."</td>          
                <td>".$results_tabla_partidos2[$j]->lugar_p."</td>";
                if($results_tabla_partidos2[$j]->jugado_p == 0):
                  echo "<td><div class='dot-warning' title='Pendiente'></div></td>";
                else:
                  echo "<td><div class='dot-success' title='Terminado'></div></td>";
                endif;
              echo "</tr>";                 
              endfor;   

          else:
          endif;
        }catch(Exception $e){
          echo $e;
        }
          
        
      echo "
    </tbody>    
    </table>  
   </div>
      ";
      endif;
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
            <div id='cr_equipo'>
            <div class='container'>
        <form action='validaciones/v_clasificacion.php' role='form' name='anadirEquipo' id='equipo' method='post' target='_parent'>
            <input type='hidden' name ='idGrupo' value='".$results_all_g[$i]->id_grupo."'>
        <div class='form-group col-sm-5'>
        <label for='nombreEquipo' class='control-label'>EQUIPO:</label>          
        <select class='form-control' name='aEquipo' id='aEquipo' form='anadirEquipo'>
        <option value='0'>-</option>
          ";          
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
  if(isset($_SESSION['grupo_creado'])):
    if($_SESSION['grupo_creado'] == 1):
      echo "
      <script type='text/javascript'>$.toaster({ priority : 'danger', title : 'CALENDARIO', message : 'Existe'});</script>
    ";
    unset($_SESSION['grupo_creado']);
    endif;
  endif;

  if(isset($_SESSION['grupo_exitoso'])):
    if($_SESSION['grupo_exitoso'] == 1):
      echo "
      <script type='text/javascript'>$.toaster({ priority : 'success', title : 'CALENDARIO', message : 'Creado Exitosamente'});</script>
    ";
    unset($_SESSION['grupo_exitoso']);
    endif;
  endif;

  if(isset($_SESSION['partido_a'])):
    if($_SESSION['partido_a'] == 1):
      echo "
      <script type='text/javascript'>$.toaster({ priority : 'success', title : 'PARTIDO', message : 'Listo'});</script>
    ";
    unset($_SESSION['partido_a']);
    endif;
  endif;

  if(isset($_SESSION['no_empate'])):
    if($_SESSION['no_empate'] == 1):
      echo "
      <script type='text/javascript'>$.toaster({ priority : 'danger', title : 'PARTIDO', message : 'No puede empatarse'});</script>
    ";
    unset($_SESSION['no_empate']);
    endif;
  endif;
    ?>

  </html>