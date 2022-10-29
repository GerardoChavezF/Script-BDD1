
-- -----------------------------------------------------
-- Table departamento
-- -----------------------------------------------------
CREATE TABLE  departamento (
  id_departamento NUMBER NOT NULL,
  departamento VARCHAR2(45) NULL,
  PRIMARY KEY (id_departamento));


-- -----------------------------------------------------
-- Table municipio
-- -----------------------------------------------------
CREATE TABLE  municipio (
  id_municipio NUMBER NOT NULL,
  municipio VARCHAR2(45) NULL,
  departamento_id_departamento NUMBER NOT NULL,
  PRIMARY KEY (id_municipio),
  CONSTRAINT fk_municipio_departamento1
    FOREIGN KEY (departamento_id_departamento)
    REFERENCES departamento (id_departamento));


-- -----------------------------------------------------
-- Table direccion
-- -----------------------------------------------------
CREATE TABLE  direccion (
  id_direccion NUMBER NOT NULL,
  calle VARCHAR2(45) NULL,
  avenida VARCHAR2(45) NULL,
  otros VARCHAR2(45) NULL,
  municipio_id_municipio NUMBER NOT NULL,
  PRIMARY KEY (id_direccion),
  CONSTRAINT fk_direccion_municipio1
    FOREIGN KEY (municipio_id_municipio)
    REFERENCES municipio (id_municipio));


-- -----------------------------------------------------
-- Table sede
-- -----------------------------------------------------
CREATE TABLE  sede (
  id_sede NUMBER NOT NULL,
  sede VARCHAR2(45) NULL,
  direccion_id_direccion NUMBER NOT NULL,
  PRIMARY KEY (id_sede),
  CONSTRAINT fk_sede_direccion1
    FOREIGN KEY (direccion_id_direccion)
    REFERENCES direccion (id_direccion));


-- -----------------------------------------------------
-- Table clinica
-- -----------------------------------------------------
CREATE TABLE  clinica (
  id_clinica NUMBER NOT NULL,
  clinica VARCHAR2(45) NULL,
  sede_id_sede NUMBER NOT NULL,
  PRIMARY KEY (id_clinica),
  CONSTRAINT fk_clinica_sede
    FOREIGN KEY (sede_id_sede)
    REFERENCES sede (id_sede));


-- -----------------------------------------------------
-- Table especialidad
-- -----------------------------------------------------
CREATE TABLE  especialidad (
  id_especialidad NUMBER NOT NULL,
  especialidad VARCHAR2(45) NULL,
  PRIMARY KEY (id_especialidad));


-- -----------------------------------------------------
-- Table clinica_especialidad
-- -----------------------------------------------------
CREATE TABLE  clinica_especialidad (
  id_clinica_especialidad NUMBER NOT NULL,
  clinica_id_clinica NUMBER NOT NULL,
  especialidad_id_especialidad NUMBER NOT NULL,
  PRIMARY KEY (id_clinica_especialidad),
  CONSTRAINT fk_clinicaEspecialidad_clinica1
    FOREIGN KEY (clinica_id_clinica)
    REFERENCES clinica (id_clinica),
  CONSTRAINT fk_clinicaEspecialidad_especialidad1
    FOREIGN KEY (especialidad_id_especialidad)
    REFERENCES especialidad (id_especialidad));


-- -----------------------------------------------------
-- Table terapia
-- -----------------------------------------------------
CREATE TABLE  terapia (
  id_terapia NUMBER NOT NULL,
  precio FLOAT NULL,
  terapia VARCHAR2(45) NULL,
  descripcion VARCHAR2(45) NULL,
  especialidad_id_especialidad NUMBER NOT NULL,
  PRIMARY KEY (id_terapia),
  CONSTRAINT fk_terapia_especialidad1
    FOREIGN KEY (especialidad_id_especialidad)
    REFERENCES especialidad (id_especialidad));


-- -----------------------------------------------------
-- Table tipo_identidad
-- -----------------------------------------------------
CREATE TABLE  tipo_identidad (
  id_tipo_identidad NUMBER NOT NULL,
  tipo_identidad VARCHAR2(45) NULL,
  PRIMARY KEY (id_tipo_identidad));


-- -----------------------------------------------------
-- Table persona
-- -----------------------------------------------------
CREATE TABLE  persona (
  id_persona NUMBER NOT NULL,
  nombre VARCHAR2(45) NULL,
  apellido VARCHAR2(45) NULL,
  edad NUMBER NULL,
  telefono NUMBER NULL,
  email VARCHAR2(45) NULL,
  identidad VARCHAR2(20) NULL,
  nit VARCHAR2(13) NULL,
  tipo_identidad_id_tipo_identidad NUMBER NOT NULL,
  direccion_id_direccion NUMBER NOT NULL,
  PRIMARY KEY (id_persona),
  CONSTRAINT fk_persona_tipoIdentidad1
    FOREIGN KEY (tipo_identidad_id_tipo_identidad)
    REFERENCES tipo_identidad (id_tipo_identidad),
  CONSTRAINT fk_persona_direccion1
    FOREIGN KEY (direccion_id_direccion)
    REFERENCES direccion (id_direccion));


-- -----------------------------------------------------
-- Table estado
-- -----------------------------------------------------
CREATE TABLE  estado (
  id_estado NUMBER NOT NULL,
  nombre_estado VARCHAR2(45) NULL,
  PRIMARY KEY (id_estado));


-- -----------------------------------------------------
-- Table especialista
-- -----------------------------------------------------
CREATE TABLE  especialista (
  id_especialista NUMBER NOT NULL,
  persona_id_persona NUMBER NOT NULL,
  estado_id_estado NUMBER NOT NULL,
  PRIMARY KEY (id_especialista),
  CONSTRAINT fk_especialista_persona1
    FOREIGN KEY (persona_id_persona)
    REFERENCES persona (id_persona),
  CONSTRAINT fk_especialista_estado1
    FOREIGN KEY (estado_id_estado)
    REFERENCES estado (id_estado));


-- -----------------------------------------------------
-- Table especialidad_especialista
-- -----------------------------------------------------
CREATE TABLE  especialidad_especialista (
  id_especialidad_especialista NUMBER NOT NULL,
  especialidad_id_especialidad NUMBER NOT NULL,
  especialista_id_especialista NUMBER NOT NULL,
  PRIMARY KEY (id_especialidad_especialista),
  CONSTRAINT fk_especialidadEspecialista_especialidad1
    FOREIGN KEY (especialidad_id_especialidad)
    REFERENCES especialidad (id_especialidad),
  CONSTRAINT fk_especialidadEspecialista_especialista1
    FOREIGN KEY (especialista_id_especialista)
    REFERENCES especialista (id_especialista));


-- -----------------------------------------------------
-- Table tipo_pago
-- -----------------------------------------------------
CREATE TABLE  tipo_pago (
  id_tipo_pago NUMBER NOT NULL,
  tipo_pago VARCHAR2(45) NULL,
  PRIMARY KEY (id_tipo_pago))
