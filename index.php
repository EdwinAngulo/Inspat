<?php
session_start();
if(!isset($_SESSION['id'])){
header("Location: production/login.php");

}else{
header("Location: production/perfil.php");
}
?>