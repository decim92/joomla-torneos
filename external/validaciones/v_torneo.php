<?php
	session_start();
	// unset($_SESSION['correcto']);
 	header('Location: ../../definir-tor');
 	include "../conexion.php";

	if(isset($_POST['btnCrearTorneo'])):
		if($_POST['btnCrearTorneo']):
			$_SESSION['categ']= $_POST['listaCate'];
			$_SESSION['descrip']= $_POST['descripcion'];
			$_SESSION['ubica']= $_POST['pac-input'];
			$array_deporte= $_POST['listaDeporte'];
			$deporte_explode = explode('|', $array_deporte);
			$_SESSION['deport']= $deporte_explode[1];
			$_SESSION['individual']= $deporte_explode[0];
		endif;
	endif;
	

 	// if(isset($_REQUEST["btnCrearTorneo"])):
	// if($validacion == 1):
	if(isset($_POST['btnCrearTorneo'])):
		if($_POST['btnCrearTorneo']):
	if($_POST['descripcion'] != "" && $_POST['pac-input'] != ""):
	try{
		$db_ins = & JDatabase::getInstance( $option );
	$user = JFactory::getUser();
	$query_ins = $db_ins->getQuery(true);
	 
	// Insert columns.
	$columns = array('id_usuario', 'id_categoria', 'id_deporte', 'descripcion', 'ubicacion');
	 
	// Insert values.
	$values = array($user->id,$_POST['listaCate'],$_SESSION['deport'], $db_ins->quote($_POST['descripcion']), $db_ins->quote($_POST['pac-input']));
	 
	// Prepare the insert query.
	$query_ins
	    ->insert($db_ins->quoteName('torneo'))
	    ->columns($db_ins->quoteName($columns))
	    ->values(implode(',', $values));
	 
	// Set the query using our newly populated query object and execute it.
	$db_ins->setQuery($query_ins);
	$db_ins->execute();					
	$_SESSION['correcto'] = 1;
	$_SESSION['torneo_creado'] = 1;
	$_SESSION['id_torneo'] = $db_ins->insertid();	
	}catch(Exception $e){
		echo "Error";		
	};
	else:
		$_SESSION['correcto'] = 0;
		echo "Error";		
	endif;
		endif;
	endif;
	// endif;
	// endif;

	if(isset($_FILES['logo'])):
		\error_reporting(E_ALL ^ E_NOTICE);
				$ruta="../img/torneos";
				$nombre=$_POST['id_torneo']; //obtiene nombre
				$archivo=$_FILES['logo']['tmp_name'];
				$nombre_archivo=$_FILES['logo']['name'];
				$ext= pathinfo($nombre_archivo);
				$subir= move_uploaded_file($archivo,$ruta."/".$nombre.".".$ext['extension']); //mover imagen y cambia nombre temporal por el real
				if ($subir) {
			    	echo 'el archivo se subio con exito <br>';
				}else {
			   		 echo 'Error al subir el archivo <br>';
				}
			$ruta_imagen = "../img/torneos/".$nombre.".".$ext['extension'];

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

			imagejpeg($lienzo, "../img/torneos/".$nombre.".".$ext['extension'], 80);
			// Liberar memoria
			imagedestroy($lienzo);
	endif;

 ?> 