<?php 
session_start();
require('php/conexion.php');
$conectar=new Conectar;
$conexion=$conectar->conexion();


$sql= "SELECT * FROM usuario INNER JOIN roles ON usuario.Roles_id_Rol=roles.id_Rol LEFT JOIN empresa ON empresa.fk_id_Usu=usuario.id_Usu where Correo_Usu=:email AND Pass_Usu=:pass";

$sentencia=$conexion->prepare($sql);
$sentencia->execute(array(':email' => $_SESSION['correo'],':pass'=>$_SESSION['pass'] ));
$resultado=$sentencia->fetch(PDO::FETCH_ASSOC);
$sentencia->closeCursor();


if($resultado!=null){
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



}
 ?>
<!DOCTYPE html>
<html lang="en">
  <head> 

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="images/favicon.ico" />

    <title>Perfil</title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- jVectorMap -->
    <link href="css/maps/jquery-jvectormap-2.0.3.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    
      <?php 
       require('index.php'); ?>
        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav class="" role="navigation">
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        
          <!-- top tiles -->
          <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Pefil del Usuario</h3>
              </div>

              
            </div>
            
            <div class="clearfix"></div>

            <div class="row" align="center">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_content">

                    <div class="col-md-11 col-sm-11 col-xs-12 profile_left">

                      <div class="profile_img">

                        <!-- end of image cropping -->
                        <div id="crop-avatar">
                          <!-- Current avatar -->
                          <img class="img-responsive avatar-view" width="200px" src="<?php  echo "images/".$_SESSION['foto']; ?>" alt="Avatar">
                          <div style="width: 65%;">
                          
                          <form action="php/cambiarfoto.php" method="post" enctype="multipart/form-data">
                           <label class="control-label">Seleccionar Foto</label>
                           <input id="img" type="file" name="img" accept="image/*" class="file-loading" '>
                          </form>

                          </div>
                          
          
                      </div>
                      <h3><?php echo $_SESSION['nombre']." ".$_SESSION['apellido']; ?></h3>

                      <ul class="list-unstyled user_data">
                       <!-- <li><i class="fa fa-map-marker user-profile-icon"></i>No tiene direccion :V-->
                        </li>

                        <li>
                          <i class="fa fa-briefcase user-profile-icon"></i> <?php echo $_SESSION['emp']; ?>
                        </li>

                        <li>
                          <i class="fa fa-phone user-profile-icon"></i> <?php echo $_SESSION['tel']; ?>
                        </li>
                        <li>
                          <i class="fa fa-slack user-profile-icon"></i> <?php echo $_SESSION['ficha'] ;?>
                        </li>

                        <li>
                          <i class="fa fa-envelope user-profile-icon"></i><?php echo $_SESSION['correo'] ?>
                        </li>
                      </ul>

                      <a class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>Editar Perfil</a>
                      <br />

                      

                    </div>
                    
                            <!-- start user projects -->
                           



                <!-- End to do list -->
                
                <!-- start of weather widget -->
                
                <!-- end of weather widget -->
              </div>
               </div>
                </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            INSPAT - Instrumento de Planificacion Ambiental Tecnico <a href="https://www.sena.com"><b>Design</b> ADSI 902923</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->

    <script src="../vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="../vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="../vendors/bernii/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="../vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="../vendors/Flot/jquery.flot.js"></script>
    <script src="../vendors/Flot/jquery.flot.pie.js"></script>
    <script src="../vendors/Flot/jquery.flot.time.js"></script>
    <script src="../vendors/Flot/jquery.flot.stack.js"></script>
    <script src="../vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="js/flot/jquery.flot.orderBars.js"></script>
    <script src="js/flot/date.js"></script>
    <script src="js/flot/jquery.flot.spline.js"></script>
    <script src="js/flot/curvedLines.js"></script>
    <!-- jVectorMap -->
    <script src="js/maps/jquery-jvectormap-2.0.3.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="js/moment/moment.min.js"></script>
    <script src="js/datepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
   <link href="css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
   <script src="js/fileinput.min.js" type="text/javascript"></script>



<script>
$(document).on('ready', function() {
    $("#img").fileinput({
        showUpload: true,
        maxFileCount:1,
        previewFileType: "image",
        browseClass: "btn btn-success",
        browseLabel: "Buscar Imagen",
        browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i> ",
        removeClass: "btn btn-danger",
        removeLabel: "Borrar",
        removeIcon: "<i class=\"glyphicon glyphicon-trash\"></i> ",
        uploadClass: "btn btn-info",
        uploadLabel: "Subir",
        uploadIcon: "<i class=\"glyphicon glyphicon-upload\"></i> "
    });



});


</script>
    
  </body>

</html>