;


-- -----------------------------------------------------
-- Table factura_tipo_pago
-- -----------------------------------------------------
CREATE TABLE  factura_tipo_pago (
  id_factura_tipo_pago NUMBER NOT NULL,
  cantidad VARCHAR2(45) NULL,
  tipo_pago_id_tipo_pago NUMBER NOT NULL,
  fecha DATE NULL,
  PRIMARY KEY (id_factura_tipo_pago),
  CONSTRAINT fk_facturaTipoPago_tipoPago1
    FOREIGN KEY (tipo_pago_id_tipo_pago)
    REFERENCES tipo_pago (id_tipo_pago));


-- -----------------------------------------------------
-- Table factura
-- -----------------------------------------------------
CREATE TABLE  factura (
  id_factura NUMBER NOT NULL,
  numero_factura NUMBER NULL,
  serie_factura VARCHAR2(15) NULL,
  factura_tipo_pago_id_factura_tipo_pago NUMBER NOT NULL,
  estado_id_estado NUMBER NOT NULL,
  PRIMARY KEY (id_factura),
  CONSTRAINT fk_factura_facturaTipoPago1
    FOREIGN KEY (factura_tipo_pago_id_factura_tipo_pago)
    REFERENCES factura_tipo_pago (id_factura_tipo_pago),
  CONSTRAINT fk_factura_estado1
    FOREIGN KEY (estado_id_estado)
    REFERENCES estado (id_estado));


-- -----------------------------------------------------
-- Table horario
-- -----------------------------------------------------
CREATE TABLE  horario (
  id_horario NUMBER NOT NULL,
  horario DATE NULL,
  PRIMARY KEY (id_horario));


-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
CREATE TABLE  cliente (
  id_cliente NUMBER NOT NULL,
  fecha_creacion DATE NULL,
  persona_id_persona NUMBER NOT NULL,
  PRIMARY KEY (id_cliente),
  CONSTRAINT fk_cliente_persona1
    FOREIGN KEY (persona_id_persona)
    REFERENCES persona (id_persona));

-- -----------------------------------------------------
-- Table reservacion
-- -----------------------------------------------------
CREATE TABLE  reservacion (
  id_reservacion NUMBER NOT NULL,
  datos_reservacion VARCHAR2(45) NULL,
  fecha_reservacion DATE NULL,
  horario_id_horario NUMBER NOT NULL,
  cliente_id_cliente NUMBER NOT NULL,
  estado_id_estado NUMBER NOT NULL,
  especialidad_especialista_id_especialidad_especialista NUMBER NOT NULL,
  clinica_especialidad_id_clinica_especialidad NUMBER NOT NULL,
  PRIMARY KEY (id_reservacion),
  CONSTRAINT fk_reservacion_horario1
    FOREIGN KEY (horario_id_horario)
    REFERENCES horario (id_horario),
  CONSTRAINT fk_reservacion_cliente1
    FOREIGN KEY (cliente_id_cliente)
    REFERENCES cliente (id_cliente),
  CONSTRAINT fk_reservacion_estado1
    FOREIGN KEY (estado_id_estado)
    REFERENCES estado (id_estado),
  CONSTRAINT fk_reservacion_especialidadEspecialista1
    FOREIGN KEY (especialidad_especialista_id_especialidad_especialista)
    REFERENCES especialidad_especialista (id_especialidad_especialista),
  CONSTRAINT fk_reservacion_clinicaEspecialidad1
    FOREIGN KEY (clinica_especialidad_id_clinica_especialidad)
    REFERENCES clinica_especialidad (id_clinica_especialidad));


-- -----------------------------------------------------
-- Table terapia_reservacion
-- -----------------------------------------------------
CREATE TABLE  terapia_reservacion (
  id_terapia_reservacion NUMBER NOT NULL,
  terapia_id_terapia NUMBER NOT NULL,
  reservacion_id_reservacion NUMBER NOT NULL,
  PRIMARY KEY (id_terapia_reservacion),
  CONSTRAINT fk_terapiaReservacion_terapia1
    FOREIGN KEY (terapia_id_terapia)
    REFERENCES terapia (id_terapia),
  CONSTRAINT fk_terapiaReservacion_reservacion1
    FOREIGN KEY (reservacion_id_reservacion)
    REFERENCES reservacion (id_reservacion));


-- -----------------------------------------------------
-- Table detalle_factura
-- -----------------------------------------------------
CREATE TABLE  detalle_factura (
  id_detalle_factura NUMBER NOT NULL,
  factura_id_factura NUMBER NOT NULL,
  terapia_reservacion_id_terapia_reservacion NUMBER NOT NULL,
  PRIMARY KEY (id_detalle_factura),
  CONSTRAINT fk_detalleFactura_factura1
    FOREIGN KEY (factura_id_factura)
    REFERENCES factura (id_factura),
  CONSTRAINT fk_detalleFactura_terapiaReservacion1
    FOREIGN KEY (terapia_reservacion_id_terapia_reservacion)
    REFERENCES terapia_reservacion (id_terapia_reservacion));


-- -----------------------------------------------------
-- Table usuario
-- -----------------------------------------------------
CREATE TABLE  usuario (
  id_usuario NUMBER NOT NULL,
  password VARCHAR2(45) NULL,
  persona_id_persona NUMBER NOT NULL,
  usuario VARCHAR2(45) NOT NULL,
  PRIMARY KEY (id_usuario),
  CONSTRAINT fk_usuario_persona1
    FOREIGN KEY (persona_id_persona)
    REFERENCES persona (id_persona));


-- -----------------------------------------------------
-- Table rol
-- -----------------------------------------------------
CREATE TABLE  rol (
  id_rol NUMBER NOT NULL,
  nombre_rol VARCHAR2(45) NULL,
  crear NUMBER NULL,
  borrar NUMBER NULL,
  actualizar NUMBER NULL,
  consultar NUMBER NULL,
  PRIMARY KEY (id_rol));


-- -----------------------------------------------------
-- Table historial
-- -----------------------------------------------------
CREATE TABLE  historial (
  id_historial NUMBER NOT NULL,
  fecha_cambio DATE NULL,
  usuario_id_usuario NUMBER NOT NULL,
  estado_id_estado NUMBER NOT NULL,
  rol_id_rol NUMBER NOT NULL,
  PRIMARY KEY (id_historial),
  CONSTRAINT fk_historial_usuario1
    FOREIGN KEY (usuario_id_usuario)
    REFERENCES usuario (id_usuario),
  CONSTRAINT fk_historial_estado1
    FOREIGN KEY (estado_id_estado)
    REFERENCES estado (id_estado),
  CONSTRAINT fk_historial_rol1
    FOREIGN KEY (rol_id_rol)
    REFERENCES rol (id_rol));


