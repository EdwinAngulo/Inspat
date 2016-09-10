<?php 
require('php/conexion.php');
session_start();

$conexion=new Conectar;
$base=$conexion->conexion();
$sql="SELECT * FROM empresa WHERE empresa.fk_id_Usu =".$_SESSION['id'];
$sentencia=$base->prepare($sql);
$sentencia->execute();
$resultado=$sentencia->fetch(PDO::FETCH_ASSOC);



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

    <title>Registro de empresa</title>

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

    <link href="css/lightbox.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
   <?php require_once('index.php'); ?>

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
        <div class="right_col" role="main">
          <!-- top tiles -->
        

          <div class="row">

            <div class="col-md-11 col-sm-11 col-xs-12">

       <h3 class="col-md-8 col-sm-8 col-xs-12 col-md-offset-5"><b>REGISTRO DE EMPRESA</b></small></h3>

                  <div class="x_content">
                    <br/>
                    <form class="form-horizontal form-label-left input_mask" action="php/insertarempresa.php" method="post" enctype="multipart/form-data">

                      

                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="number" class="form-control has-feedback-left" id="inputSuccess3" name="nit" placeholder="NIT" value="<?php echo $resultado['Nit_Emp']; ?>">
                        <span class="fa fa-slack form-control-feedback left" aria-hidden="true"></span>

                      </div>
                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="text" class="form-control has-feedback-left" id="inputSuccess2" name="nom" placeholder="Nombre de la Empresa" value="<?php echo $resultado['Nom_Emp']; ?>" required>
                        <span class="fa fa-building form-control-feedback left" aria-hidden="true"></span>
                      </div>
                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="text" class="form-control has-feedback-left" id="inputSuccess2" placeholder="Representante Legal" name="rep" value="<?php echo $resultado['R_legal']; ?>">
                        <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                      </div>

                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="email" class="form-control has-feedback-left" id="inputSuccess4" placeholder="Email" name="email" value="<?php echo $resultado['Correo_Emp']; ?>" required >
                        <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                      </div>

                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="number" class="form-control has-feedback-left" id="inputSuccess5" placeholder="Telefono" name="tel" value="<?php  echo $resultado['Tel_Emp'];?>" >
                        <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                      </div>

                       <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="text" class="form-control has-feedback-left" id="inputSuccess6" placeholder="Direccion" name="dir" value="<?php echo $resultado['Dir_Emp']; ?>" required>
                        <span class="fa fa-map-marker form-control-feedback left" aria-hidden="true"></span>
                      </div>
                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="text" class="form-control has-feedback-left" id="inputSuccess7" placeholder="Sedes" name="sede" value="<?php echo $resultado['Sede_Emp']; ?>" >
                        <span class="fa fa-map-marker form-control-feedback left" aria-hidden="true"></span>
                      </div>
                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <input type="text" class="form-control has-feedback-left" id="inputSuccess8" placeholder="Actividad" name="act" value="<?php echo $resultado['Act_Emp']; ?>" required>
                        <span class="fa fa-briefcase form-control-feedback left" aria-hidden="true"></span>
                      </div>
                     
                      
                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                      <h2>Contexto</h2>
                      </br>
                       <p>Internas</p><textarea class="form-control" rows="5" name="c_int"><?php echo $resultado['ct_int']; ?></textarea>
                      </br>
                      </br>
                      <p>Externas</p><textarea class="form-control" rows="5" name="c_ext"><?php echo $resultado['ct_ext']; ?></textarea>
                      </div>
                      
                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                      <h2>Partes Interesadas</h2>
                      </br>
                       <p>Internas</p><textarea class="form-control" rows="5" name="pin_int"><?php echo $resultado['in_int']; ?></textarea>
                      </br>
                      </br>
                      <p>Externas</p><textarea class="form-control" rows="5" name="pin_ext"><?php echo $resultado['int_ext']; ?></textarea>
                      </div>

                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <p>Mapa De Procesos</p>
                        <!--<img id="imgp" src="images/mapaproceso/<?php //echo $resultado['m_pro'] ?>" width="100px" class="img-rounded">-->
                   <a href="images/mapaproceso/<?php echo $resultado['m_pro'] ?>" data-lightbox="image-1" data-title="Mapa de proceso"><img src="images/mapaproceso/<?php echo $resultado['m_pro'] ?>" width="100px" class="img-rounded"></a>

                        <label class="control-label">Seleccionar Imagen</label>
                           <input class="img" type="file" name="imgmap" accept="image/*" class="file-loading" '>
                        <span class="form-control-feedback rigth"></span>
                      </div>
                    
                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <p>Estructura Organizacional</p>
                       <!-- <img src="images/estructuraorg/<?php //echo $resultado['e_org'] ?>" width="100px" class="img-rounded">-->

