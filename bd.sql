
create database asesoramiento_ml;

use asesoramiento_ml;


CREATE TABLE `tb_menu` (
  `cod_men` int(11) NOT NULL AUTO_INCREMENT,
  `des_men` varchar(50) DEFAULT NULL,
  `url_men` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`cod_men`)
);


CREATE TABLE `tb_usuario` (
  `cod_usu` int(11) NOT NULL AUTO_INCREMENT,
  `log_usu` varchar(15) DEFAULT NULL,
  `pas_usu` varchar(15) DEFAULT NULL,
  `nom_usu` varchar(30) DEFAULT NULL,
  `ape_usu` varchar(50) DEFAULT NULL,
  `eda_usu` smallint(6) DEFAULT NULL,
  `est_usu` char(1) DEFAULT NULL,
  dni_usu char(8),
  tel_susu char(9),
  depa_usu varchar(50),
  cargo_usu varchar(50),
  PRIMARY KEY (`cod_usu`)
);


CREATE TABLE `tb_acceso` (
  `cod_men` int(11) NOT NULL,
  `cod_usu` int(11) NOT NULL,
  PRIMARY KEY (`cod_men`,`cod_usu`),
  KEY `cod_usu` (`cod_usu`),
  CONSTRAINT `tb_acceso_ibfk_1` FOREIGN KEY (`cod_men`) REFERENCES `tb_menu` (`cod_men`),
  CONSTRAINT `tb_acceso_ibfk_2` FOREIGN KEY (`cod_usu`) REFERENCES `tb_usuario` (`cod_usu`)
);

create table tb_estado
(
	cod_est int primary key,
    nom_est varchar(20)
);

insert into tb_estado values (1, 'Emitido');
insert into tb_estado values (2, 'Aprobado');
insert into tb_estado values (3, 'Rechazado');

CREATE TABLE `tb_requerimiento` (
  `cod_req` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_req` varchar(200) DEFAULT NULL,
  `origen_req` varchar(200) DEFAULT NULL,
  `area_req` varchar(25) DEFAULT NULL,
  `criticidad_req` varchar(25) DEFAULT NULL,
  cod_est int,
  fec_req timestamp default current_timestamp,#fecha y hora del sistema cuando se envia a la BD
	cod_usu int(11) NOT NULL,
  PRIMARY KEY (`cod_req`),
  CONSTRAINT `tb_requerimiento_ibfk_1` FOREIGN KEY (cod_est) REFERENCES `tb_estado` (cod_est),
  CONSTRAINT `tb_requerimiento_ibfk_2` FOREIGN KEY (cod_usu) REFERENCES `tb_usuario` (cod_usu)
);
############################# añadi llave foranea
CREATE TABLE `tb_informe` (
  `cod_inf` int(11) NOT NULL AUTO_INCREMENT,
  `introduccion_inf` varchar(200) DEFAULT NULL,
  `antecedentes_inf` varchar(200) DEFAULT NULL,
  `analisis_inf` varchar(200) DEFAULT NULL,
  `conclusiones_inf` varchar(200) DEFAULT NULL,
  `recomendaciones_inf` varchar(200) DEFAULT NULL,
  cod_est int,
  fec_info_tec timestamp default current_timestamp,#fecha y hora del sistema cuando se envia a la BD
  cod_usu int(11) NOT NULL,
  cod_req int(11) NOT NULL,
  PRIMARY KEY (`cod_inf`),
  CONSTRAINT `tb_informe_ibfk_1` FOREIGN KEY (cod_est) REFERENCES `tb_estado` (cod_est),
  CONSTRAINT `tb_informe_ibfk_2` FOREIGN KEY (cod_usu) REFERENCES `tb_usuario` (cod_usu),
  CONSTRAINT `tb_informe_ibfk_3` FOREIGN KEY (cod_req) REFERENCES `tb_requerimiento` (cod_req)
);

CREATE TABLE `tb_proveedor` (
  ruc_prov bigint(11) NOT NULL,
  `nom_prov` varchar(25) DEFAULT NULL,
  `ape_prov` varchar(25) DEFAULT NULL,
  `tel_prov` varchar(9) DEFAULT NULL,
  `ema_prov` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ruc_prov`)
);


