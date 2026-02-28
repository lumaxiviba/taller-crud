-- Insertar Marcas
INSERT INTO auto_marca (codigo, descripcion, user_create) 
VALUES 
('TOY', 'Toyota', 1),
('NIS', 'Nissan', 1),
('HON', 'Honda', 1),
('FOR', 'Ford', 1),
('CHE', 'Chevrolet', 1);

-- Insertar Autos
INSERT INTO auto (id_marca, placa, modelo, color, anio, user_create) 
VALUES 
(1, 'ABC-123', 'Corolla', 'Plata', 2020, 1),
(2, 'XYZ-987', 'Sentra', 'Negro', 2018, 1),
(3, 'DEF-456', 'Civic', 'Rojo', 2022, 1),
(4, 'GHI-789', 'Mustang', 'Azul', 2021, 1),
(1, 'JKL-012', 'Yaris', 'Blanco', 2019, 1);