-- -----------------------------------------------------
-- Table menu
-- -----------------------------------------------------
CREATE TABLE  menu (
  id_menu NUMBER NOT NULL,
  nombre_menu VARCHAR2(45) NULL,
  PRIMARY KEY (id_menu));


-- -----------------------------------------------------
-- Table menu_rol
-- -----------------------------------------------------
CREATE TABLE  menu_rol (
  id_menu_rol NUMBER NOT NULL,
  menu_id_menu NUMBER NOT NULL,
  rol_id_rol NUMBER NOT NULL,
  PRIMARY KEY (id_menu_rol),
  CONSTRAINT fk_menu_rol_menu1
    FOREIGN KEY (menu_id_menu)
    REFERENCES menu (id_menu),
  CONSTRAINT fk_menu_rol_rol1
    FOREIGN KEY (rol_id_rol)
    REFERENCES rol (id_rol));

-- -------------------------------------------------------------------------------------------------------------
-- Procedimiento Almacenados
--Ejercutar primero del primer begin al primer end y luego el otro par
-- -------------------------------------------------------------------------------------------------------------


-- Departamento
CREATE OR REPLACE PROCEDURE insertar_departamento
(
    id_deparamento NUMBER,
    departamento VARCHAR2
)
IS BEGIN
    INSERT INTO departamento
    VALUES (id_deparamento, departamento);
    COMMIT;
END insertar_departamento;
/
BEGIN

insertar_departamento (1,'Alta Verapaz');
insertar_departamento (2,'Baja Verapaz');
insertar_departamento (3,'Chimaltenago');
insertar_departamento (4,'Chiquimula');
insertar_departamento (5,'El Peten');
insertar_departamento (6,'El Progreso');
insertar_departamento (7,'El Quiche');
insertar_departamento (8,'Escuintla');
insertar_departamento (9,'Guatemala');
insertar_departamento (10,'Huehuetenango');
insertar_departamento (11,'Izabal');
insertar_departamento (12,'Jalapa');
insertar_departamento (13,'Jutiapa');
insertar_departamento (14,'Quetzaltenango');
insertar_departamento (15,'Retalhuleu');
insertar_departamento (16,'Sacatepequez');
insertar_departamento (17,'San Marcos');
insertar_departamento (18,'Santa Rosa');
insertar_departamento (19,'Solola');
insertar_departamento (20,'Suchitepequez');
insertar_departamento (21,'Totonicapan');
insertar_departamento (22,'Zacapa');

    
END;
/

-- Municipio
CREATE OR REPLACE PROCEDURE insertar_municipio
(
    id_municipio NUMBER,
    municipio VARCHAR2,
    departamento_id_departamento NUMBER
)
IS BEGIN
    INSERT INTO municipio
    VALUES (id_municipio, municipio, departamento_id_departamento);
    COMMIT;
