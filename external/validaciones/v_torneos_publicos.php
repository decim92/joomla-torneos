<?php
	session_start();
	// unset($_SESSION['correcto']);
	if(isset($_POST['id_tor'])):
 		header('Location: ../../index.php/vista-publica?id_torneo='.$_POST['id_tor']);
 	endif;
 	if(isset($_POST['id_tor1'])):
 		header('Location: ../../index.php/vista-publica?id_torneo='.$_POST['id_tor1']);
 	endif;
 	if(isset($_POST['id_tor2'])):
 		header('Location: ../../index.php/vista-publica?id_torneo='.$_POST['id_tor2']);
 	endif;
 	
 	include "../conexion.php";

 	if(isset($_POST['id_tor'])):
 		$_SESSION['id_tor'] = $_POST['id_tor'];
 		$_SESSION['grupo_select'] = $_POST['cmb_grupos'];
 		$_SESSION['id_tabx'] = $_POST['id_tab'];
 	endif;

 	if(isset($_POST['id_tor1'])):
 		$_SESSION['id_tor'] = $_POST['id_tor1'];
 		$_SESSION['grupo_select1'] = $_POST['cmb_clasif'];
 		$_SESSION['id_tabx'] = $_POST['id_tab'];
 	endif;

 	if(isset($_POST['id_tor2'])):
 		$_SESSION['id_tor'] = $_POST['id_tor2'];
 		$_SESSION['grupo_select2'] = $_POST['cmb_calend'];
		$_SESSION['id_tabx'] = $_POST['id_tab'];
 	endif;

 	if(isset($_POST['lista_jornadas'])):
			$_SESSION['id_jornada'] = $_POST['lista_jornadas'];
			$_SESSION['id_tab'] = $_POST['id_tab'];
			$_SESSION['id_tor'] = $_POST['id_tor'];
			$_SESSION['id_tabx'] = $_POST['id_tabx'];
		endif;
?>