<?php 
session_start();
$_SESSION['id']=null;
$_SESSION['idrol']=null;
$_SESSION['rol']=null;
$_SESSION['nombre']=null;
$_SESSION['apellido']=null;
$_SESSION['correo']=null;
$_SESSION['pass']=null;
$_SESSION['tdoc']=null;
$_SESSION['tel']=null;
$_SESSION['ficha']=null;
$_SESSION['estado']=null;
session_destroy();
session_unset();
header("Location: ../login.php")


 ?>