<?php
session_start();
require_once('conexion.php');
$conectar=new Conectar;
$conexion=$conectar->conexion();



//comprobamos si ha ocurrido un error.
if ($_FILES["img"]["error"] > 0){
	
	header("Location: ../perfil.php");
 //echo "ha ocurrido un error";
} else {
 //ahora vamos a verificar si el tipo de archivo es un tipo de imagen permitido.
 //y que el tamano del archivo no exceda los 16MB
 $permitidos = array("image/jpg", "image/jpeg", "image/gif", "image/png");
 $limite_kb = 16384;

 if (in_array($_FILES['img']['type'], $permitidos) && $_FILES['img']['size'] <= $limite_kb * 1024){
  //con estas variables generaremos un codigo que vamos a unir como nombre a la imagen
                //de esta manera evitaremos problemas con los nombres de las imagenes
                $nombre  = $_SESSION['id'];  //Fecha Actual       
 //Generamos dos Digitos aleatorios
                //esta es la ruta donde copiaremos la imagen
  //recuerden que deben crear un directorio con este mismo nombre
  //en el mismo lugar donde se encuentra el archivo subir.php
 $extension = end(explode(".", $_FILES['img']['name']));
  $ruta = "../images/" .$nombre.".".$extension;
  //comprobamos si este archivo existe para no volverlo a copiar.
  //pero si quieren pueden obviar esto si no es necesario.
  //o pueden darle otro nombre para que no sobreescriba el actual.
  
  //aqui movemos el archivo desde la ruta temporal a nuestra ruta
  //usamos la variable $resultado para almacenar el resultado del proceso de mover el archivo
  //almacenara true o false
   $resultado = @move_uploaded_file($_FILES["img"]["tmp_name"], $ruta);
   if ($resultado){
    $imagen = $nombre.".".$extension;
    $sql="UPDATE usuario SET foto_Usu='$imagen' WHERE id_Usu=".$_SESSION['id'];
    $sentencia=$conexion->prepare($sql);
    $sentencia->execute();
  header("Location: ../perfil.php");
  
   // echo "el archivo ha sido movido exitosamente";
   } else {
   // echo "ocurrio un error al mover el archivo.";
   	
   	header("Location: ../perfil.php");

   }
  
 } else {
  //echo"archivo no permitido, es tipo de archivo prohibido o excede el tamano de $limite_kb Kilobytes";
  header("Location: ../perfil.php");
 }
}

?>