<a href="images/estructuraorg/<?php echo $resultado['e_org'] ?>" data-lightbox="image-1" data-title="Estructura organizacional"><img  src="images/estructuraorg/<?php echo $resultado['e_org'] ?>" width="100px" class="img-rounded"></a>

                        <label class="control-label">Seleccionar Imagen</label>
                           <input class="img" type="file" name="imgest" accept="image/*" class="file-loading">
                        <span class="form-control-feedback rigth"></span>
                      </div>
                       <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <h2>Politica Ambiental</h2><textarea class="form-control" rows="12" name="pol" placeholder='Politica Ambiental'><?php echo $resultado['Politica_Emp']; ?></textarea>
                        </br>
                      </br>
                      </div>
                      <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        <h2>Cumplimieto de la Politica</h2>
                        <div><input type="checkbox" required>ISO 14001:2004: la propia norma establece la necesidad de incluir los compromisos de cumplir con los requisitos legales y voluntarios suscritos por la organización, de mejorar continuamente el comportamiento ambiental y de prevenir la contaminación.</div>
                      
                        <div><input type="checkbox" required>Requisitos legales aplicables: La redacción de la política ambiental debe tener en cuenta aquellas materias específicas de la activida de la organización que pueden estar sujetas a requisitos legales en materia ambiental.</div>
                      
                        <div><input type="checkbox" required>Aspectos ambientales significativos: Los aspectos ambientales (residuos, consumos) que la organización desee contemplar dentro de su política ambiental deben ser significativos para la misma.</div>

                        <div><input type="checkbox" required>Mercado: es posible tener en cuenta el comportamiento y/o los eslóganes de empresas competidoras.</div>

                        <div><input type="checkbox" required>Empresa: la política debe alinearse con la realidad de la propia organización, no estableciendo directrices ajenas a la misma o imposibles de cumplir. También debe tenerse en cuenta que la política debe ser entendida por todo el personal de la organización, por lo tanto, el vocabulario y las expresiones usadas deben ser los adecuados al nivel de los empleados.</div>
                       

                        </br>
                      </br>
                      </div>


                      
                      <div class="ln_solid"></div>
                      <div class="form-group">

                        <div class="col-md-11 col-sm-11 col-xs-12 col-md-offset-5">
                          <button type="submit" class="btn btn-success">Guardar</button>
                          <button type="" class="btn btn-danger">Cancelar</button>
                          
                        </div>
                      </div>

                    </form>

                <!-- End to do list -->
                
                <!-- start of weather widget -->
                
                <!-- end of weather widget -->
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
   <script type="text/javascript" src="/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
   <script src="js/lightbox.js"></script>


    <script>
$(document).on('ready', function() {
    $(".img").fileinput({
        showUpload: false,
        maxFileCount:1,
        previewFileType: "image",
        browseClass: "btn btn-success",
        browseLabel: "Buscar Imagen",
        browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i> ",
        removeClass: "btn btn-danger",
        removeLabel: "Borrar",
        removeIcon: "<i class=\"glyphicon glyphicon-trash\"></i> ",
        
    });



});


</script>
<script language="javascript">
// buscamos el metodo para los tipos de navegadores
function launchFullScreen(element) {
  if(element.requestFullScreen) {
    element.requestFullScreen();
  } else if(element.mozRequestFullScreen) {
    element.mozRequestFullScreen();
  } else if(element.webkitRequestFullScreen) {
    element.webkitRequestFullScreen();
  }
}
</script>

<script>
    lightbox.option({
      'resizeDuration': 100,
      'wrapAround': true
    })
</script>

   
  </body>
</html>