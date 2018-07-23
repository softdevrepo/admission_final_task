DROP USER mobile;
CREATE USER mobile IDENTIFIED by root;
GRANT CONNECT ,RESOURCE TO mobile;

CREATE TABLE MOBILE.FORMAT_SUPPORT
(
  id INT PRIMARY KEY,
  jpg_support CHAR(1),
  mp4_support CHAR(1),
  support_4k CHAR(1)
);

CREATE TABLE MOBILE.INTERFACES
(
  id INT PRIMARY KEY,
  wi_fi_quality VARCHAR(20),
  bluetooth_version VARCHAR(29),
  audio_port_size_mm INT
);

CREATE TABLE MOBILE.FIRM
(
  id INT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  country VARCHAR(20) NOT NULL
);

CREATE TABLE MOBILE.MEMORY
(
  id INT PRIMARY KEY,
  RAM_size INT NOT NULL,
  imbedded_size INT NOT NULL,
  micro_sd_size INT
);

CREATE TABLE MOBILE.FRONT_CAM
(
  id INT PRIMARY KEY,
  quality_mp INT,
  technology VARCHAR(20),
  algorithm VARCHAR(20)
);

CREATE TABLE MOBILE.MAIN_CAM
(
  id INT PRIMARY KEY,
  quality_mp VARCHAR(20),
  linse_quality VARCHAR(20),
  panorama CHAR(1) NOT NULL,
  flash CHAR(1) NOT NULL
);

CREATE TABLE MOBILE.CAMERA
(
  id INT PRIMARY KEY,
  front_cam_id INT,
  main_cam_id INT,
  CONSTRAINT camera_FRONT_CAM__fk FOREIGN KEY (front_cam_id) REFERENCES FRONT_CAM(id),
  CONSTRAINT camera_MAIN_CAM__fk FOREIGN KEY (main_cam_id) REFERENCES MAIN_CAM(id)
);

CREATE TABLE MOBILE.PROCESSOR
(
  id INT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  frequency INT NOT NULL,
  model VARCHAR(20)
);

CREATE TABLE MOBILE.DISPLAY
(
  id INT PRIMARY KEY,
  diagonal VARCHAR(10),
  primission VARCHAR(20),
  brightness_kd INT
);

CREATE TABLE MOBILE.CHARACTERISTICS
(
  id INT PRIMARY KEY,
  display_id INT,
  processor_id INT,
  memory_id INT,
  celluar VARCHAR(20),
  camera_id INT,
  format_id INT,
  interface_id INT,
  CONSTRAINT ch_DISPLAY_ID_fk FOREIGN KEY (display_id) REFERENCES DISPLAY (ID),
  CONSTRAINT ch_PROCESSOR_ID_fk FOREIGN KEY (processor_id) REFERENCES PROCESSOR (ID),
  CONSTRAINT ch_MEMORY_ID_fk FOREIGN KEY (memory_id) REFERENCES MEMORY (ID),
  CONSTRAINT ch_CAMERA_ID_fk FOREIGN KEY (camera_id) REFERENCES CAMERA (ID),
  CONSTRAINT ch_F_S_ID_fk FOREIGN KEY (format_id) REFERENCES FORMAT_SUPPORT (ID),
  CONSTRAINT ch_INT_ID_fk FOREIGN KEY (interface_id) REFERENCES INTERFACES (ID)
);

CREATE TABLE MOBILE.MODEL
(
  serial_id INT PRIMARY KEY,
  price_$ INT NOT NULL,
  characteristic_id INT,
  firm_id INT,
  CONSTRAINT m_CHARACTERISTICS_ID_fk FOREIGN KEY (characteristic_id) REFERENCES CHARACTERISTICS (ID),
  CONSTRAINT m_FIRM_ID_fk FOREIGN KEY (firm_id) REFERENCES FIRM (ID)
);

CREATE TABLE MOBILE.GADGET
(
  id INT PRIMARY KEY,
  imei INT NOT NULL,
  name VARCHAR(20),
  serial_number INT,
  CONSTRAINT gadget_MODEL_SERIAL_ID_fk FOREIGN KEY (serial_number) REFERENCES MODEL (SERIAL_ID)
);
CREATE UNIQUE INDEX gadget_imei_uindex ON MOBILE.gadget (imei);

INSERT INTO FRONT_CAM VALUES (1,face_ae,ArcSoft)




