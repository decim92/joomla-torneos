<?php

 	header('Location: ../../calendario');
 	include "../conexion.php";
 	
\error_reporting(E_ALL ^ E_NOTICE);
	$ruta="../images";
	$nombre=$_POST['nombre']; //obtiene nombre
	$archivo=$_FILES['imagen']['tmp_name'];
	$nombre_archivo=$_FILES['imagen']['name'];
	$ext= pathinfo($nombre_archivo);
	$subir= move_uploaded_file($archivo,$ruta."/".$nombre.".".$ext['extension']); //mover imagen y cambia nombre temporal por el real
	if ($subir) {
    	echo 'el archivo se subio con exito <br>';
	}else {
   		 echo 'Error al subir el archivo <br>';
	}
$ruta_imagen = "../images/".$nombre.".".$ext['extension'];

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

imagejpeg($lienzo, "../images/".$nombre.".".$ext['extension'], 80);
// Liberar memoria
imagedestroy($lienzo);
?>