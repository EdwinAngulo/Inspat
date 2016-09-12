-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-09-2016 a las 16:21:57
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accion_programa_ambiental`
--

CREATE TABLE `accion_programa_ambiental` (
  `id_Acc_Pro_Amb` int(11) NOT NULL COMMENT 'Llave primaria y código de la tabla Accion_Programa_Ambiental.',
  `id_Prog_Amb` int(11) DEFAULT NULL COMMENT 'LLave foranea y la relación de uno a muchos con la tabla Programa_Ambiental.',
  `id_Emp` int(11) DEFAULT NULL COMMENT 'Nit de la empresa.',
  `Acc_Acc_Pro_Amb` varchar(255) NOT NULL COMMENT 'Accion del programa Ambiental.',
  `Resp_Acc_Pro_Amb` varchar(45) NOT NULL COMMENT 'Responsable de realizar el programa ambiental.',
  `Recursos_Acc_Pro_Amb` int(11) NOT NULL COMMENT 'Costos de las acciones.(Acc_Acc_Pro_Amb).',
  `Fecha_Cump_Acc_Pro_Amb` date NOT NULL COMMENT 'Fecha de cumplimiento ',
  `Resp_Pro_Acc_Pro_Amb` varchar(45) NOT NULL COMMENT 'Responsable del programa.',
  `Fecha_Revision_Acc_Pro_Amb` date NOT NULL COMMENT 'Fecha de dia de la revisión.',
  `Fecha_Aprob_Acc_Pro_Amb` date NOT NULL COMMENT 'Fecha del día de la aprobación.',
  `Resp_Aprob_Acc_Pro_Amb` varchar(45) NOT NULL COMMENT 'Responsable de Aprobar el programa ambiental.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id_Actividad` int(11) NOT NULL COMMENT 'Código de la tabla Actividad y llave primaria.',
  `Nom_Actividad` varchar(45) NOT NULL COMMENT 'Nombre de la actividad.',
  `id_Proceso` int(11) DEFAULT NULL COMMENT 'Código de la tabla Proceso y este campo posee una relación de uno a muchos con la tabla Proceso.',
  `id_Area_Incid` int(11) DEFAULT NULL COMMENT 'Código de la tabla del Area_Incidencia y posee una relación de uno a muchos con la tabla Area_Incidencia.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_Adm` int(11) NOT NULL,
  `Nom_Adm` varchar(45) DEFAULT NULL,
  `Ape_Adm` varchar(45) DEFAULT NULL,
  `Correo_Adm` varchar(45) DEFAULT NULL,
  `Pass_Adm` varchar(45) DEFAULT NULL,
  `Tipo_Doc_Adm` varchar(45) DEFAULT NULL,
  `Tel_Adm` int(11) DEFAULT NULL,
  `Estado_Adm` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_incidencia`
--

CREATE TABLE `area_incidencia` (
  `id_Area_Incid` int(11) NOT NULL COMMENT 'Codigo del Area_ Incidencia y llave primaria.',
  `Nom_Area_Incid` varchar(255) NOT NULL COMMENT 'Nombre del area de incidencia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aspectos_ambientales`
--

