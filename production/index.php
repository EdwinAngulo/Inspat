<?php 


if(isset($_SESSION['id'])){


}else{

  header("Location: login.php");

}
 ?>


   <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="perfil.php" class="site_title"><i class="fa fa-envira"></i> <span>INSPAT</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
              <div class="profile_pic">
               <a href="perfil.php"><img src="<?php  echo "images/".$_SESSION['foto']; ?>" alt="..." class="img-circle profile_img"></a>
              </div>
              <div class="profile_info">
                <span>Bienvenido</span>
                <h2><?php echo $_SESSION['nombre']." ".$_SESSION['apellido']; ?></h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br/>

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
             <div class="menu_section">
                <h3><?php echo $_SESSION['rol']; ?></h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-edit"></i> Reportes <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="Nuevoreporte.html">Nuevo Reporte</a></li>
                      <li><a href="historico_reportes.html">Historico de Reporte</a></li>
                      
                    </ul>
                  </li>
                  <li><a><i class="fa fa-newspaper-o"></i>Programas Ambientales<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                     <li><a href="Crearprograma.html">Crear Programa</a></li>
                     <li><a href="programas_activos.html">Ver Programas Activos</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-industry"></i> Gestion de Empresa <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="crearempresa.php">Registrar Empresa</a></li>
                      <li><a>RAI<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            
                            </li>
                            <li><a href="anexo1-1.php">Anexo 1</a>
                            </li>
                            <li><a href="anexo2.html">Anexo 2</a>
                            </li>
                            <li><a href="anexo3.html">Anexo 3</a>
                            </li>
                            <li><a href="anexo4.html">Anexo 4</a>
                            </li>
                            <li><a href="anexo5.html">Anexo 5</a>
                            </li>
                            <li><a href="anexo6.html">Anexo 6</a>
                            </li>
                            <li><a href="anexo7.html">Anexo 7</a>
                            </li>
                            <li><a href="anexo8.html">Anexo 8</a>
                            </li>
                            <li><a href="anexo9.html">Anexo 9</a>
                            </li>
                            <li><a href="anexo10.html">Anexo 10</a>
                            </li>
                            <li><a href="anexo11.html">Anexo 11</a>
                            </li>
                            <li><a href="anexo12.html">Anexo 12</a>
                            </li>
                            <li><a href="anexo13.html">Anexo 13</a>
                            </li>
                          </ul>
                        </li>
                     
                    </ul>
                  </li>
                  <li><a href="normativa.html"><i class="fa fa-file-text"></i>Normativa Vigente </span></a>
                  <li><a href="contactoadmin.html"><i class="fa fa-envelope"></i> Contactar al Administrador </span></a>
                    
                  </li>
                  
                </ul>
              </div>
             

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip">
                <span class="glyphicon "></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true" onclick="launchFullScreen(document.documentElement);"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Cerrar Sesion" href="php/cerrarsesion.php">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top">
                <span class="glyphicon" ></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>




  
