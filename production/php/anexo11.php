<?php 
require_once('conexion.php');
$conectar= new Conectar;
$conexion=$conectar->conexion();

if (!empty($_POST['tipop'])) {
	$tipo=$_POST['tipop'];
	$sql="INSERT INTO tipo_proceso (Nom_Tipo_proceso) VALUES (:tip) ";
	$sentencia=$conexion->prepare($sql);
	$sentencia->execute(array(':tip'=>$tipo));
	$sentencia->closeCursor();
	$sql="SELECT * FROM tipo_proceso WHERE Nom_Tipo_proceso=:tip";
	$sentencia=$conexion->prepare($sql);
	$sentencia->execute(array(':tip'=>$tipo));
	$resultado=$sentencia->fetch(PDO::FETCH_ASSOC);
	$sentencia->closeCursor();

}

if ( !empty($_POST["pro"]) && is_array($_POST["pro"]) ) { 
$pros=$_POST["pro"];
$tid=$resultado['id_Tipo_Proceso'];


 foreach ($pros as $pro ) {
    $sql="INSERT INTO proceso (fk_Tipo_Proceso,Nom_Proceso) VALUES (:itp,:np)";
	$sentencia=$conexion->prepare($sql);
	$sentencia->execute(array(':itp'=>$tid,':np'=>$pro));
	$sentencia->closeCursor();

   	
   }  

}


 ?>