######################### añadi llave foranea
CREATE TABLE `tb_cotizacion` (
  cod_coti int(11) NOT NULL,
  ruc_prov bigint(11) DEFAULT NULL,
  cod_usu int(11) DEFAULT NULL,
  monto double DEFAULT NULL,
  cod_est int,
  fec_coti timestamp default current_timestamp,#fecha y hora del sistema cuando se envia a la BD
  cod_inf int(11) NOT NULL,
  PRIMARY KEY (cod_coti),
  CONSTRAINT `tb_cotizacion_ibfk_1` FOREIGN KEY (cod_usu) REFERENCES `tb_usuario` (cod_usu),
  CONSTRAINT `tb_cotizacion_ibfk_2` FOREIGN KEY (cod_inf) REFERENCES `tb_informe` (cod_inf),
  CONSTRAINT `tb_cotizacion_ibfk_3` FOREIGN KEY (cod_est) REFERENCES `tb_estado` (cod_est)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

############################# cambio de nombre fec
CREATE TABLE tb_detalle_coti (
  cod_coti int(11) DEFAULT NULL,
  cod_soft int(11) DEFAULT NULL,
  cant int(11) DEFAULT NULL,
  fec_det_coti timestamp default current_timestamp#fecha y hora del sistema cuando se envia a la BD
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

########################## quite mediumblob
create table tb_sol_certificado
(
	cod_sol_cert int primary key auto_increment,
    obj_sol_cert varchar(200),
    monto_sol_cert decimal(8,2),
    area_sol_cert varchar(50),
    fec_sol_cert timestamp default current_timestamp,#fecha y hora del sistema cuando se envia a la BD
    cod_est int,
    cod_usu int(11) NOT NULL,
    cod_coti int(11) NOT NULL,
    CONSTRAINT `tb_sol_certificado_ibfk_1` FOREIGN KEY (cod_est) REFERENCES `tb_estado` (cod_est),
    CONSTRAINT `tb_sol_certificado_ibfk_2` FOREIGN KEY (cod_usu) REFERENCES `tb_usuario` (cod_usu),
    CONSTRAINT `tb_sol_certificado_ibfk_3` FOREIGN KEY (cod_coti) REFERENCES `tb_cotizacion` (cod_coti)
);

###################### cambio nombre fec
create table tb_certificado
(
	cod_cert int primary key auto_increment,
    fec_sub_cert date,#fecha y hora de la subida del documento
    url_cert varchar(250),
    nom_cert varchar(50),
    fec_cert timestamp default current_timestamp,#fecha y hora del sistema cuando se envia a la BD
    cod_est int,
    cod_usu int(11) NOT NULL,
    cod_sol_cert int,
    CONSTRAINT `tb_certificado_ibfk_1` FOREIGN KEY (cod_est) REFERENCES `tb_estado` (cod_est),
    CONSTRAINT `tb_certificado_ibfk_2` FOREIGN KEY (cod_usu) REFERENCES `tb_usuario` (cod_usu),
     CONSTRAINT `tb_certificado_ibfk_3` FOREIGN KEY (cod_sol_cert) REFERENCES `tb_sol_certificado` (cod_sol_cert)
);

CREATE TABLE tb_software (
  cod_soft int(11) NOT NULL AUTO_INCREMENT,
  nom_soft varchar(35) DEFAULT NULL,
  pre_soft double DEFAULT NULL,
  fec_soft timestamp default current_timestamp,#fecha y hora del sistema cuando se envia a la BD
  cod_cert int,
  PRIMARY KEY (cod_soft),
    CONSTRAINT `tb_software_ibfk_1` FOREIGN KEY (cod_cert) REFERENCES `tb_certificado` (cod_cert)
);
#ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#########################3 añadido codigo usuario
create table tb_informe_instalacion
(
	cod_info_insta int primary key auto_increment,
    lug_insta varchar(150),
    area_lab varchar(150),
    fec_insta date,#fecha del momento de la instalacion
    hora_insta time,#hora del momento de la instalacion
    fec_info_insta timestamp default current_timestamp,#fecha y hora del sistema cuando se envia a la BD
	cod_est int,
	cod_usu int(11) NOT NULL,
    cod_soft int(11) NOT NULL,
    CONSTRAINT `tb_informe_instalacion_ibfk_1` FOREIGN KEY (cod_est) REFERENCES `tb_estado` (cod_est),
    CONSTRAINT `tb_informe_instalacion_ibfk_2` FOREIGN KEY (cod_usu) REFERENCES `tb_usuario` (cod_usu),
    CONSTRAINT `tb_informe_instalacion_ibfk_3` FOREIGN KEY (cod_soft) REFERENCES `tb_software` (cod_soft)
);

#Insertando usuarios
insert into tb_usuario values (null, 'enc001', 'enc001', 'Carlos', 'Gomez', 55, 1, 87654321, 987654321, 'Producción', 'Encargado');
insert into tb_usuario values (null, 'tec001', 'tec001', 'Angelo', 'Abregu', 44, 1, 87234322, 984654333, 'IT', 'Tecnico Especialista');
insert into tb_usuario values (null, 'sub001', 'sub001', 'Lulio', 'Herrera', 33, 1, 57544325, 945624536, 'IT', 'Subgerente');
insert into tb_usuario values (null, 'log001', 'log001', 'Ronald', 'Huaman', 22, 1, 67534528, 945328143, 'SLCP', 'Asistente');
insert into tb_usuario values (null, 'pre001', 'pre001', 'Ronald', 'Chinchay', 44, 1, 47534327, 985224627, 'GPPDC', 'Gerente');

#menus
insert into tb_menu values (null, 'Generar Solicitud de Requerimiento de Software', 'requerimiento.jsp');
insert into tb_menu values (null, 'Buscar Informe de Instalación', 'listaInformeInstalacion.jsp');
insert into tb_menu values (null, 'Generar Informe Técnico', 'listaRequerimiento.jsp');
insert into tb_menu values (null, 'Generar Informe de Instalación', 'listaSoftware.jsp');
insert into tb_menu values (null, 'Aprobar Informe Técnico Registrado', 'listaInformeTecnico.jsp');
insert into tb_menu values (null, 'Registrar Cotización', 'listaInformeTecnico.jsp');
insert into tb_menu values (null, 'Generar Solicitud de Certificación Presupuestal', 'listaCotizacion.jsp');#falta crear
insert into tb_menu values (null, 'Registrar Software Adquirido', 'listaCertificado.jsp');#f alta crear
insert into tb_menu values (null, 'Registrar Certificado Presupuestal', 'listaSolicitudCertificado.jsp');#falta crear
insert into tb_menu values (null, 'Generar Solicitud de Certificado', 'SolicitudCertificado.jsp');#creado hoy22/07/20 16:09

#accesos
insert into tb_acceso values (1,1);
insert into tb_acceso values (2,1);
insert into tb_acceso values (3,2);
insert into tb_acceso values (4,2);
insert into tb_acceso values (5,3);
insert into tb_acceso values (6,4);
insert into tb_acceso values (7,4);
insert into tb_acceso values (8,4);
insert into tb_acceso values (9,5);
#insert into tb_acceso values (11,4);


#INSERT INTO `asesoramiento_ml`.`tb_menu` (`cod_men`, `des_men`, `url_men`) VALUES ('10', 'Registrar Cotización', 'listaInformeTecnicoLog.jsp');

UPDATE `asesoramiento_ml`.`tb_acceso` SET `cod_men`='10' WHERE `cod_men`='8' and`cod_usu`='4';
UPDATE `asesoramiento_ml`.`tb_acceso` SET `cod_men`='8' WHERE `cod_men`='7' and`cod_usu`='4';
UPDATE `asesoramiento_ml`.`tb_acceso` SET `cod_men`='7' WHERE `cod_men`='6' and`cod_usu`='4';

UPDATE `asesoramiento_ml`.`tb_menu` SET `url_men`='listarCotizacion.jsp' WHERE `cod_men`='7';





#Registros necesarios para el funcionamiento de la pagina
INSERT INTO `asesoramiento_ml`.`tb_requerimiento` (`descripcion_req`, `origen_req`, `area_req`, `criticidad_req`, `cod_est`, `cod_usu`) VALUES ('assa', 'asda', 'asda', 'asa', '1', '1');
INSERT INTO `asesoramiento_ml`.`tb_informe` (`introduccion_inf`, `antecedentes_inf`, `analisis_inf`, `conclusiones_inf`, `recomendaciones_inf`, `cod_est`, `cod_usu`, `cod_req`) VALUES ('asd', 'asd', 'asd', 'asd', 'asd', '1', '2', '1');
INSERT INTO `asesoramiento_ml`.`tb_proveedor` (`ruc_prov`, `nom_prov`, `ape_prov`, `tel_prov`, `ema_prov`) VALUES ('1232132', 'asdasdads', 'asdas', '12321', 'asdsad');
INSERT INTO `asesoramiento_ml`.`tb_cotizacion` (`cod_coti`, `ruc_prov`, `cod_usu`, `monto`, `cod_est`, `cod_inf`) VALUES ('121', '12312', '4', '122', '1', '1');
INSERT INTO `asesoramiento_ml`.`tb_sol_certificado` (`obj_sol_cert`, `monto_sol_cert`, `area_sol_cert`, `cod_est`, `cod_usu`, `cod_coti`) VALUES ('asdsad', '212', 'asdas', '1', '4', '121');
INSERT INTO `asesoramiento_ml`.`tb_certificado` (`url_cert`, `nom_cert`, `cod_est`, `cod_usu`, `cod_sol_cert`) VALUES ('asdsad', 'sadasd', '1', '1', '1');
INSERT INTO `asesoramiento_ml`.`tb_software` (`nom_soft`, `pre_soft`, `cod_cert`) VALUES ('asdasd', '123', '1');










