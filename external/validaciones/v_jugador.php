<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../equipos?id_equipo='.$_POST['id_equi']);
 	include "../conexion.php";

 	// echo $_POST['nombreEquipo'];
 	if(isset($_POST['btnAgregarJugador'])):
 	if($_POST['btnAgregarJugador']):
 	if($_POST['nombres'] != "" && $_POST['apellidos'] != "" && $_POST['documento'] != "" && $_POST['direccion'] != "" && $_POST['telefono'] != "" && $_POST['email'] != "" && $_POST['fecha'] != ""):
	try{
		$db_insJu = & JDatabase::getInstance( $option );
	$user = JFactory::getUser();
	$query_insJu = $db_insJu->getQuery(true);
	
	

		// insJurt columns.
	$columns = array('nombres','apellidos', 'documento', 'direccion', 'telefono', 'email', 'f_nacimiento');
	 
	// insJurt values.
	$values = array($db_insJu->quote($_POST['nombres']), $db_insJu->quote($_POST['apellidos']), $db_insJu->quote($_POST['documento']), $db_insJu->quote($_POST['direccion']), $db_insJu->quote($_POST['telefono']), $db_insJu->quote($_POST['email']), $db_insJu->quote($_POST['fecha']));

	 
	// Prepare the insJurt query.
	$query_insJu
	    ->insert($db_insJu->quoteName('jugador'))
	    ->columns($db_insJu->quoteName($columns))
	    ->values(implode(',', $values));
	 
	// Set the query using our newly populated query object and execute it.
	$db_insJu->setQuery($query_insJu);
	$db_insJu->execute();
	$id_jugador = $db_insJu->insertid();
	$id_torneo = $_SESSION['id_torneo'];

	

	$query_insJu = $db_insJu->getQuery(true);

	$columns = array('id_jugador', 'id_equipo', 'id_torneo');
	 
	// insJurt values.
	$values = array( $id_jugador, $_POST['id_equi'], $id_torneo);
	 
	// Prepare the insJurt query.
	$query_insJu
	    ->insert($db_insJu->quoteName('jugador_equipo_t'))
	    ->columns($db_insJu->quoteName($columns))
	    ->values(implode(',', $values));
	 
	// Set the query using our newly populated query object and execute it.
	$db_insJu->setQuery($query_insJu);
	$db_insJu->execute();					
	$_SESSION['jugador_creado'] = 1;	
	}catch(Exception $e){
		echo $e;		
	};
	else:
		$_SESSION['correcto'] = 0;
		echo "Error";		
	endif;

	if(isset($_FILES['foto']) && $_POST['nombres'] != "" && $_POST['apellidos'] != "" && $_POST['documento'] != "" && $_POST['direccion'] != "" && $_POST['telefono'] != "" && $_POST['email'] != "" && $_POST['fecha'] != ""):
		echo "Hola";
		\error_reporting(E_ALL ^ E_NOTICE);
				$ruta="../img/fotos";
				$nombre=$id_equipo; //obtiene nombre
				$archivo=$_FILES['foto']['tmp_name'];
				$nombre_archivo=$_FILES['foto']['name'];
				$ext= pathinfo($nombre_archivo);
				$subir= move_uploaded_file($archivo,$ruta."/".$nombre.".".$ext['extension']); //mover imagen y cambia nombre temporal por el real
				if ($subir) {
			    	echo 'el archivo se subio con exito <br>';
				}else {
			   		 echo 'Error al subir el archivo <br>';
				}
			$ruta_imagen = "../img/fotos/".$nombre.".".$ext['extension'];

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

			imagejpeg($lienzo, "../img/fotos/".$nombre.".".$ext['extension'], 80);
			// Liberar memoria
			imagedestroy($lienzo);
	endif;



	endif;
	endif;

?>