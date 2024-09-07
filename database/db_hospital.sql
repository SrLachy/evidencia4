CREATE DATABASE hospital;

USE hospital;

CREATE TABLE Sala (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    nombre_sala VARCHAR(100) NOT NULL
);

CREATE TABLE Paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_paciente VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    peso FLOAT NOT NULL,
    fecha_ingreso DATE NOT NULL
);

CREATE TABLE CamaHospitalaria (
    id_cama INT AUTO_INCREMENT PRIMARY KEY,
    peso_paciente FLOAT NOT NULL,
    estado VARCHAR(50) NOT NULL, -- (Cama Disponible/Ocupada)
    peso_maximo FLOAT NOT NULL,
    id_sala INT,
    id_paciente INT,
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

-- INCERTANDO DATOS DE EJEMPLOS:

-- En la tabla Sala:
INSERT INTO Sala (nombre_sala) VALUES ('Sala A');
INSERT INTO Sala (nombre_sala) VALUES ('Sala B');
INSERT INTO Sala (nombre_sala) VALUES ('Sala C');

-- En la tabla Paciente:
INSERT INTO Paciente (nombre_paciente, edad, peso, fecha_ingreso) 
VALUES ('Juan Pérez', 45, 80.5, '2024-09-01');
INSERT INTO Paciente (nombre_paciente, edad, peso, fecha_ingreso) 
VALUES ('Ana Gómez', 30, 68.2, '2024-08-30');
INSERT INTO Paciente (nombre_paciente, edad, peso, fecha_ingreso) 
VALUES ('Carlos López', 65, 92.4, '2024-09-02');
INSERT INTO Paciente (nombre_paciente, edad, peso, fecha_ingreso) 
VALUES ('Maria Hernández', 50, 77.3, '2024-09-03');
INSERT INTO Paciente (nombre_paciente, edad, peso, fecha_ingreso) 
VALUES ('Sofía Rodríguez', 25, 55.6, '2024-09-01');

-- En la tabla CamaHospitalaria:
INSERT INTO CamaHospitalaria (peso_paciente, estado, peso_maximo, id_sala, id_paciente) 
VALUES (80.5, 'Ocupada', 200, 1, 1);
INSERT INTO CamaHospitalaria (peso_paciente, estado, peso_maximo, id_sala, id_paciente) 
VALUES (68.2, 'Ocupada', 200, 1, 2);
INSERT INTO CamaHospitalaria (peso_paciente, estado, peso_maximo, id_sala, id_paciente) 
VALUES (92.4, 'Ocupada', 200, 2, 3);
INSERT INTO CamaHospitalaria (peso_paciente, estado, peso_maximo, id_sala, id_paciente) 
VALUES (77.3, 'Ocupada', 200, 2, 4);
INSERT INTO CamaHospitalaria (peso_paciente, estado, peso_maximo, id_sala, id_paciente) 
VALUES (55.6, 'Ocupada', 200, 3, 5);

-- CONSULTAS SELEC:

-- Para obtener todas las camas ocupadas:
SELECT * FROM CamaHospitalaria
WHERE estado = 'Ocupada';

-- Para consultar las camas en una sala específica:
SELECT c.id_cama, c.estado, s.nombre_sala
FROM CamaHospitalaria c
JOIN Sala s ON c.id_sala = s.id_sala
WHERE s.nombre_sala = 'Sala A';

-- Para obtener el nombre del paciente asignado a cada cama:
SELECT c.id_cama, p.nombre_paciente, c.estado
FROM CamaHospitalaria c
JOIN Paciente p ON c.id_paciente = p.id_paciente;

-- Para mostrar las camas que tienen un peso del paciente mayor a 85kg:
SELECT * FROM CamaHospitalaria
WHERE peso_paciente > 85;

-- Para obtener la información de camas en una sala junto con el nombre de los pacientes:
SELECT c.id_cama, p.nombre_paciente, s.nombre_sala
FROM CamaHospitalaria c
JOIN Paciente p ON c.id_paciente = p.id_paciente
JOIN Sala s ON c.id_sala = s.id_sala;
