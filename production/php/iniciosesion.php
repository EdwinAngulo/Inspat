<?php 


require_once('conexion.php');
      


if(isset($_POST['email'])){

$email=$_POST['email'];
$pass=$_POST['pass'];
    $conectar=new Conectar;
             $conexion=$conectar->conexion();


$sql= "SELECT * FROM usuario INNER JOIN roles ON usuario.Roles_id_Rol=roles.id_Rol LEFT JOIN empresa ON empresa.fk_id_Usu=usuario.id_Usu where Correo_Usu=:email AND Pass_Usu=:pass";

$sentencia=$conexion->prepare($sql);
$sentencia->execute(array(':email' => $email,':pass'=>$pass ));
$resultado=$sentencia->fetch(PDO::FETCH_ASSOC);
$sentencia->closeCursor();


if($resultado!=null){
session_start();
$_SESSION['id']=$resultado['id_Usu'];
$_SESSION['foto']=$resultado['foto_Usu'];
$_SESSION['idrol']=$resultado['id_Rol'];
$_SESSION['rol']=$resultado['Descrip_Rol'];
$_SESSION['nombre']=$resultado['Nom_Usu'];
$_SESSION['apellido']=$resultado['Ape_Usu'];
$_SESSION['correo']=$resultado['Correo_Usu'];
$_SESSION['pass']=$resultado['Pass_Usu'];
$_SESSION['tdoc']=$resultado['Tipo_Doc_Usu'];
$_SESSION['tel']=$resultado['Tel_Usu'];
$_SESSION['ficha']=$resultado['Ficha_Usu'];
$_SESSION['estado']=$resultado['Estado_Usu'];
if($resultado['Nom_Emp']!=null){
$_SESSION['emp']=$resultado['Nom_Emp'];
}else{

$_SESSION['emp']="No Se ha resgistrado una empresa";
}

header("Location: ../../production/perfil.php");

}else{

header("Location: ../login.php");

}


 }







 ?>