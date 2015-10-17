<?
include "conexion.php";
	
$idcombo = $_POST["id"];
$action =$_POST["combo"];
	$db_combo = & JDatabase::getInstance( $option );
	$query_combo = "SELECT UPPER(nombre) as nomb_ciud, id_ciudad FROM ciudad WHERE id_pais = '".$idcombo."' order by nombre ASC";	
	$db_combo->setQuery($query_combo);
	$db_combo->execute();
	$numRows_combo = $db_combo->getNumRows();	
	$results_combo = $db_combo->loadObjectList();
switch($action){
case "pais":{
// $query =$mysql->query("SELECT idestado,estado FROM estado WHERE pais = $idcombo order by estado ASC");
// foreach($query["data"] as $rs)
// echo '<option value="'.$rs["idestado"].'">'.htmlentities($rs["estado"]).'</option>';
// $query = mysqli_query($cn, "select id_ciudad, nombre from ciudad where id_pais = '".$idcombo."' order by nombre ASC") or die ("Error en la consulta");
// while($line = mysqli_fetch_array($query)):
//     echo "<option value='".$line['id_ciudad']."'>".$line['nombre']."</option>";   
//   endwhile;
  for($i = 0; $i<$numRows_combo; $i++):
	 echo "<option value='".$results_combo[$i]->id_ciudad."'>".$results_combo[$i]->nomb_ciud."</option>";	
  endfor; 
break;
}
// case "estado":{
// $query =$mysql->query("SELECT idciudad,ciudad FROM ciudad WHERE estado= $idcombo order by ciudad ASC");
// foreach($query["data"] as $rs)
// echo '<option value="'.$rs["idciudad"].'">'.htmlentities($rs["ciudad"]).'</option>';
// break;
// }
}
?>