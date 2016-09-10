<?php 
 require_once('conexion.php');
 session_start();
    $conectar=new Conectar;
        $conexion=$conectar->conexion();

        if ($_FILES["imgmap"]["error"] > 0){
		//echo "ha ocurrido un error";

    } else {

 $permitidos = array("image/jpg", "image/jpeg", "image/gif", "image/png");
 $limite_kb = 16384;

 if (in_array($_FILES['imgmap']['type'], $permitidos) && $_FILES['imgmap']['size'] <= $limite_kb * 1024){

 $nombre  = $_SESSION['id']; 
// $extension = end((explode(".", $_FILES['imgmap']['name'])));
  $extension=pathinfo($_FILES["imgmap"]["name"], PATHINFO_EXTENSION);
  $ruta = "../images/mapaproceso/" .$nombre.".".$extension;
  $resultado = @move_uploaded_file($_FILES["imgmap"]["tmp_name"], $ruta);
   if ($resultado){
    $imagen = $nombre.".".$extension;
    $sql="UPDATE empresa SET m_pro='$imagen' WHERE fk_id_Usu=".$_SESSION['id'];
    $sentencia=$conexion->prepare($sql);
    $sentencia->execute();
  
  
   //echo "el archivo ha sido movido exitosamente";
   } else {
  //echo "ocurrio un error al mover el archivo.";
   	
   

   }
  
 } else {
//echo"archivo no permitido, es tipo de archivo prohibido o excede el tamano de $limite_kb Kilobytes";
  
 }
}


if ($_FILES["imgest"]["error"] > 0){
		//echo "ha ocurrido un error";

    } else {

 $permitidos = array("image/jpg", "image/jpeg", "image/gif", "image/png");
 $limite_kb = 16384;

 if (in_array($_FILES['imgest']['type'], $permitidos) && $_FILES['imgest']['size'] <= $limite_kb * 1024){

 $nombre  = $_SESSION['id']; 

  $extension=pathinfo($_FILES["imgest"]["name"], PATHINFO_EXTENSION);
  $ruta = "../images/estructuraorg/" .$nombre.".".$extension;
  $resultado = @move_uploaded_file($_FILES["imgest"]["tmp_name"], $ruta);
   if ($resultado){
    $imagen = $nombre.".".$extension;
    $sql="UPDATE empresa SET e_org='$imagen' WHERE fk_id_Usu=".$_SESSION['id'];
    $sentencia=$conexion->prepare($sql);
    $sentencia->execute();
  
  
   //echo "el archivo ha sido movido exitosamente";
   } else {
  //echo "ocurrio un error al mover el archivo.";
   	
   

   }
  
 } else {
//echo"archivo no permitido, es tipo de archivo prohibido o excede el tamano de $limite_kb Kilobytes";
  
 }
}




if (isset($_POST['nit'])) {

	$nit=$_POST['nit'];
	$sede=$_POST['sede'];
	$nom=$_POST['nom'];
	$email=$_POST['email'];
	$dir=$_POST['dir'];
	$tel=$_POST['tel'];
	$act=$_POST['act'];
	$pol=$_POST['pol'];
	$rep=$_POST['rep'];
	$c_int=$_POST['c_int'];
	$c_ext=$_POST['c_ext'];
	$pin_int=$_POST['pin_int'];
	$pin_ext=$_POST['pin_ext'];
	
	$idus=$_SESSION['id'];




	 

$sql="SELECT * FROM empresa WHERE empresa.fk_id_Usu =".$_SESSION['id'];
$sentencia=$conexion->prepare($sql);
$sentencia->execute();
$resultado=$sentencia->fetch(PDO::FETCH_ASSOC);

if($resultado!=null){

 $sql= "UPDATE  empresa SET Nit_Emp=:nit,Sede_Emp=:sede,Nom_Emp=:nom,Dir_Emp=:dir,Tel_Emp=:tel,Act_Emp=:act,Correo_Emp=:email,Politica_Emp=:pol, R_legal=:rep, ct_int=:ct_int, ct_ext=:ct_ext,in_int=:pin_int,int_ext=:pin_ext WHERE empresa.fk_id_Usu=:idu";

$sentencia=$conexion->prepare($sql);
$sentencia->execute(array(':nit'=>$nit,':sede'=>$sede,':nom'=>$nom,':dir'=>$dir,':tel'=>$tel,':act'=>$act,':email'=>$email,':pol'=>$pol,':rep'=>$rep,':ct_int'=>$c_int,'ct_ext'=>$c_ext,':pin_int'=>$pin_int,':pin_ext'=>$pin_ext,':idu'=>$idus));
$sentencia->closeCursor();




}else{


$sql= "INSERT INTO empresa (Nit_Emp,Sede_Emp,Nom_Emp,Dir_Emp,Tel_Emp,Act_Emp,Correo_Emp,Politica_Emp,R_legal,ct_int, ct_ext,in_int,int_ext,fk_id_Usu) VALUES(:nit,:sede,:nom,:dir,:tel,:act,:email,:pol,:rep,:ct_int,:ct_ext,:pin_int,:pin_ext,:idu)";

$sentencia=$conexion->prepare($sql);
$sentencia->execute(array(':nit'=>$nit,':sede'=>$sede,':nom'=>$nom,':dir'=>$dir,':tel'=>$tel,':act'=>$act,':email'=>$email,':pol'=>$pol,':rep'=>$rep,':ct_int'=>$c_int,'ct_ext'=>$c_ext,':pin_int'=>$pin_int,':pin_ext'=>$pin_ext ,':idu'=>$idus));
$sentencia->closeCursor();

}


header("Location:../crearempresa.php");




}

 ?>