END insertar_municipio;
/
BEGIN
insertar_municipio(1,'Salamá',1);
insertar_municipio(2,'SanMiguelChicaj',1);
insertar_municipio(3,'Rabinal',1);
insertar_municipio(4,'Cubulco',1);
insertar_municipio(5,'Granados',1);
insertar_municipio(6,'SantaCruzElChol',1);
insertar_municipio(7,'SanJerónimo',1);
insertar_municipio(8,'Purulhá',1);
insertar_municipio(9,'SanPedroCarchá',1);
insertar_municipio(10,'SanJuanChamelco',1);
insertar_municipio(11,'Lanquín',1);
insertar_municipio(12,'SantaMaríaCahabón',1);
insertar_municipio(13,'Chisec',1);
insertar_municipio(14,'Chahal',1);
insertar_municipio(15,'FrayBartolomédelasCasas',1);
insertar_municipio(16,'SantaCatarinaLaTinta',1);
insertar_municipio(17,'Salamá',2);
insertar_municipio(18,'SanMiguelChicaj',2);
insertar_municipio(19,'Rabinal',2);
insertar_municipio(20,'Cubulco',2);
insertar_municipio(21,'Granados',2);
insertar_municipio(22,'SantaCruzElChol',2);
insertar_municipio(23,'SanJerónimo',2);
insertar_municipio(24,'Purulhá',2);
insertar_municipio(25,'Chimaltenango',3);
insertar_municipio(26,'SanJoséPoaquil',3);
insertar_municipio(27,'SanMartínJilotepeque',3);
insertar_municipio(28,'SanJuanComalapa',3);
insertar_municipio(29,'SantaApolonia',3);
insertar_municipio(30,'TecpánGuatemala',3);
insertar_municipio(31,'Patzun',3);
insertar_municipio(32,'SanMiguelPochuta',3);
insertar_municipio(33,'Patzicia',3);
insertar_municipio(34,'SantaCruzBalanyá',3);
insertar_municipio(35,'Acatenango',3);
insertar_municipio(36,'SanPedroYepocapa',3);
insertar_municipio(37,'SanAndrésItzapa',3);
insertar_municipio(38,'Parramos',3);
insertar_municipio(39,'Zaragoza',3);
insertar_municipio(40,'ElTejar',3);
insertar_municipio(41,'Chiquimula',4);
insertar_municipio(42,'SanJoséLaArada',4);
insertar_municipio(43,'SanJuanHermita',4);
insertar_municipio(44,'Jocotán',4);
insertar_municipio(45,'Camotán',4);
insertar_municipio(46,'Olopa',4);
insertar_municipio(47,'Esquipulas',4);
insertar_municipio(48,'ConcepciónLasMinas',4);
insertar_municipio(49,'Quezaltepeque',4);
insertar_municipio(50,'SanJacinto',4);
insertar_municipio(51,'Ipala',4);
insertar_municipio(52,'Flores',5);
insertar_municipio(53,'SanJosé',5);
insertar_municipio(54,'SanBenito',5);
insertar_municipio(55,'SanAndrés',5);
insertar_municipio(56,'LaLibertad',5);
insertar_municipio(57,'SanFrancisco',5);
insertar_municipio(58,'SantaAna',5);
insertar_municipio(59,'Dolores',5);
insertar_municipio(60,'SanLuis',5);
insertar_municipio(61,'Sayaxche',5);
insertar_municipio(62,'MelchordeMencos',5);
insertar_municipio(63,'Poptún',5);
insertar_municipio(64,'Guastatoya',6);
insertar_municipio(65,'Morazán',6);
insertar_municipio(66,'SanAgustínAcasaguastlan',6);
insertar_municipio(67,'SanCristóbalAcasaguastlan',6);
insertar_municipio(68,'ElJícaro',6);
insertar_municipio(69,'Sansare',6);
insertar_municipio(70,'Sanarate',6);
insertar_municipio(71,'SanAntonioLaPaz',6);
insertar_municipio(72,'SantaCruzdelQuiche',7);
insertar_municipio(73,'Chiche',7);
insertar_municipio(74,'Chinique',7);
insertar_municipio(75,'Zacualpa',7);
insertar_municipio(76,'Chajul',7);
insertar_municipio(77,'SantoTomásChichicstenango',7);
insertar_municipio(78,'Patzité',7);
insertar_municipio(79,'SanAntonioIlotenango',7);
insertar_municipio(80,'SanPedroJocopilas',7);
insertar_municipio(81,'Cunén',7);
insertar_municipio(82,'SanJuanCotzal',7);
insertar_municipio(83,'Joyabaj',7);
insertar_municipio(84,'Escuintla',8);
insertar_municipio(85,'SantaLucíaCotzumalguapa',8);
insertar_municipio(86,'LaDemocracia',8);
insertar_municipio(87,'Siquinalá',8);
insertar_municipio(88,'Masagua',8);
insertar_municipio(89,'PuebloNuevoTiquisate',8);
insertar_municipio(90,'LaGomera',8);
insertar_municipio(91,'Guanagazapa',8);
insertar_municipio(92,'PuertodeSanJosé',8);
insertar_municipio(93,'Iztapa',8);
insertar_municipio(94,'Palín',8);
insertar_municipio(95,'SanVicentePacaya',8);
insertar_municipio(96,'NuevaConcepción',8);
insertar_municipio(97,'Guatemala',9);
insertar_municipio(98,'SantaCatarinaPinula',9);
insertar_municipio(99,'SanJoséPinula',9);
insertar_municipio(100,'SanJosédelGolfo',9);
insertar_municipio(101,'Palencia',9);
insertar_municipio(102,'Chinautla',9);
insertar_municipio(103,'SanPedroAyampuc',9);
insertar_municipio(104,'Mixco',9);
insertar_municipio(105,'SanPedroSacatepequez',9);
insertar_municipio(106,'SanJuanSacatepequez',9);
insertar_municipio(107,'SanRaymundo',9);
insertar_municipio(108,'Chuarrancho',9);
insertar_municipio(109,'Fraijanes',9);
insertar_municipio(110,'Amatitlán',9);
insertar_municipio(111,'VillaNueva',9);
insertar_municipio(112,'VillaCanales',9);
insertar_municipio(113,'SanMiguelPetapa',9);
insertar_municipio(114,'Huehuetenango',10);
insertar_municipio(115,'Chiantla',10);
insertar_municipio(116,'Malacatancito',10);
insertar_municipio(117,'Cuilco',10);
insertar_municipio(118,'Nentón',10);
insertar_municipio(119,'SanPedroNecta',10);
insertar_municipio(120,'Jacaltenango',10);
insertar_municipio(121,'SanPedroSoloma',10);
insertar_municipio(122,'SanIldelfonsoIxtahuac´n',10);
insertar_municipio(123,'SantaBárbara',10);
insertar_municipio(124,'LaLibertad',10);
insertar_municipio(125,'LaDemocracia',10);
insertar_municipio(126,'SanMiguelAcatán',10);
insertar_municipio(127,'SanRafaelLaIndependencia',10);
insertar_municipio(128,'TodosSantosChuchcumatán',10);
insertar_municipio(129,'SanJuanAtitán',10);
insertar_municipio(130,'SantaEulalia',10);
insertar_municipio(131,'SanMateoIxtatán',10);
insertar_municipio(132,'Colotenango',10);
insertar_municipio(133,'SanSebastiánHuehuetenango',10);
insertar_municipio(134,'Tectitán',10);
insertar_municipio(135,'ConcepciónHuista',10);
insertar_municipio(136,'SanJuanIxcoy',10);
insertar_municipio(137,'SanAntonioHuista',10);
insertar_municipio(138,'SanSebastiánCoatán',10);
insertar_municipio(139,'SantaCruzBarillas',10);
insertar_municipio(140,'Aguacatán',10);
insertar_municipio(141,'SanRafaelPetzal',10);
insertar_municipio(142,'SanGasparIxchil',10);
insertar_municipio(143,'SantiagoChimaltenango',10);
insertar_municipio(144,'SantaAnaHuista',10);
insertar_municipio(145,'PuertoBarrios',11);
insertar_municipio(146,'Livingston',11);
insertar_municipio(147,'ElEstor',11);
insertar_municipio(148,'Morales',11);
insertar_municipio(149,'LosAmates',11);
insertar_municipio(150,'Jalapa',12);
insertar_municipio(151,'SanPedroPinula',12);
insertar_municipio(152,'SanLuisJilotepeque',12);
insertar_municipio(153,'SanManuelChaparrón',12);
insertar_municipio(154,'SanCarlosAlzatate',12);
insertar_municipio(155,'Monjas',12);
insertar_municipio(156,'Mataquescuintla',12);
insertar_municipio(157,'Jutiapa',13);
insertar_municipio(158,'ElProgreso',13);
insertar_municipio(159,'SantaCatarinaMita',13);
insertar_municipio(160,'AguaBlanca',13);
insertar_municipio(161,'AsunciónMita',13);
insertar_municipio(162,'Yupiltepeque',13);
insertar_municipio(163,'Atescatempa',13);
insertar_municipio(164,'Jerez',13);
insertar_municipio(165,'ElAdelanto',13);
insertar_municipio(166,'Zapotitlán',13);
insertar_municipio(167,'Comapa',13);
insertar_municipio(168,'Jalpatagua',13);
insertar_municipio(169,'Conguaco',13);
insertar_municipio(170,'Moyuta',13);
insertar_municipio(171,'Pasaco',13);
insertar_municipio(172,'SanJoséAcatempa',13);
insertar_municipio(173,'Quezada',13);
insertar_municipio(174,'Quetzaltenango',14);
insertar_municipio(175,'Salcajá',14);
insertar_municipio(176,'Olintepeque',14);
insertar_municipio(177,'SanCarlosSija',14);
insertar_municipio(178,'Sibilia',14);
insertar_municipio(179,'Cabrican',14);
insertar_municipio(180,'Cajola',14);
insertar_municipio(181,'SanMiguelSiguilça',14);
insertar_municipio(182,'SanJuanOstuncalco',14);
insertar_municipio(183,'SanMateo',14);
insertar_municipio(184,'ConcepciónChiquirichapa',14);
insertar_municipio(185,'SanMartínSacatepequez',14);
insertar_municipio(186,'Almolonga',14);
insertar_municipio(187,'Cantel',14);
insertar_municipio(188,'Huitán',14);
insertar_municipio(189,'Zunil',14);
insertar_municipio(190,'Colomba',14);
insertar_municipio(191,'SanFranciscoLaUnión',14);
insertar_municipio(192,'ElPalmar',14);
insertar_municipio(193,'Coatepeque',14);
insertar_municipio(194,'Génova',14);
insertar_municipio(195,'FloresCostaCuca',14);
insertar_municipio(196,'LaEsperanza',14);
insertar_municipio(197,'PalestinadelosAltos',14);
insertar_municipio(198,'Retalhuelu',15);
insertar_municipio(199,'SanSebastián',15);
insertar_municipio(200,'SantaCruzMulúa',15);
insertar_municipio(201,'SanMartínZapotitlán',15);
insertar_municipio(202,'SanFelipeRetalhuleu',15);
insertar_municipio(203,'SanAndrésVillaSeca',15);
insertar_municipio(204,'Champerico',15);
insertar_municipio(205,'NuevoSanCarlos',15);
insertar_municipio(206,'ElAsintal',15);
insertar_municipio(207,'AntiguaGuatemala',16);
insertar_municipio(208,'Jocotenango',16);
insertar_municipio(209,'Pastores',16);
insertar_municipio(210,'Sumpango',16);
insertar_municipio(211,'SantoDomingoXenacoj',16);
insertar_municipio(212,'SantiagoSacatepequez',16);
insertar_municipio(213,'SanBartoloméMilpasAltas',16);
insertar_municipio(214,'SanLucasSacatepequez',16);
insertar_municipio(215,'SantaLucíaMilpasAltas',16);
insertar_municipio(216,'MagdalenaMilpasAltas',16);
insertar_municipio(217,'SantaMaríadeJesús',16);
insertar_municipio(218,'CiudadVieja',16);
insertar_municipio(219,'SanMiguelDueñas',16);
insertar_municipio(220,'SanJuanAlotenango',16);
insertar_municipio(221,'SanAntonioAguasCalientes',16);
insertar_municipio(222,'SantaCatarinaBarahona',16);
insertar_municipio(223,'SanMarcos',17);
insertar_municipio(224,'SanPedroSacatepéquez',17);
insertar_municipio(225,'Comitancillo',17);
insertar_municipio(226,'SanAntonioSacatepéquez',17);
insertar_municipio(227,'SanMiguelIxtahuacan',17);
insertar_municipio(228,'ConcepciónTutuapa',17);
insertar_municipio(229,'Tacaná',17);
insertar_municipio(230,'Sibinal',17);
insertar_municipio(231,'Tajumulco',17);
insertar_municipio(232,'Tejutla',17);
insertar_municipio(233,'SanRafaelPiédelaCuesta',17);
insertar_municipio(234,'NuevoProgreso',17);
insertar_municipio(235,'ElTumbador',17);
insertar_municipio(236,'SanJoséElRodeo',17);
insertar_municipio(237,'Malacatán',17);
insertar_municipio(238,'Catarina',17);
insertar_municipio(239,'Ayutla',17);
insertar_municipio(240,'Ocos',17);
insertar_municipio(241,'SanPablo',17);
insertar_municipio(242,'ElQuetzal',17);
insertar_municipio(243,'LaReforma',17);
insertar_municipio(244,'Pajapita',17);
insertar_municipio(245,'Ixchiguan',17);
insertar_municipio(246,'SanJoséOjetenán',17);
insertar_municipio(247,'SanCristóbalCucho',17);
insertar_municipio(248,'Sipacapa',17);
insertar_municipio(249,'EsquipulasPaloGordo',17);
insertar_municipio(250,'RíoBlanco',17);
insertar_municipio(251,'SanLorenzo',17);
insertar_municipio(252,'Cuilapa',18);
insertar_municipio(253,'Berberena',18);
insertar_municipio(254,'SanRosadeLima',18);
insertar_municipio(255,'Casillas',18);
insertar_municipio(256,'SanRafaelLasFlores',18);
insertar_municipio(257,'Oratorio',18);
insertar_municipio(258,'SanJuanTEcuaco',18);
insertar_municipio(259,'Chiquimulilla',18);
insertar_municipio(260,'Taxisco',18);
insertar_municipio(261,'SantaMaríaIxhuatan',18);
insertar_municipio(262,'Guazacapán',18);
insertar_municipio(263,'SantaCruzNaranjo',18);
insertar_municipio(264,'PuebloNuevoViñas',18);
insertar_municipio(265,'NuevaSantaRosa',18);
insertar_municipio(266,'Sololá',19);
insertar_municipio(267,'SanJoséChacaya',19);
insertar_municipio(268,'SantaMaríaVisitación',19);
insertar_municipio(269,'SantaLucíaUtatlán',19);
insertar_municipio(270,'Nahualá',19);
insertar_municipio(271,'SantaCatarinaIxtahuacán',19);
insertar_municipio(272,'SantaClaraLaLaguna',19);
insertar_municipio(273,'Concepción',19);
insertar_municipio(274,'SanAndrésSemetabaj',19);
insertar_municipio(275,'Panajachel',19);
insertar_municipio(276,'SantaCatarinaPalopó',19);
insertar_municipio(277,'SanAntonioPalopó',19);
insertar_municipio(278,'SanLucasTolimán',19);
insertar_municipio(279,'SantaCruzLaLaguna',19);
insertar_municipio(280,'SnaPabloLaLaguna',19);
insertar_municipio(281,'SanMarcosLaLaguna',19);
insertar_municipio(282,'SanJuanLaLaguna',19);
insertar_municipio(283,'SanPedroLaLaguna',19);
insertar_municipio(284,'SantiagoAtitlán',19);
insertar_municipio(285,'Mazatenango',20);
insertar_municipio(286,'Cuyotenango',20);
insertar_municipio(287,'SanFranciscoZapotitlán',20);
insertar_municipio(288,'SanBernardino',20);
insertar_municipio(289,'SanJoséElÍdolo',20);
insertar_municipio(290,'SantoDomingoSuchitepequez',20);
insertar_municipio(291,'SanLorenzo',20);
insertar_municipio(292,'Samayac',20);
insertar_municipio(293,'SanPabloJocopilas',20);
insertar_municipio(294,'SanAntonioSuchitepéquez',20);
insertar_municipio(295,'SanMiguelPanán',20);
insertar_municipio(296,'SanGabriel',20);
insertar_municipio(297,'Chicacao',20);
insertar_municipio(298,'Patulul',20);
insertar_municipio(299,'SantaBárbara',20);
insertar_municipio(300,'SanJuanBautista',20);
insertar_municipio(301,'SantoTomásLaUnión',20);
insertar_municipio(302,'Zunilito',20);
insertar_municipio(303,'PuebloNuevoSuchitepéquez',20);
insertar_municipio(304,'RíoBravo',20);
insertar_municipio(305,'Totonicapán',21);
insertar_municipio(306,'SanCristóbalTotonicapán',21);
insertar_municipio(307,'SanFranciscoElAlto',21);
insertar_municipio(308,'SanAndrésXecul',21);
insertar_municipio(309,'Momostenango',21);
insertar_municipio(310,'SantaMaríaChiquimula',21);
insertar_municipio(311,'SantaLucíaLaReforma',21);
insertar_municipio(312,'SanBartoloAguasCalientes',21);
insertar_municipio(313,'Zacapa',21);
insertar_municipio(314,'Estanzuela',21);
insertar_municipio(315,'RíoHondo',21);
insertar_municipio(316,'gualán',21);
insertar_municipio(317,'Teculután',21);
insertar_municipio(318,'Usumatlán',21);
insertar_municipio(319,'Cabañas',21);
insertar_municipio(320,'SanDiego',21);
insertar_municipio(321,'LaUnión',21);
insertar_municipio(322,'Huite',21);
END;
/
-- Rol
CREATE OR REPLACE PROCEDURE insertar_rol
(
    id_rol NUMBER,
    nombre_rol VARCHAR2,
    crear NUMBER,
    borrar NUMBER,
    actualizar NUMBER,
    consultar NUMBER
)
IS BEGIN
    INSERT INTO rol
    VALUES (id_rol, nombre_rol, crear, borrar, actualizar, consultar);
    COMMIT;
