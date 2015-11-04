<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../equipos');
 	include "../conexion.php";

 	// echo $_POST['nombreEquipo'];
 	if(isset($_POST['btnCrearEquipo'])):
 	if($_POST['btnCrearEquipo']):
 	if($_POST['nombreEquipo'] != ""):
	try{
		$db_insE = & JDatabase::getInstance( $option );
	$user = JFactory::getUser();
	$query_insE = $db_insE->getQuery(true);
	
	if($_POST['pac-input'] != ""):

		// Insert columns.
	$columns = array('nombre','id_usuario', 'color1', 'color2', 'ubicacion');
	 
	// Insert values.
	$values = array($db_insE->quote($_POST['nombreEquipo']), $user->id, $db_insE->quote($_POST['color1Equipo']."|".$_POST['color11Equipo']), $db_insE->quote($_POST['color2Equipo']."|".$_POST['color22Equipo']), $db_insE->quote($_POST['pac-input']));

	else:

		// Insert columns.
	$columns = array('nombre','id_usuario', 'color1', 'color2');
	 
	// Insert values.
	$values = array($db_insE->quote($_POST['nombreEquipo']), $user->id, $db_insE->quote($_POST['color1Equipo']."|".$_POST['color11Equipo']), $db_insE->quote($_POST['color2Equipo']."|".$_POST['color22Equipo']));

	endif; 
	
	 
	// Prepare the insert query.
	$query_insE
	    ->insert($db_insE->quoteName('equipo'))
	    ->columns($db_insE->quoteName($columns))
	    ->values(implode(',', $values));
	 
	// Set the query using our newly populated query object and execute it.
	$db_insE->setQuery($query_insE);
	$db_insE->execute();
	$id_equipo = $db_insE->insertid();
	$id_torneo = $_SESSION['id_torneo'];

	

	$query_insE = $db_insE->getQuery(true);

	$columns = array('id_equipo', 'id_torneo');
	 
	// Insert values.
	$values = array($id_equipo, $id_torneo);
	 
	// Prepare the insert query.
	$query_insE
	    ->insert($db_insE->quoteName('jugador_equipo_t'))
	    ->columns($db_insE->quoteName($columns))
	    ->values(implode(',', $values));
	 
	// Set the query using our newly populated query object and execute it.
	$db_insE->setQuery($query_insE);
	$db_insE->execute();					
	// $_SESSION['correcto'] = 1;	
	}catch(Exception $e){
		echo "Error";		
	};
	else:
		$_SESSION['correcto'] = 0;
		echo "Error";		
	endif;

	if(isset($_FILES['escudo']) && $_POST['nombreEquipo'] != ""):
		echo "Hola";
		\error_reporting(E_ALL ^ E_NOTICE);
				$ruta="../img/escudos";
				$nombre=$id_equipo; //obtiene nombre
				$archivo=$_FILES['escudo']['tmp_name'];
				$nombre_archivo=$_FILES['escudo']['name'];
				$ext= pathinfo($nombre_archivo);
				$subir= move_uploaded_file($archivo,$ruta."/".$nombre.".".$ext['extension']); //mover imagen y cambia nombre temporal por el real
				if ($subir) {
			    	echo 'el archivo se subio con exito <br>';
				}else {
			   		 echo 'Error al subir el archivo <br>';
				}
			$ruta_imagen = "../img/escudos/".$nombre.".".$ext['extension'];

			$miniatura_ancho_maximo = 200;
			$miniatura_alto_maximo = 200;

			$info_imagen = getimagesize($ruta_imagen);
			$imagen_ancho = $info_imagen[0];
			$imagen_alto = $info_imagen[1];
			$imagen_tipo = $info_imagen['mime'];


			$proporcion_imagen = $imagen_ancho / $imagen_alto;
			$proporcion_miniatura = $miniatura_ancho_maximo / $miniatura_alto_maximo;

			if ( $proporcion_imagen > $proporcion_miniatura ){
				$miniatura_ancho = $miniatura_alto_maximo * $proporcion_imagen;
				$miniatura_alto = $miniatura_alto_maximo;
			} else if ( $proporcion_imagen < $proporcion_miniatura ){
				$miniatura_ancho = $miniatura_ancho_maximo;
				$miniatura_alto = $miniatura_ancho_maximo / $proporcion_imagen;
			} else {
				$miniatura_ancho = $miniatura_ancho_maximo;
				$miniatura_alto = $miniatura_alto_maximo;
			}

			$x = ( $miniatura_ancho - $miniatura_ancho_maximo ) / 2;
			$y = ( $miniatura_alto - $miniatura_alto_maximo ) / 2;
			//CREA IMAGEN SEGUN LA EXTENSION
			if ( $ext["extension"]=="jpg" or "jpeg"){
			    $imagen = imagecreatefromjpeg( $ruta_imagen );
			}if ( $ext["extension"]=="png"){
				$imagen = imagecreatefrompng( $ruta_imagen );
			} if( $ext["extension"]=="gif") {
				$imagen = imagecreatefromgif( $ruta_imagen );
			}

			$lienzo = imagecreatetruecolor( $miniatura_ancho_maximo, $miniatura_alto_maximo );
			$lienzo_temporal = imagecreatetruecolor( $miniatura_ancho, $miniatura_alto );

			imagecopyresampled($lienzo_temporal, $imagen, 0, 0, 0, 0, $miniatura_ancho, $miniatura_alto, $imagen_ancho, $imagen_alto);
			imagecopy($lienzo, $lienzo_temporal, 0,0, $x, $y, $miniatura_ancho_maximo, $miniatura_alto_maximo);

			imagejpeg($lienzo, "../img/escudos/".$nombre.".".$ext['extension'], 80);
			// Liberar memoria
			imagedestroy($lienzo);
	endif;

	endif;
	endif;

?>