<?php
	session_start();
	// unset($_SESSION['correcto']);
	if(isset($_POST['id_tor'])):
 		header('Location: ../../index.php/vista-publica?id_torneo='.$_POST['id_tor']);
 	endif;
 	
 	include "../conexion.php";

 	if(isset($_POST['id_tor'])):
 		$_SESSION['id_tor'] = $_POST['id_tor'];
 		$_SESSION['grupo_select'] = $_POST['cmb_grupos'];
 	endif;
?>