END insertar_rol;
/
BEGIN
    insertar_rol(1, 'Admin', 1,1,1,1);
    insertar_rol(2, 'Usuario', 1,0,1,1);
    insertar_rol(3, 'Auxiliar', 0,0,0,1);
END;
/


-- Estado
CREATE OR REPLACE PROCEDURE insertar_estado
(
    id_estado NUMBER,
    nombre_estado VARCHAR2
)
IS BEGIN
    INSERT INTO estado
    VALUES (id_estado, nombre_estado);
    COMMIT;
END insertar_estado;
/
BEGIN
    insertar_estado(1, 'Activo');
    insertar_estado(2, 'Progreso');
    insertar_estado(3, 'Rechazado');
END;
/




-- Especialidad
CREATE OR REPLACE PROCEDURE insertar_especialidad
(
    id_especialidad NUMBER,
    especialidad VARCHAR2
)
IS BEGIN
    INSERT INTO especialidad
    VALUES (id_especialidad, especialidad);
    COMMIT;
END insertar_especialidad;
/
BEGIN
    insertar_especialidad(1, 'Neurologica');
    insertar_especialidad(2, 'Pediatrica');
    insertar_especialidad(3, 'Geriatrica');
    insertar_especialidad(4, 'Traumatologica');
END;
/

