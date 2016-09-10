<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="images/favicon.ico" />

    <title>Anexo1</title>

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
   <?php session_start();
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
        <div class="right_col" role="main">
          <!-- top tiles -->
        

          <div class="row">


           


            <div class="col-md-11 col-sm-11 col-xs-12">
                  
                  <div id="wizard" class="form_wizard wizard_horizontal">
                      <ul class="wizard_steps">
                        <li>
                          <a href="#step-1">
                            <span class="step_no">1</span>
                            <span class="step_descr">
                                              Paso 1<br />
                                              
                                          </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-2">
                            <span class="step_no">2</span>
                            <span class="step_descr">
                                              Paso 2<br />
                                             
                                          </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-3">
                            <span class="step_no">3</span>
                            <span class="step_descr">
                                              Paso 3<br />
                                             
                                          </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-4">
                            <span class="step_no">4</span>
                            <span class="step_descr">
                                              Paso 4<br />
                                              
                                          </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-5">
                            <span class="step_no">5</span>
                            <span class="step_descr">
                                              Paso 5<br />
                                              
                                          </span>
                          </a>
                        </li>
                        </li>
                        
                      </ul>

                      <form action="php/anexo11.php" method="post">
                      <div id="step-1">
                          <div class="form-group" align="center" id="pgrup">

                           
                            <div>
                              <p>Tipo de Proceso  <input type="text" id="first-name" name="tipop" required></p>
                            </div>
                            <div id="p1">
                              <p>Proceso  <input type="text" id="first-name" name="pro[]" required></p>
                            </div>
                            
                            
                            
                          </div>
                    
                        <div>
                             <input type="button" id="agregar" class="btn btn-primary" value="Agregar Proceso">
                            </div>

                      </div>

   

         
                      <div id="step-2">
                        <h2 class="StepTitle" align="center">ENTRADAS</h2>
                        <div class="form-group">
                          <div class="form-group" align="center">
                            
                           
                            
                            <div>
                              <p>Tipo  <input type="text" id="first-name" name="nom_entrada"></p>
                            </div>
                            
                            
                            <div>
                              <p>Cantidad  <input type="text" id="first-name" name="cant_entrada" size="20"></p>
                            </div>
                          </div>
                        </div>
                        
                     </div>
                



                      <div id="step-3">
                     

                          <div class="form-group" align="center">
                           
                            
                            <div>
                              <p>Actividad <input type="text" id="first-name" name="nom_actividad"></p>
                            </div>
                                         
                          </div>
                      </div>
                      <div id="step-4">
                    

                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">AREAS DE INCIDENCIA AMBIENTAL INST FISICAS /SIST.Y EQ . TECNOLOGICOS <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                             <input type="text" id="first-name" class="form-control col-md-7 col-xs-12" name="nom_area">
                            </div>
                          </div>
                 
                      </div>

                      <div id="step-5">
                    
                         <h2 class="StepTitle" align="center">SALIDAS</h2>
                        <div class="form-group">
                          <div class="form-group" align="center">
                            
                            
                            <div>
                              <p>Tipo  <input type="text" id="first-name" name="nom_salida"></p>
                            </div>
                            
                            
                            <div>
                              <p>Cantidad  <input type="text" id="first-name" size="20" name="cant_salida"></p>
                            </div>

                          </div>
                           <div align="center"><input type="submit" name="enviar" class="btn btn-info" value="Finalizar y Guardar"></div>
                            </form>
                        </div>
                         <!--<td class="btn btn-info"><input type="submit" name="enviar" id="enviar" value="Insertar"></td>-->
                      </div>


                    </div>



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
            INSPAT - Inspeccion Ambiental para Tecnologos <a href="https://www.sena.com">ADSI 902923</a>
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
     <!-- jQuery Smart Wizard -->
    <script src="../vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
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

    <!-- Flot -->
  
    
    <!-- /Flot -->

    <!-- jVectorMap -->
    <script src="js/maps/jquery-jvectormap-world-mill-en.js"></script>
    <script src="js/maps/jquery-jvectormap-us-aea-en.js"></script>
    <script src="js/maps/gdp-data.js"></script>
   
     <!-- jQuery Smart Wizard -->
    <script>
    var cant=1;
      $(document).ready(function() {
        $('#wizard').smartWizard();

        $('#wizard_verticle').smartWizard({
          transitionEffect: 'slide'
        });

        $('.buttonNext').addClass('btn btn-success');
        $('.buttonPrevious').addClass('btn btn-primary');
});

      $("#agregar").on('click', function(){

    //$("#tabla tbody tr:eq(0)").clone().removeClass('tabla').appendTo("#tabla tbody");
     cant++;
      
$('#pgrup div:last').after('<div class="p'+cant+'"><p>Proceso  <input type="text" name="pro[]"></p><button id="p'+cant+'" type="button" class="btn btn-danger" onClick="borrar('+cant+')">Eliminar</button></div>');
    
  });
  
  function borrar(id) {
                

    $("div").remove(".p"+id)
  }

    </script>
    <!-- /jQuery Smart Wizard -->
  </body>
</html>