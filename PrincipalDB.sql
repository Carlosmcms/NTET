
--Revisar tablas que requieran almacenar coordenadas o necesiten PostGIS
-- Tablas creadas -----------------------------------------------------------------------------------------

CREATE TABLE Conductor(
    celular VARCHAR(12), 
    nombre VARCHAR(100),
    fechaNacimiento DATE,
    edad INTEGER(2),
    licencia VARCHAR(15),
    estadoLicencia BOOLEAN,
    calificacion DECIMAL(3,2),
    viajesRealizados INTEGER,
    kmAcumulados DECIMAL(7,2)
);

CREATE TABLE Servicio(
    idServicio SERIAL,
    celular VARCHAR(12),
    placa VARCHAR(6),
    disponibilidad BOOLEAN,
    --coordenadasActivacion spatial

);

CREATE TABLE Taxi(
    placa VARCHAR(6),
    marca VARCHAR(25),
    modelo VARCHAR(15),
    año VARCHAR(4),
    baul VARCHAR(20),
    soat VARCHAR(20)
);

CREATE TABLE Viaje(
    idViaje SERIAL,
    tiempoRealizado TIME,
    tiempoEstimado TIME,
    dirDestino VARCHAR(60),
    dirInicio VARCHAR(60),
    costoViaje DECIMAL(9,2),
    kmTotales DECIMAL(7,2),
    califConductor DECIMAL(3,2),
    cafifUsuario DECIMAL(3,2),
    kmRecorridos DECIMAL(7,2),
    --coordDestino spatial,
    --coordInicio spatial
);

CREATE TABLE Requiere(
    servicioId VARCHAR(9),
    viajeId VARCHAR(9)
);

CREATE TABLE Favoritos(
    idDireccion SERIAL,
    direccion VARCHAR(60),
    --coordenadas spatial
);

CREATE TABLE Realiza(
    celular VARCHAR(12),
    idViaje VARCHAR(10),
);

CREATE TABLE Usuario(
    celular VARCHAR(12),
    nombre VARCHAR(60),
    calificacion DECIMAL(3,2),
    kmTomados DECIMAL(7,2),
    correo VARCHAR(80),
    tarjetaCredito VARCHAR(16),
    viajesTomados INTEGER,
    direccionRes VARCHAR(60),
);

CREATE TABLE Agenda_Direccion(
    celular VARCHAR(12),
    idDireccion VARCHAR(60),
    nombre VARCHAR(40),
    tipo INTEGER
);


-- Restricciones ------------------------------------------------------------------------------------------

--Conductor
ALTER TABLE Conductor
    ADD CONSTRAINT conductor_pk PRIMARY KEY (celular);

--Servicio
ALTER TABLE Servicio
    ADD CONSTRAINT servicio_pk PRIMARY KEY (servicioId);

ALTER TABLE Servicio
    ADD CONSTRAINT servicio_fk1 FOREIGN KEY (celular) REFERENCES Conductor(celular);

ALTER TABLE Servicio
    ADD CONSTRAINT servicio_fk2 FOREIGN KEY (placa) REFERENCES Taxi(placa);

--Taxi
ALTER TABLE Taxi
    ADD CONSTRAINT taxi_pk PRIMARY KEY (placa);

--Viaje
ALTER TABLE Viaje
    ADD CONSTRAINT viaje_pk PRIMARY KEY (idViaje);

--Requiere
ALTER TABLE Requiere
    ADD CONSTRAINT requiere_fk1 FOREIGN KEY (servicioId) REFERENCES Servicio(servicioId);

ALTER TABLE Requiere
    ADD CONSTRAINT requiere_fk2 FOREIGN KEY (viajeId) REFERENCES Viaje(idCiaje);

--Favoritos
ALTER TABLE Favoritos
    ADD CONSTRAINT favoritos_pk PRIMARY KEY (idDireccion);

-- Realiza
ALTER TABLE Realiza
    ADD CONSTRAINT realiza_fk1 FOREIGN KEY (celular) REFERENCES Usuario(celular);

ALTER TABLE Realiza
    ADD CONSTRAINT realiza_fk2 FOREIGN KEY (idViaje) REFERENCES Viaje(idViaje);

-- Usuario


-- Agenda_Direccion