-- Tipo Identidad
CREATE OR REPLACE PROCEDURE insertar_tipo_identidad
(
    id_tipo_identidad NUMBER,
    tipo_identidad VARCHAR2
)
IS BEGIN
    INSERT INTO tipo_identidad
    VALUES (id_tipo_identidad, tipo_identidad);
    COMMIT;
END insertar_tipo_identidad;
/
BEGIN
    insertar_tipo_identidad(1, 'DPI');
    insertar_tipo_identidad(2, 'Pasaporte');
END;
/


-- Tipo menu
CREATE OR REPLACE PROCEDURE insertar_menu
(
    id_menu NUMBER,
    menu VARCHAR2
)
IS BEGIN
    INSERT INTO menu
    VALUES (id_menu, menu);
    COMMIT;
END insertar_menu;
/
BEGIN
    insertar_menu(1, 'Reservacion');
    insertar_menu(2, 'Clientes');
    insertar_menu(3, 'Especialistas');
    insertar_menu(4, 'Especialidades');
    insertar_menu(5, 'Sedes');
    insertar_menu(6, 'Clinicas');
    insertar_menu(7, 'Facturas');
    insertar_menu(8, 'Estados');
    insertar_menu(9, 'Tipo de Identidad');
    insertar_menu(10, 'Roles');
    insertar_menu(11, 'Terapia');
END;
/




-------------------------------------------------------TRIGGERS-------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE bitacora (
    id_bitacora NUMBER NOT NULL,
    tabla VARCHAR2(45) NULL,
    valor_anterior VARCHAR2(4000),
    valor_nuevo VARCHAR2(4000),
    fecha DATE NULL,
    accion VARCHAR2(100) NULL,
    usuario VARCHAR2(20) NULL,
    PRIMARY KEY(id_bitacora)
);

SELECT * FROM bitacora;

-- SEQUENCIA
CREATE SEQUENCE SQC_BITACORA
START WITH 1
INCREMENT BY 1;


-- TRIGGER CLIENTE
CREATE OR REPLACE TRIGGER tr_cliente
BEFORE UPDATE OR DELETE
ON cliente
    FOR EACH ROW
    BEGIN
        IF updating('fecha_creacion') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'CLIENTE', 
            (JSON_OBJECT (
            KEY 'fecha_creacion' IS :OLD.fecha_creacion
            )), 
            (JSON_OBJECT (
            KEY 'fecha_creacion' IS :NEW.fecha_creacion
            )), 
            systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'CLIENTE', 
            (JSON_OBJECT (
            KEY 'id_cliente' IS :OLD.id_cliente,
            KEY 'fecha_creacion' IS :OLD.fecha_creacion,
            KEY 'persona_id_persona' IS :OLD.persona_id_persona
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/
-- TRIGGER PERSONA
CREATE OR REPLACE TRIGGER tr_persona
BEFORE UPDATE OR DELETE
ON persona
    FOR EACH ROW
    BEGIN
        IF updating('nombre') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'nombre' IS :OLD.nombre)), (JSON_OBJECT (KEY 'nombre' IS :NEW.nombre)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('apellido') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'apellido' IS :OLD.apellido)), (JSON_OBJECT (KEY 'apellido' IS :NEW.apellido)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('edad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'edad' IS :OLD.edad)), (JSON_OBJECT (KEY 'edad' IS :NEW.edad)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('telefono') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'telefono' IS :OLD.telefono)), (JSON_OBJECT (KEY 'telefono' IS :NEW.telefono)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('email') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'email' IS :OLD.email)), (JSON_OBJECT (KEY 'email' IS :NEW.email)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('identidad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'identidad' IS :OLD.identidad)), (JSON_OBJECT (KEY 'identidad' IS :NEW.identidad)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('nit') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'nit' IS :OLD.nit)), (JSON_OBJECT (KEY 'nit' IS :NEW.nit)), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA', 
            (JSON_OBJECT (
            KEY 'id_persona' IS :OLD.id_persona,
            KEY 'nombre' IS :OLD.nombre,
            KEY 'apellido' IS :OLD.apellido,
            KEY 'edad' IS :OLD.edad,
            KEY 'telefono' IS :OLD.telefono,
            KEY 'email' IS :OLD.email,
            KEY 'identidad' IS :OLD.identidad,
            KEY 'nit' IS :OLD.nit,
            KEY 'tipo_identidad' IS :OLD.tipo_identidad_id_tipo_identidad,
            KEY 'direccion' IS :OLD.direccion_id_direccion
            )), NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/