CREATE TABLE `aspectos_ambientales` (
  `id_Asp_Amb` int(11) NOT NULL COMMENT 'Código del Aspecto Ambiental',
  `Nom_Asp_Amb` varchar(75) NOT NULL COMMENT 'Nombre del Aspecto ambiental',
  `id_Proceso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_legal`
--

CREATE TABLE `documento_legal` (
  `id_Doc_Legal` int(11) NOT NULL COMMENT 'Código del documento Legal y llave primaria.',
  `Doc_Legal` longtext NOT NULL COMMENT 'Documento Legal (Descripción).',
  `Cod_Legal` varchar(75) NOT NULL COMMENT 'Código legal ( Código de ley  del documento legal).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doc_legal_aplicable`
--

CREATE TABLE `doc_legal_aplicable` (
  `id_Doc_Legal_Aplicable` int(11) NOT NULL COMMENT 'CÓdigo de la tabla Doc_Legal_Aplicable ( Registro de documentos legales aplicables). y llave primaria.',
  `id_Mat` int(11) DEFAULT NULL COMMENT 'Código de la tabla  Matriz y este campo posee una relación de uno a muchos  con la tabla Matriz.',
  `id_Emp` int(11) DEFAULT NULL COMMENT 'Nit de la empresa',
  `id_Doc_Legal` int(11) DEFAULT NULL COMMENT 'Código de la tabla Documento_Legal. y este campo  posee una relacion de uno a muchos.',
  `id_Asp_Amb` int(11) DEFAULT NULL COMMENT 'Código de la tabla l aspecto_ ambiental.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_Emp` int(11) NOT NULL COMMENT 'Llave primaria y es el NIT de la empresa.',
  `Nit_Emp` int(11) DEFAULT NULL,
  `Sede_Emp` varchar(45) DEFAULT NULL,
  `Nom_Emp` varchar(45) NOT NULL COMMENT 'Nombre de la empresa.',
  `Dir_Emp` varchar(45) NOT NULL COMMENT 'Dirección de la Empresa.',
  `Tel_Emp` int(11) DEFAULT NULL COMMENT 'Telefono de la empresa.',
  `Act_Emp` varchar(255) NOT NULL COMMENT 'Actividad de la empresa ( A que se dedica la empresa).',
  `Correo_Emp` varchar(45) NOT NULL COMMENT 'Correo electronico de la empresa.',
  `Politica_Emp` longtext,
  `R_legal` varchar(100) DEFAULT NULL,
  `ct_int` mediumtext,
  `ct_ext` mediumtext,
  `in_int` mediumtext,
  `int_ext` mediumtext,
  `m_pro` varchar(50) DEFAULT NULL,
  `e_org` varchar(50) DEFAULT NULL,
  `fk_id_Usu` int(11) DEFAULT NULL COMMENT 'Llave foranea y la relación de uno a muchos con la tabla Usuario.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_Emp`, `Nit_Emp`, `Sede_Emp`, `Nom_Emp`, `Dir_Emp`, `Tel_Emp`, `Act_Emp`, `Correo_Emp`, `Politica_Emp`, `R_legal`, `ct_int`, `ct_ext`, `in_int`, `int_ext`, `m_pro`, `e_org`, `fk_id_Usu`) VALUES
(3, 343243, 'sena', 'Peluqueria alberto', 'calle perdida 6', 546542, 'peluqueria', 'pelualbert@peinados.com', 'wqewqeqwe', 'alberto', 'wewqe', 'qwewq', 'eqwewq', 'eqwewqe', NULL, NULL, 2),
(4, 1234, 'sdew', 'sena', 'wfsfadsf', 34343, 'fasda', 'ninogutierrez2@gmail.com', 'dasdsad', 'nino', 'asddsa', 'asd', 'sad', 'sadasd', '1.jpg', '1.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `id_Entrada` int(11) NOT NULL COMMENT 'Código de la tabla Entrada y llave primaria.',
  `Nom_Entrada` varchar(255) NOT NULL COMMENT 'Nombre de la entrada.',
  `Cant_Entrada` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_salida`
--

CREATE TABLE `entrada_salida` (
  `id_Entrada_Salida` int(11) NOT NULL COMMENT 'Código de la tabla Entrada_Salida (Registro de entradas y salidas) y llave primaria.',
  `id_Emp` int(11) DEFAULT NULL COMMENT 'Nit de la empresa.',
  `id_Proceso` int(11) DEFAULT NULL COMMENT 'Código de la tabla Proceso.',
  `id_Entrada` int(11) DEFAULT NULL COMMENT 'Código de la tabla entrada, este campo posee una relación de uno a muchos con la tabla Entrada.',
  `id_Actividad` int(11) DEFAULT NULL COMMENT 'Codigo de la tabla Actividad.',
  `id_Area_Incid` int(11) DEFAULT NULL COMMENT 'Código del area de incidencia. y posee una relación de uno a muchos con la tabla Area_Incidencia.',
  `id_Salida` int(11) DEFAULT NULL COMMENT 'código de la  Salida, este campo posee una relación de uno a muchos con la tabla salida.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `est_esperado`
--

CREATE TABLE `est_esperado` (
  `id_Est_Esperado` int(11) NOT NULL COMMENT 'Código de la tabla id_Est_Esperado (Estado Esperado) y llave primaria.',
  `id_Tipo_Est` int(11) DEFAULT NULL COMMENT 'Código de la tabla Tipo_Estado. Y este campo posee una relación de uno a muchos con la tabla Tipo_Estado.',
  `id_Tipo_Lista_Cheq` int(11) DEFAULT NULL COMMENT 'Código de la tabla Tipo_Lista_Chequeo (Tipo lista chequeo).',
  `Descrip_Est_Esperado` longtext NOT NULL COMMENT 'Descripción del estado esperado ( descripción  de los tipos de estados ).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impacto_ambiental`
--

CREATE TABLE `impacto_ambiental` (
  `id_Imp_Amb` int(11) NOT NULL COMMENT 'Código de la tabla Impacto_Ambiental y llave primaria.',
  `Nom_Imp_Amb` varchar(75) NOT NULL COMMENT 'Nombre del Impacto Ambiental.',
  `id_Asp_Amb` int(11) DEFAULT NULL COMMENT 'código de  Aspecto_ ambiental. Este campo posee una relación de uno a muchos con la tabla Aspecto_Ambiental.',
  `id_Proceso` int(11) DEFAULT NULL COMMENT 'Código de la tabla  Proceso.',
  `id_Tipo_Proceso` int(11) DEFAULT NULL COMMENT 'código de la tabla  Tipo_ Proceso.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_cheq`
--

CREATE TABLE `lista_cheq` (
  `id_Num_Inspecc` int(11) NOT NULL COMMENT 'Código del número Inspeccion ( Número inspección lo asigna la empresa).',
  `Fecha_Lista_Cheq` date NOT NULL COMMENT 'Fecha de la realización de la lista de chequeo.',
  `Hora_Lista_Cheq` time NOT NULL COMMENT 'Hora de la realización de la lista de chequeo.',
  `id_Emp` int(11) DEFAULT NULL COMMENT ' Nit de la empresa',
  `Unid_Lista_Cheq` varchar(75) NOT NULL COMMENT 'Unidad de la lista de chequeo.',
  `Instal_Lista_Cheq` varchar(75) NOT NULL COMMENT 'Instlaciones de la lista de chequeo.',
  `id_Area_Inc` int(11) DEFAULT NULL COMMENT 'Código de la tabla Area_Incidencia.',
  `id_Mat` int(11) DEFAULT NULL COMMENT 'Código de la matriz y  este campo posee una relación de uno a muchos con la tabla Matriz.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriz`
--

CREATE TABLE `matriz` (
  `id_Mat` int(11) NOT NULL COMMENT 'Código de La tabla Matriz.',
  `id_Emp` int(11) DEFAULT NULL COMMENT 'Nit de la empresa.',
  `id_Proceso` int(11) DEFAULT NULL COMMENT 'Código del proceso y este campo tiene una relación de uno a muchos con la tabla Proceso.',
  `id_Tipo_Proceso` int(11) DEFAULT NULL COMMENT 'Código del tipo de proceso.',
  `id_Actividad` int(11) DEFAULT NULL COMMENT 'Código de la actividad.este campo tiene una relación de uno a muchos con la tabla Actividad.',
  `Fecha_Mat` date NOT NULL COMMENT 'Fecha del día que se realizo la matriz.',
  `id_Asp_Amb` int(11) DEFAULT NULL COMMENT 'Código del Aspecto_ Ambiental',
  `id_Imp_Amb` int(11) DEFAULT NULL COMMENT 'Código del Impacto_Ambiental y la relación de uno a muchos con la tabla Impacto_Ambiental.',
  `id_Area_Incind` int(11) DEFAULT NULL COMMENT 'Código del Area de Incidencia.',
  `id_Doc_Legal` int(11) DEFAULT NULL COMMENT 'Código del Documento legal. y relación de uno a muchos con la tabla  Documento_Legal.',
  `Factor_Imp_Mat` varchar(45) NOT NULL COMMENT 'Factor impacto.',
  `Real_Potencial_Mat` varchar(45) NOT NULL COMMENT ' campo Real/potencial.',
  `Caracter_Natural_Mat` varchar(45) NOT NULL COMMENT 'Campo Caracter o natural.',
  `Frec_Prob_Mat` int(11) NOT NULL COMMENT 'Campo Frecuencia/Probabilidad.',
  `Intensidad_Mat` int(11) NOT NULL COMMENT 'Campo Intensidad.',
  `Extension_Mat` int(11) NOT NULL COMMENT 'Campo Extension.',
  `Persistencia_Mat` int(11) NOT NULL COMMENT 'Campo persistencia de la matriz.',
  `Sensibilidad_Mat` int(11) NOT NULL COMMENT 'Campo Sensibilidad.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE `proceso` (
  `id_Proceso` int(11) NOT NULL COMMENT 'Llave primaria y código de la tabla proceso.',
  `fk_Tipo_Proceso` int(11) DEFAULT NULL COMMENT 'Llave foranea y relación de uno a muchos con la la tabla Tipo_Proceso.los tipos de procesos son ( Misionales, Soporte, Estrategicos).',
  `Nom_Proceso` varchar(45) NOT NULL COMMENT 'Nombre del proceso.',
  `Fecha_Proceso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha del Proceso.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_ambiental`
--

CREATE TABLE `programa_ambiental` (
  `id_Pro_Amb` int(11) NOT NULL COMMENT 'Código de la tabla Programa_Ambiental y llave primaria',
  `id_Emp` int(11) DEFAULT NULL COMMENT 'Llave foranea y la relación de uno a muchos con la tabla empresa.',
  `Introd_Pro_Amb` longtext NOT NULL COMMENT 'Campo de la introducción del programa ambiental.',
  `Obj_Pro_Amb` varchar(255) NOT NULL COMMENT 'Objetivo del programa ambiental.',
  `Meta_Pro_Amb` varchar(255) NOT NULL COMMENT 'Meta del Programa Ambiental.',
  `Unid_Medida_Pro_Amb` varchar(45) NOT NULL COMMENT 'Unidad de medida relacionada con  la meta ( kg, gr, lb o otros).',
  `Indicador_Pro_Amb` varchar(255) NOT NULL COMMENT 'Indicador del programa ambiental.',
  `Fecha_Pro_Amb` date NOT NULL COMMENT 'Fecha del día que se realizo el programa ambiental.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_asp_amb_ident`
--

CREATE TABLE `registro_asp_amb_ident` (
  `id_Reg_Asp_Amb_Ident` int(11) NOT NULL COMMENT 'Codigo de la tabla Registro_Asp_Amb_Ident  (Registro de Aspectos Ambientales  Identificados). y llave primaria.',
  `id_Emp` int(11) DEFAULT NULL COMMENT 'Nit Empresa.',
  `id_Matriz` int(11) DEFAULT NULL COMMENT 'Código de la matriz y este campo tiene una relación de uno a muchos con la tabla Matriz.',
  `id_Asp_Amb` int(11) DEFAULT NULL COMMENT 'Codigo Aspecto Ambiental.',
  `id_Proceso` int(11) DEFAULT NULL COMMENT 'Codigo del proceso',
  `id_Actividad` int(11) DEFAULT NULL COMMENT 'Codigo de la actividad.',
  `id_Area_Inc` int(11) DEFAULT NULL COMMENT 'Codigo del Area de Incidencia.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_seguimiento_amb`
--

CREATE TABLE `registro_seguimiento_amb` (
  `id_Reg_Seg_Amb` int(11) NOT NULL,
  `id_Pro_Amb` int(11) DEFAULT NULL,
  `fecha_Reg_Seg_Amb` date DEFAULT NULL,
  `Cant_Reg_Seg_Amb` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_aspe_imp_amb_asoc_procesos`
--

CREATE TABLE `reg_aspe_imp_amb_asoc_procesos` (
  `id_Reg_Aspe_Imp_Proc` int(11) NOT NULL COMMENT 'Código de la tabla Reg_Aspe_Imp_Amb_Asoc_Procesos (REGISTRO DE ASPECTOS AMBIENTALES E IMPACTOS ASOCIADOS DE LOS PROCESOS). Y llave primaria.',
  `id_Emp` int(11) DEFAULT NULL COMMENT 'Nit de la empresa.',
  `id_Mat` int(11) DEFAULT NULL COMMENT 'Código de la matriz y este campo posee una relación de uno a muchos con la tabla Matriz.',
  `id_Asp_Amb` int(11) DEFAULT NULL COMMENT 'Código de la tabla Aspectos_Ambientales.',
  `id_Imp_Amb` int(11) DEFAULT NULL COMMENT 'Código de la tabla Impacto_Ambiental.',
  `id_Area_Incind` int(11) DEFAULT NULL COMMENT 'Código de la tabla de Area_Incidencia.',
  `Valor_Prom_Imp` int(11) NOT NULL COMMENT 'Valor promedio de importancia IM.',
  `Asignac_Prioridad` varchar(45) NOT NULL COMMENT 'Asignación de prioridad.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_asp_imp_asoc_organizacion`
--

CREATE TABLE `reg_asp_imp_asoc_organizacion` (
  `id_Reg_Asp_Organiz` int(11) NOT NULL COMMENT 'Código de la tabla   Reg_Asp_Imp_Asoc_Organizacion (REGISTRO CONSOLIDADO DE ASPECTOS AMBEINTALES E IMPACTOS ASOCIADOS DE LA ORGANIZACIÓN ). Y llave primaria.',
  `id_Emp` int(11) DEFAULT NULL COMMENT 'Nit de la empresa.',
  `id_Mat` int(11) DEFAULT NULL COMMENT 'Código de la tabla Matriz y este campo posee una relación de un a muchos con la tabla Matriz.',
  `id_Asp_Amb` int(11) DEFAULT NULL COMMENT 'Código de la tabla Aspectos_Ambientales',
  `id_Imp_Amb` int(11) DEFAULT NULL COMMENT 'Código de la tabla Impacto_Ambiental.',
  `id_Proceso` int(11) DEFAULT NULL COMMENT 'Código de la tabla Proceso.',
  `id_Actividad` int(11) DEFAULT NULL COMMENT 'Código de la tabla Actividad',
  `id_Area_Incind` int(11) DEFAULT NULL COMMENT 'Código de la tabla Area_Incidencia.',
  `Valor_Prom_Imp_Org` int(11) NOT NULL COMMENT 'VALOR PROMEDIO\nDE IMPORTANCIA\nIM.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_requisito_legal_reglamentario`
--

CREATE TABLE `reg_requisito_legal_reglamentario` (
  `id_Reg_Req_Legal_Regl` int(11) NOT NULL COMMENT 'Código de la tabla Reg_Requisito_Legal_Reglamentario (REGISTRO DE REQUISITOS LEGALES  REGLAMENTARIOS Y DE OTRO TIPO APLICABLE) y llave primaria.',
  `id_Emp` int(11) DEFAULT NULL COMMENT 'Nit de la empresa',
  `id_Mat` int(11) DEFAULT NULL COMMENT 'Código de la matriz y este campo posee una relación de uno a muchos con la tabla Matriz. llave foranea.',
  `id_Asp_Amb` int(11) DEFAULT NULL COMMENT 'Código de aspecto ambiental.',
  `id_Actividad` int(11) DEFAULT NULL COMMENT 'Código de la  tabla Actividad.',
  `id_Proceso` int(11) DEFAULT NULL COMMENT 'Código de la tabla Proceso.',
  `id_Area_Incid` int(11) DEFAULT NULL COMMENT 'Código de la tabla Area_Incidencia.',
  `id_Doc_Legal` int(11) DEFAULT NULL COMMENT 'Código de la tabla Documento_Legal',
  `Num_Art_Reg_Req_Legal` varchar(45) NOT NULL COMMENT 'Número del articulo.',
  `Req_Reg_Req_Legal` longtext NOT NULL COMMENT 'Requisitos. ( Requisito de la empresa respecto al documento legal).',
  `Cump_Si_Reg_Req_Legal` varchar(45) NOT NULL COMMENT 'Cumplimiento ( Si o No).',
  `Cump_No_Reg_Req_Legal` varchar(45) NOT NULL COMMENT 'Cumplimiento ( Si o No).',
  `Observacion_Reg_Req_Legal` longtext NOT NULL COMMENT 'Observaciones ( Descripción sobre el documento legal).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_Rol` int(11) NOT NULL COMMENT 'Código  y llave primaria de la tabla Roles,  este campo corresponde a  los tipos de roles del sistema INSPAT (Lider TGA, TGA, Administrador).',
  `Descrip_Rol` varchar(255) DEFAULT NULL COMMENT 'Una breve descripción del tipo de rol.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_Rol`, `Descrip_Rol`) VALUES
(1, 'TGA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `id_Salida` int(11) NOT NULL COMMENT 'Código de la tabla Salida y llave primaria.',
  `Nom_Salida` varchar(255) NOT NULL COMMENT 'Nombre de la salida.',
  `Cant_Salida` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `situacion_lista_cheq`
--

CREATE TABLE `situacion_lista_cheq` (
  `id_Situac_Lista_Cheq` int(11) NOT NULL COMMENT 'Código de la tabla situación de la lista de chequeo y llave primaria.',
  `id_Num_Inspecc` int(11) DEFAULT NULL COMMENT 'Código del numero Inspección, este campo posee una relación de uno a muchos con la tabla  (Lista_Cheq).',
  `id_Tipo_Lista` int(11) DEFAULT NULL COMMENT 'Código del tipo de lista.',
  `id_Tipo_Est` int(11) DEFAULT NULL COMMENT 'Código del tipo de estado.',
  `id_Est_Esperado` int(11) DEFAULT NULL COMMENT 'Código del estado esperado.',
  `Situacion_Lista_Cheqcol` varchar(45) DEFAULT NULL,
  `des_situacion` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_estado`
--

CREATE TABLE `tipo_estado` (
  `id_Tipo_Est` int(11) NOT NULL COMMENT 'Código y llave primaria de la tabla Tipo_Estado',
  `id_Tipo_Lista_Cheq` int(11) DEFAULT NULL COMMENT 'Código de la tabla Tipo_Lista_Cheq, este campo tiene una relación de uno a muchos con la tabla Tipo_Lista_Cheq.',
  `Nom_Tipo_Est` varchar(255) NOT NULL COMMENT 'Nombre del tipo del estado ( Ejemplo: Locales,  Suelos y pasillos, Almacenaje .. Etc).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_estado`
--

INSERT INTO `tipo_estado` (`id_Tipo_Est`, `id_Tipo_Lista_Cheq`, `Nom_Tipo_Est`) VALUES
(1, 1, 'Locales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_lista_cheq`
--

CREATE TABLE `tipo_lista_cheq` (
  `id_Tipo_Lista_Cheq` int(11) NOT NULL COMMENT 'Código de la tabla Tipo_Lista_Cheq (Tipo de Lista\n de Chequeo). Y llave primaria.',
  `Nom_Tipo_Lista_Cheq` varchar(45) NOT NULL COMMENT 'Nombre del tipo de lista ( Lista de chequeo para la supervisión del orden y limpieza, lista de chequeo para la supervisión de la gestión de los residuos, lista de chequeo para la supervisión de las SQP).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_lista_cheq`
--

INSERT INTO `tipo_lista_cheq` (`id_Tipo_Lista_Cheq`, `Nom_Tipo_Lista_Cheq`) VALUES
(1, 'orden y limpieza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_proceso`
--

CREATE TABLE `tipo_proceso` (
  `id_Tipo_Proceso` int(11) NOT NULL COMMENT 'Código del tipo  proceso.',
  `Nom_Tipo_proceso` varchar(45) NOT NULL COMMENT 'Nombre del tipo proceso.\n( Estrategico, misionales,Soporte ).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_Usu` int(11) NOT NULL COMMENT 'El número de identificación del usuario y la llave primaria de la tabla  Usuario',
  `Roles_id_Rol` int(11) NOT NULL COMMENT ' llave foranea.  este campo corresponde a  los tipos de roles del sistema INSPAT (Lider TGA, TGA, Administrador). Este campo se relaciona con la tabla Roles de uno a muchos.\n',
  `Nom_Usu` varchar(45) NOT NULL COMMENT 'Nombre del Usuario.',
  `Ape_Usu` varchar(45) NOT NULL COMMENT 'Apellido Usuario.',
  `Correo_Usu` varchar(45) NOT NULL COMMENT 'Correo electronico del usuario.',
  `Pass_Usu` varchar(45) NOT NULL COMMENT 'Contraseña del Usuario ',
  `Tipo_Doc_Usu` varchar(45) DEFAULT NULL,
  `Tel_Usu` int(11) NOT NULL COMMENT 'Número de telefono del Usuario.',
  `Ficha_Usu` varchar(45) NOT NULL COMMENT ' número de la Ficha Tecnica del programa  que esta realizando en el SENA.',
  `Estado_Usu` varchar(45) NOT NULL COMMENT 'Estado del Usuario ( Activo/Inactivo).',
  `foto_Usu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_Usu`, `Roles_id_Rol`, `Nom_Usu`, `Ape_Usu`, `Correo_Usu`, `Pass_Usu`, `Tipo_Doc_Usu`, `Tel_Usu`, `Ficha_Usu`, `Estado_Usu`, `foto_Usu`) VALUES
(1, 1, 'Nino', 'Gutierrez', 'Ninogutierrez2@gmail.com', 'nino1234', 'C.C.', 5782106, '902923', 'Activo', '1.jpg'),
(2, 1, 'Alberto', 'Garcia', 'Alberto@ads.com', 'alberto', 'C.c.', 12346, '65455', 'Pasivo', '2.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accion_programa_ambiental`
--
ALTER TABLE `accion_programa_ambiental`
  ADD PRIMARY KEY (`id_Acc_Pro_Amb`),
  ADD KEY `fk_Accion_Programa_Ambiental_Programa_Ambiental1_idx` (`id_Prog_Amb`);

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id_Actividad`),
  ADD KEY `fk_Actividad_Proceso1_idx` (`id_Proceso`),
  ADD KEY `fk_Actividad_Area_Incidencia1_idx` (`id_Area_Incid`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_Adm`);

--
-- Indices de la tabla `area_incidencia`
--
ALTER TABLE `area_incidencia`
  ADD PRIMARY KEY (`id_Area_Incid`);

--
-- Indices de la tabla `aspectos_ambientales`
--
ALTER TABLE `aspectos_ambientales`
  ADD PRIMARY KEY (`id_Asp_Amb`),
  ADD KEY `fk_Aspectos_Ambientales_Proceso1_idx` (`id_Proceso`);

--
-- Indices de la tabla `documento_legal`
--
ALTER TABLE `documento_legal`
  ADD PRIMARY KEY (`id_Doc_Legal`);

--
-- Indices de la tabla `doc_legal_aplicable`
--
ALTER TABLE `doc_legal_aplicable`
  ADD PRIMARY KEY (`id_Doc_Legal_Aplicable`),
  ADD KEY `fk_Doc_Legal_Aplicable_Documento_Legal1_idx` (`id_Doc_Legal`),
  ADD KEY `fk_Doc_Legal_Aplicable_Matriz1_idx` (`id_Mat`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_Emp`),
  ADD KEY `fk_Empresa_Usuario1_idx` (`fk_id_Usu`);

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`id_Entrada`);

--
-- Indices de la tabla `entrada_salida`
--
ALTER TABLE `entrada_salida`
  ADD PRIMARY KEY (`id_Entrada_Salida`),
  ADD KEY `fk_Entrada_Salida_Entrada1_idx` (`id_Entrada`),
  ADD KEY `fk_Entrada_Salida_Salida1_idx` (`id_Salida`),
  ADD KEY `fk_Entrada_Salida_Area_Incidencia1_idx` (`id_Area_Incid`);

--
-- Indices de la tabla `est_esperado`
--
ALTER TABLE `est_esperado`
  ADD PRIMARY KEY (`id_Est_Esperado`),
  ADD KEY `fk_Est_Esperado_Tipo_Estado1_idx` (`id_Tipo_Est`);

--
-- Indices de la tabla `impacto_ambiental`
--
ALTER TABLE `impacto_ambiental`
  ADD PRIMARY KEY (`id_Imp_Amb`),
  ADD KEY `fk_Impacto_Ambiental_Aspectos_Ambientales1_idx` (`id_Asp_Amb`);

--
-- Indices de la tabla `lista_cheq`
--
ALTER TABLE `lista_cheq`
  ADD PRIMARY KEY (`id_Num_Inspecc`),
  ADD KEY `fk_Lista_Cheq_Matriz1_idx` (`id_Mat`);

--
-- Indices de la tabla `matriz`
--
ALTER TABLE `matriz`
  ADD PRIMARY KEY (`id_Mat`),
  ADD KEY `fk_Matriz_Empresa1_idx` (`id_Emp`),
  ADD KEY `fk_Matriz_Impacto_Ambiental1_idx` (`id_Imp_Amb`),
  ADD KEY `fk_Matriz_Proceso1_idx` (`id_Proceso`),
  ADD KEY `fk_Matriz_Actividad1_idx` (`id_Actividad`),
  ADD KEY `fk_Matriz_Documento_Legal1_idx` (`id_Doc_Legal`);

--
-- Indices de la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD PRIMARY KEY (`id_Proceso`),
  ADD KEY `fk_Proceso_Tipo_Proceso1_idx` (`fk_Tipo_Proceso`);

--
-- Indices de la tabla `programa_ambiental`
--
ALTER TABLE `programa_ambiental`
  ADD PRIMARY KEY (`id_Pro_Amb`),
  ADD KEY `fk_Programa_Ambiental_Empresa1_idx` (`id_Emp`);

--
-- Indices de la tabla `registro_asp_amb_ident`
--
ALTER TABLE `registro_asp_amb_ident`
  ADD PRIMARY KEY (`id_Reg_Asp_Amb_Ident`),
  ADD KEY `fk_Registro_Asp_Amb_Ident_Matriz1_idx` (`id_Matriz`);

--
-- Indices de la tabla `registro_seguimiento_amb`
--
ALTER TABLE `registro_seguimiento_amb`
  ADD PRIMARY KEY (`id_Reg_Seg_Amb`),
  ADD KEY `fk_Registro_Seguimiento_Amb_Programa_Ambiental1_idx` (`id_Pro_Amb`);

--
-- Indices de la tabla `reg_aspe_imp_amb_asoc_procesos`
--
ALTER TABLE `reg_aspe_imp_amb_asoc_procesos`
  ADD PRIMARY KEY (`id_Reg_Aspe_Imp_Proc`),
  ADD KEY `fk_Reg_Aspe_Imp_Amb_Asoc_Procesos_Matriz1_idx` (`id_Mat`);

--
-- Indices de la tabla `reg_asp_imp_asoc_organizacion`
--
ALTER TABLE `reg_asp_imp_asoc_organizacion`
  ADD PRIMARY KEY (`id_Reg_Asp_Organiz`),
  ADD KEY `fk_Reg_Asp_Imp_Asoc_Organizacion_Matriz1_idx` (`id_Mat`);

--
-- Indices de la tabla `reg_requisito_legal_reglamentario`
--
ALTER TABLE `reg_requisito_legal_reglamentario`
  ADD PRIMARY KEY (`id_Reg_Req_Legal_Regl`),
  ADD KEY `fk_Reg_Requisito_Legal_Reglamentario_Matriz1_idx` (`id_Mat`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_Rol`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`id_Salida`);

--
-- Indices de la tabla `situacion_lista_cheq`
--
ALTER TABLE `situacion_lista_cheq`
  ADD PRIMARY KEY (`id_Situac_Lista_Cheq`),
  ADD KEY `fk_Situacion_Lista_Cheq_Est_Esperado1_idx` (`id_Est_Esperado`),
  ADD KEY `fk_Situacion_Lista_Cheq_Lista_Cheq1_idx` (`id_Num_Inspecc`);

--
-- Indices de la tabla `tipo_estado`
--
ALTER TABLE `tipo_estado`
  ADD PRIMARY KEY (`id_Tipo_Est`),
  ADD KEY `fk_Tipo_Estado_Tipo_Lista_Cheq1_idx` (`id_Tipo_Lista_Cheq`);

--
-- Indices de la tabla `tipo_lista_cheq`
--
ALTER TABLE `tipo_lista_cheq`
  ADD PRIMARY KEY (`id_Tipo_Lista_Cheq`);

--
-- Indices de la tabla `tipo_proceso`
--
ALTER TABLE `tipo_proceso`
  ADD PRIMARY KEY (`id_Tipo_Proceso`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_Usu`),
  ADD KEY `fk_Usuario_Roles_idx` (`Roles_id_Rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accion_programa_ambiental`
--
ALTER TABLE `accion_programa_ambiental`
  MODIFY `id_Acc_Pro_Amb` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria y código de la tabla Accion_Programa_Ambiental.';
--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id_Actividad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla Actividad y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_Adm` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `area_incidencia`
--
ALTER TABLE `area_incidencia`
  MODIFY `id_Area_Incid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Area_ Incidencia y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `aspectos_ambientales`
--
ALTER TABLE `aspectos_ambientales`
  MODIFY `id_Asp_Amb` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del Aspecto Ambiental';
--
-- AUTO_INCREMENT de la tabla `documento_legal`
--
ALTER TABLE `documento_legal`
  MODIFY `id_Doc_Legal` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del documento Legal y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `doc_legal_aplicable`
--
ALTER TABLE `doc_legal_aplicable`
  MODIFY `id_Doc_Legal_Aplicable` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CÓdigo de la tabla Doc_Legal_Aplicable ( Registro de documentos legales aplicables). y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_Emp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria y es el NIT de la empresa.', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `entrada`
--
ALTER TABLE `entrada`
  MODIFY `id_Entrada` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla Entrada y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `entrada_salida`
--
ALTER TABLE `entrada_salida`
  MODIFY `id_Entrada_Salida` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla Entrada_Salida (Registro de entradas y salidas) y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `est_esperado`
--
ALTER TABLE `est_esperado`
  MODIFY `id_Est_Esperado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla id_Est_Esperado (Estado Esperado) y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `impacto_ambiental`
--
ALTER TABLE `impacto_ambiental`
  MODIFY `id_Imp_Amb` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla Impacto_Ambiental y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `lista_cheq`
--
ALTER TABLE `lista_cheq`
  MODIFY `id_Num_Inspecc` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del número Inspeccion ( Número inspección lo asigna la empresa).';
--
-- AUTO_INCREMENT de la tabla `matriz`
--
ALTER TABLE `matriz`
  MODIFY `id_Mat` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de La tabla Matriz.';
--
-- AUTO_INCREMENT de la tabla `proceso`
--
ALTER TABLE `proceso`
  MODIFY `id_Proceso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria y código de la tabla proceso.';
--
-- AUTO_INCREMENT de la tabla `programa_ambiental`
--
ALTER TABLE `programa_ambiental`
  MODIFY `id_Pro_Amb` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla Programa_Ambiental y llave primaria';
--
-- AUTO_INCREMENT de la tabla `registro_asp_amb_ident`
--
ALTER TABLE `registro_asp_amb_ident`
  MODIFY `id_Reg_Asp_Amb_Ident` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la tabla Registro_Asp_Amb_Ident  (Registro de Aspectos Ambientales  Identificados). y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `registro_seguimiento_amb`
--
ALTER TABLE `registro_seguimiento_amb`
  MODIFY `id_Reg_Seg_Amb` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `reg_aspe_imp_amb_asoc_procesos`
--
ALTER TABLE `reg_aspe_imp_amb_asoc_procesos`
  MODIFY `id_Reg_Aspe_Imp_Proc` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla Reg_Aspe_Imp_Amb_Asoc_Procesos (REGISTRO DE ASPECTOS AMBIENTALES E IMPACTOS ASOCIADOS DE LOS PROCESOS). Y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `reg_asp_imp_asoc_organizacion`
--
ALTER TABLE `reg_asp_imp_asoc_organizacion`
  MODIFY `id_Reg_Asp_Organiz` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla   Reg_Asp_Imp_Asoc_Organizacion (REGISTRO CONSOLIDADO DE ASPECTOS AMBEINTALES E IMPACTOS ASOCIADOS DE LA ORGANIZACIÓN ). Y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `reg_requisito_legal_reglamentario`
--
ALTER TABLE `reg_requisito_legal_reglamentario`
  MODIFY `id_Reg_Req_Legal_Regl` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla Reg_Requisito_Legal_Reglamentario (REGISTRO DE REQUISITOS LEGALES  REGLAMENTARIOS Y DE OTRO TIPO APLICABLE) y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_Rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código  y llave primaria de la tabla Roles,  este campo corresponde a  los tipos de roles del sistema INSPAT (Lider TGA, TGA, Administrador).', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `id_Salida` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla Salida y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `situacion_lista_cheq`
--
ALTER TABLE `situacion_lista_cheq`
  MODIFY `id_Situac_Lista_Cheq` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla situación de la lista de chequeo y llave primaria.';
--
-- AUTO_INCREMENT de la tabla `tipo_estado`
--
ALTER TABLE `tipo_estado`
  MODIFY `id_Tipo_Est` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código y llave primaria de la tabla Tipo_Estado', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_lista_cheq`
--
ALTER TABLE `tipo_lista_cheq`
  MODIFY `id_Tipo_Lista_Cheq` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la tabla Tipo_Lista_Cheq (Tipo de Lista\n de Chequeo). Y llave primaria.', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_proceso`
--
ALTER TABLE `tipo_proceso`
  MODIFY `id_Tipo_Proceso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del tipo  proceso.';
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_Usu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'El número de identificación del usuario y la llave primaria de la tabla  Usuario', AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accion_programa_ambiental`
--
ALTER TABLE `accion_programa_ambiental`
  ADD CONSTRAINT `fk_Accion_Programa_Ambiental_Programa_Ambiental1` FOREIGN KEY (`id_Prog_Amb`) REFERENCES `programa_ambiental` (`id_Pro_Amb`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `fk_Actividad_Area_Incidencia1` FOREIGN KEY (`id_Area_Incid`) REFERENCES `area_incidencia` (`id_Area_Incid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Actividad_Proceso1` FOREIGN KEY (`id_Proceso`) REFERENCES `proceso` (`id_Proceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `aspectos_ambientales`
--
ALTER TABLE `aspectos_ambientales`
  ADD CONSTRAINT `fk_Aspectos_Ambientales_Proceso1` FOREIGN KEY (`id_Proceso`) REFERENCES `proceso` (`id_Proceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `doc_legal_aplicable`
--
ALTER TABLE `doc_legal_aplicable`
  ADD CONSTRAINT `fk_Doc_Legal_Aplicable_Documento_Legal1` FOREIGN KEY (`id_Doc_Legal`) REFERENCES `documento_legal` (`id_Doc_Legal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Doc_Legal_Aplicable_Matriz1` FOREIGN KEY (`id_Mat`) REFERENCES `matriz` (`id_Mat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_Empresa_Usuario1` FOREIGN KEY (`fk_id_Usu`) REFERENCES `usuario` (`id_Usu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entrada_salida`
--
ALTER TABLE `entrada_salida`
  ADD CONSTRAINT `fk_Entrada_Salida_Area_Incidencia1` FOREIGN KEY (`id_Area_Incid`) REFERENCES `area_incidencia` (`id_Area_Incid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Entrada_Salida_Entrada1` FOREIGN KEY (`id_Entrada`) REFERENCES `entrada` (`id_Entrada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Entrada_Salida_Salida1` FOREIGN KEY (`id_Salida`) REFERENCES `salida` (`id_Salida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `est_esperado`
--
ALTER TABLE `est_esperado`
  ADD CONSTRAINT `fk_Est_Esperado_Tipo_Estado1` FOREIGN KEY (`id_Tipo_Est`) REFERENCES `tipo_estado` (`id_Tipo_Est`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `impacto_ambiental`
--
ALTER TABLE `impacto_ambiental`
  ADD CONSTRAINT `fk_Impacto_Ambiental_Aspectos_Ambientales1` FOREIGN KEY (`id_Asp_Amb`) REFERENCES `aspectos_ambientales` (`id_Asp_Amb`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lista_cheq`
--
ALTER TABLE `lista_cheq`
  ADD CONSTRAINT `fk_Lista_Cheq_Matriz1` FOREIGN KEY (`id_Mat`) REFERENCES `matriz` (`id_Mat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `matriz`
--
ALTER TABLE `matriz`
  ADD CONSTRAINT `fk_Matriz_Actividad1` FOREIGN KEY (`id_Actividad`) REFERENCES `actividad` (`id_Actividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Matriz_Documento_Legal1` FOREIGN KEY (`id_Doc_Legal`) REFERENCES `documento_legal` (`id_Doc_Legal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Matriz_Empresa1` FOREIGN KEY (`id_Emp`) REFERENCES `empresa` (`id_Emp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Matriz_Impacto_Ambiental1` FOREIGN KEY (`id_Imp_Amb`) REFERENCES `impacto_ambiental` (`id_Imp_Amb`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Matriz_Proceso1` FOREIGN KEY (`id_Proceso`) REFERENCES `proceso` (`id_Proceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD CONSTRAINT `fk_Proceso_Tipo_Proceso1` FOREIGN KEY (`fk_Tipo_Proceso`) REFERENCES `tipo_proceso` (`id_Tipo_Proceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `programa_ambiental`
--
ALTER TABLE `programa_ambiental`
  ADD CONSTRAINT `fk_Programa_Ambiental_Empresa1` FOREIGN KEY (`id_Emp`) REFERENCES `empresa` (`id_Emp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro_asp_amb_ident`
--
ALTER TABLE `registro_asp_amb_ident`
  ADD CONSTRAINT `fk_Registro_Asp_Amb_Ident_Matriz1` FOREIGN KEY (`id_Matriz`) REFERENCES `matriz` (`id_Mat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro_seguimiento_amb`
--
ALTER TABLE `registro_seguimiento_amb`
  ADD CONSTRAINT `fk_Registro_Seguimiento_Amb_Programa_Ambiental1` FOREIGN KEY (`id_Pro_Amb`) REFERENCES `programa_ambiental` (`id_Pro_Amb`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reg_aspe_imp_amb_asoc_procesos`
--
ALTER TABLE `reg_aspe_imp_amb_asoc_procesos`
  ADD CONSTRAINT `fk_Reg_Aspe_Imp_Amb_Asoc_Procesos_Matriz1` FOREIGN KEY (`id_Mat`) REFERENCES `matriz` (`id_Mat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reg_asp_imp_asoc_organizacion`
--
ALTER TABLE `reg_asp_imp_asoc_organizacion`
  ADD CONSTRAINT `fk_Reg_Asp_Imp_Asoc_Organizacion_Matriz1` FOREIGN KEY (`id_Mat`) REFERENCES `matriz` (`id_Mat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reg_requisito_legal_reglamentario`
--
ALTER TABLE `reg_requisito_legal_reglamentario`
  ADD CONSTRAINT `fk_Reg_Requisito_Legal_Reglamentario_Matriz1` FOREIGN KEY (`id_Mat`) REFERENCES `matriz` (`id_Mat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `situacion_lista_cheq`
--
ALTER TABLE `situacion_lista_cheq`
  ADD CONSTRAINT `fk_Situacion_Lista_Cheq_Est_Esperado1` FOREIGN KEY (`id_Est_Esperado`) REFERENCES `est_esperado` (`id_Est_Esperado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Situacion_Lista_Cheq_Lista_Cheq1` FOREIGN KEY (`id_Num_Inspecc`) REFERENCES `lista_cheq` (`id_Num_Inspecc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_estado`
--
ALTER TABLE `tipo_estado`
  ADD CONSTRAINT `fk_Tipo_Estado_Tipo_Lista_Cheq1` FOREIGN KEY (`id_Tipo_Lista_Cheq`) REFERENCES `tipo_lista_cheq` (`id_Tipo_Lista_Cheq`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Roles` FOREIGN KEY (`Roles_id_Rol`) REFERENCES `roles` (`id_Rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