-- TRIGGER USUARIO
CREATE OR REPLACE TRIGGER tr_usuario
BEFORE UPDATE OR DELETE
ON usuario
    FOR EACH ROW
    BEGIN
        IF updating('password') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'USUARIO',             
            (JSON_OBJECT (
            KEY 'password' IS :OLD.password
            )), 
            (JSON_OBJECT (
            KEY 'password' IS :NEW.password
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('usuario') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'USUARIO',             
            (JSON_OBJECT (
            KEY 'usuario' IS :OLD.usuario
            )), 
            (JSON_OBJECT (
            KEY 'usuario' IS :NEW.usuario
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'USUARIO', 
            (JSON_OBJECT (
            KEY 'id_usuario' IS :OLD.id_usuario,
            KEY 'password' IS :OLD.password,
            KEY 'persona_id_persona' IS :OLD.persona_id_persona,
            KEY 'usuario' IS :OLD.usuario
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/


-- TRIGGER TERAPIA
CREATE OR REPLACE TRIGGER tr_terapia
BEFORE UPDATE OR DELETE
ON terapia
    FOR EACH ROW
    BEGIN
        IF updating('precio') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TERAPIA',             
            (JSON_OBJECT (
            KEY 'precio' IS :OLD.precio
            )), 
            (JSON_OBJECT (
            KEY 'precio' IS :NEW.precio
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('terapia') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TERAPIA',             
            (JSON_OBJECT (
            KEY 'terapia' IS :OLD.terapia
            )), 
            (JSON_OBJECT (
            KEY 'terapia' IS :NEW.terapia
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('descripcion') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TERAPIA',             
            (JSON_OBJECT (
            KEY 'descripcion' IS :OLD.descripcion
            )), 
            (JSON_OBJECT (
            KEY 'descripcion' IS :NEW.descripcion
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TERAPIA', 
            (JSON_OBJECT (
            KEY 'id_terapia' IS :OLD.id_terapia,
            KEY 'precio' IS :OLD.precio,
            KEY 'terapia' IS :OLD.terapia,
            KEY 'descripcion' IS :OLD.descripcion,
            KEY 'especialidad_id_especialidad' IS :OLD.especialidad_id_especialidad
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;

/

-- TRIGGER DIRECCION
CREATE OR REPLACE TRIGGER tr_direccion
BEFORE UPDATE OR DELETE
ON direccion
    FOR EACH ROW
    BEGIN
        IF updating('calle') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'DIRECCION',             
            (JSON_OBJECT (
            KEY 'calle' IS :OLD.calle
            )), 
            (JSON_OBJECT (
            KEY 'calle' IS :NEW.calle
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('avenida') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'DIRECCION',             
            (JSON_OBJECT (
            KEY 'avenida' IS :OLD.avenida
            )), 
            (JSON_OBJECT (
            KEY 'avenida' IS :NEW.avenida
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('otros') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'DIRECCION',             
            (JSON_OBJECT (
            KEY 'otros' IS :OLD.otros
            )), 
            (JSON_OBJECT (
            KEY 'otros' IS :NEW.otros
            )),
            systimestamp, 'UPDATE', user);
        END IF;
        IF updating('municipio_id_municipio') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'DIRECCION',             
            (JSON_OBJECT (
            KEY 'municipio_id_municipio' IS :OLD.municipio_id_municipio
            )), 
            (JSON_OBJECT (
            KEY 'municipio_id_municipio' IS :NEW.municipio_id_municipio
            )),
            systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'DIRECCION', 
            (JSON_OBJECT (
            KEY 'id_direccion' IS :OLD.id_direccion,
            KEY 'calle' IS :OLD.calle,
            KEY 'avenida' IS :OLD.avenida,
            KEY 'otros' IS :OLD.otros,
            KEY 'municipio_id_municipio' IS :OLD.municipio_id_municipio
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;

/

-- TRIGGER SEDE
CREATE OR REPLACE TRIGGER tr_sede
BEFORE UPDATE OR DELETE
ON sede
    FOR EACH ROW
    BEGIN
        IF updating('sede') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'SEDE',             
            (JSON_OBJECT (
            KEY 'sede' IS :OLD.sede
            )), 
            (JSON_OBJECT (
            KEY 'sede' IS :NEW.sede
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('direccion_id_direccion') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'SEDE',             
            (JSON_OBJECT (
            KEY 'direccion_id_direccion' IS :OLD.direccion_id_direccion
            )), 
            (JSON_OBJECT (
            KEY 'direccion_id_direccion' IS :NEW.direccion_id_direccion
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'SEDE', 
            (JSON_OBJECT (
            KEY 'id_sede' IS :OLD.id_sede,
            KEY 'sede' IS :OLD.sede,
            KEY 'direccion_id_direccion' IS :OLD.direccion_id_direccion
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;

/

-- TRIGGER CLINICA
CREATE OR REPLACE TRIGGER tr_clinica
BEFORE UPDATE OR DELETE
ON clinica
    FOR EACH ROW
    BEGIN
        IF updating('clinica') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'CLINICA',             
            (JSON_OBJECT (
            KEY 'clinica' IS :OLD.clinica
            )), 
            (JSON_OBJECT (
            KEY 'clinica' IS :NEW.clinica
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('sede_id_sede') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'CLINICA',             
            (JSON_OBJECT (
            KEY 'sede_id_sede' IS :OLD.sede_id_sede
            )), 
            (JSON_OBJECT (
            KEY 'sede_id_sede' IS :NEW.sede_id_sede
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'CLINICA', 
            (JSON_OBJECT (
            KEY 'id_clinica' IS :OLD.id_clinica,
            KEY 'clinica' IS :OLD.clinica,
            KEY 'sede_id_sede' IS :OLD.sede_id_sede
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/


-- TRIGGER ESPECIALIDAD
CREATE OR REPLACE TRIGGER tr_especialidad
BEFORE UPDATE OR DELETE
ON especialidad
    FOR EACH ROW
    BEGIN
        IF updating('especialidad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'ESPECIALIDAD',             
            (JSON_OBJECT (
            KEY 'especialidad' IS :OLD.especialidad
            )), 
            (JSON_OBJECT (
            KEY 'especialidad' IS :NEW.especialidad
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'ESPECIALIDAD', 
            (JSON_OBJECT (
            KEY 'id_especialidad' IS :OLD.id_especialidad,
            KEY 'especialidad' IS :OLD.especialidad
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
    
/
    
-- TRIGGER ESPECIALISTA
CREATE OR REPLACE TRIGGER tr_especialista
BEFORE UPDATE OR DELETE
ON especialista
    FOR EACH ROW
    BEGIN
        IF updating('persona_id_persona') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'ESPECIALISTA',             
            (JSON_OBJECT (
            KEY 'persona_id_persona' IS :OLD.persona_id_persona
            )), 
            (JSON_OBJECT (
            KEY 'persona_id_persona' IS :NEW.persona_id_persona
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('estado_id_estado') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'ESPECIALISTA',             
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :OLD.estado_id_estado
            )), 
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :NEW.estado_id_estado
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'ESPECIALISTA', 
            (JSON_OBJECT (
            KEY 'id_especialista' IS :OLD.id_especialista,
            KEY 'persona_id_persona' IS :OLD.persona_id_persona,
            KEY 'estado_id_estado' IS :OLD.estado_id_estado
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;

/
-- TRIGGER RESERVACION
CREATE OR REPLACE TRIGGER tr_reservacion
BEFORE UPDATE OR DELETE
ON reservacion
    FOR EACH ROW
    BEGIN
        IF updating('datos_reservacion') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'datos_reservacion' IS :OLD.datos_reservacion
            )), 
            (JSON_OBJECT (
            KEY 'datos_reservacion' IS :NEW.datos_reservacion
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('fecha_reservacion') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'fecha_reservacion' IS :OLD.fecha_reservacion
            )), 
            (JSON_OBJECT (
            KEY 'fecha_reservacion' IS :NEW.fecha_reservacion
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('horario_id_horario') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'horario_id_horario' IS :OLD.horario_id_horario
            )), 
            (JSON_OBJECT (
            KEY 'horario_id_horario' IS :NEW.horario_id_horario
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('cliente_id_cliente') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'cliente_id_cliente' IS :OLD.cliente_id_cliente
            )), 
            (JSON_OBJECT (
            KEY 'cliente_id_cliente' IS :NEW.cliente_id_cliente
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('estado_id_estado') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :OLD.estado_id_estado
            )), 
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :NEW.estado_id_estado
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('especialidad_especialista_id_especialidad_especialista') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'especialidad_especialista_id_especialidad_especialista' IS :OLD.especialidad_especialista_id_especialidad_especialista
            )), 
            (JSON_OBJECT (
            KEY 'especialidad_especialista_id_especialidad_especialista' IS :NEW.especialidad_especialista_id_especialidad_especialista
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('clinica_especialidad_id_clinica_especialidad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'clinica_especialidad_id_clinica_especialidad' IS :OLD.clinica_especialidad_id_clinica_especialidad
            )), 
            (JSON_OBJECT (
            KEY 'clinica_especialidad_id_clinica_especialidad' IS :NEW.clinica_especialidad_id_clinica_especialidad
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION', 
            (JSON_OBJECT (
            KEY 'id_reservacion' IS :OLD.id_reservacion,
            KEY 'datos_reservacion' IS :OLD.datos_reservacion,
            KEY 'fecha_reservacion' IS :OLD.fecha_reservacion,
            KEY 'horario_id_horario' IS :OLD.horario_id_horario,
            KEY 'cliente_id_cliente' IS :OLD.cliente_id_cliente,
            KEY 'estado_id_estado' IS :OLD.estado_id_estado,
            KEY 'especialidad_especialista_id_especialidad_especialista' IS :OLD.especialidad_especialista_id_especialidad_especialista,
            KEY 'clinica_especialidad_id_clinica_especialidad' IS :OLD.clinica_especialidad_id_clinica_especialidad
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;

/

-- TRIGGER FACTURA
CREATE OR REPLACE TRIGGER tr_factura
BEFORE UPDATE OR DELETE
ON factura
    FOR EACH ROW
    BEGIN
        IF updating('numero_factura') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA',             
            (JSON_OBJECT (
            KEY 'numero_factura' IS :OLD.numero_factura
            )), 
            (JSON_OBJECT (
            KEY 'numero_factura' IS :NEW.numero_factura
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('serie_factura') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA',             
            (JSON_OBJECT (
            KEY 'serie_factura' IS :OLD.serie_factura
            )), 
            (JSON_OBJECT (
            KEY 'serie_factura' IS :NEW.serie_factura
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('factura_tipo_pago_id_factura_tipo_pago') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA',             
            (JSON_OBJECT (
            KEY 'factura_tipo_pago_id_factura_tipo_pago' IS :OLD.factura_tipo_pago_id_factura_tipo_pago
            )), 
            (JSON_OBJECT (
            KEY 'factura_tipo_pago_id_factura_tipo_pago' IS :NEW.factura_tipo_pago_id_factura_tipo_pago
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('estado_id_estado') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA',             
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :OLD.estado_id_estado
            )), 
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :NEW.estado_id_estado
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA', 
            (JSON_OBJECT (
            KEY 'id_factura' IS :OLD.id_factura,
            KEY 'numero_factura' IS :OLD.numero_factura,
            KEY 'serie_factura' IS :OLD.serie_factura,
            KEY 'factura_tipo_pago_id_factura_tipo_pago' IS :OLD.factura_tipo_pago_id_factura_tipo_pago,
            KEY 'estado_id_estado' IS :OLD.estado_id_estado
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/


-- TRIGGER FACTURA TIPO PAGO
CREATE OR REPLACE TRIGGER tr_factura_tipo_pago
BEFORE UPDATE OR DELETE
ON factura_tipo_pago
    FOR EACH ROW
    BEGIN
        IF updating('cantidad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA TIPO PAGO',             
            (JSON_OBJECT (
            KEY 'cantidad' IS :OLD.cantidad
            )), 
            (JSON_OBJECT (
            KEY 'cantidad' IS :NEW.cantidad
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('tipo_pago_id_tipo_pago') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA TIPO PAGO',             
            (JSON_OBJECT (
            KEY 'tipo_pago_id_tipo_pago' IS :OLD.tipo_pago_id_tipo_pago
            )), 
            (JSON_OBJECT (
            KEY 'tipo_pago_id_tipo_pago' IS :NEW.tipo_pago_id_tipo_pago
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('fecha') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA TIPO PAGO',             
            (JSON_OBJECT (
            KEY 'fecha' IS :OLD.fecha
            )), 
            (JSON_OBJECT (
            KEY 'fecha' IS :NEW.fecha
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA TIPO PAGO', 
            (JSON_OBJECT (
            KEY 'id_factura_tipo_pago' IS :OLD.id_factura_tipo_pago,
            KEY 'cantidad' IS :OLD.cantidad,
            KEY 'tipo_pago_id_tipo_pago' IS :OLD.tipo_pago_id_tipo_pago,
            KEY 'fecha' IS :OLD.fecha
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/

-- TRIGGER TIPO IDENTIDAD
CREATE OR REPLACE TRIGGER tr_tipo_identidad
BEFORE UPDATE OR DELETE
ON tipo_identidad
    FOR EACH ROW
    BEGIN
        IF updating('tipo_identidad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TIPO IDENTIDAD',             
            (JSON_OBJECT (
            KEY 'tipo_identidad' IS :OLD.tipo_identidad
            )), 
            (JSON_OBJECT (
            KEY 'tipo_identidad' IS :NEW.tipo_identidad
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TIPO IDENTIDAD', 
            (JSON_OBJECT (
            KEY 'id_tipo_identidad' IS :OLD.id_tipo_identidad,
            KEY 'tipo_identidad' IS :OLD.tipo_identidad
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;

/


