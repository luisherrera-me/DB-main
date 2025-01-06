-- Insertar datos en la tabla 'rol'
INSERT INTO rol (name, description, logo, created_at, updated_at) VALUES
('ADMIN', 'Role with full system permissions', '/images/admin_logo.png', '2024-12-01 08:00:00', '2024-12-01 08:00:00'),
('USER', 'Role with read-only access', '/images/viewer_logo.png', '2024-12-01 08:30:00', '2024-12-01 08:30:00');

-- Insertar datos en la tabla 'user'
INSERT INTO "users" (id_rol, name, photo , address, email, password, created_at, updated_at) VALUES
(1, 'administrador', 'https://cdn-icons-png.flaticon.com/512/149/149071.png', 'kr24E # 8-11', 'admin@admin.com', '$2a$10$pYhWOZFGKZbEK5se6lHUSuXJTbmI4khkjGWR3R5UNZCba1KZInbHS', '2024-12-01 09:00:00', '2024-12-01 09:00:00'),
(1, 'Luis Herrera', 'https://cdn-icons-png.flaticon.com/512/149/149071.png', 'kr54a # 1-87', 'luis@user.com', '$2a$10$KaLYMMVkZG83w.LS/O3pYOVGSuLCp8EBbLeOgaLqKEYHsdOdgX3xW', '2024-12-01 09:10:00', '2024-12-01 09:10:00');

-- Insertar datos en la tabla 'robot'
INSERT INTO robot (id_user, name, model, serial_number, description, created_at, updated_at) VALUES
(1, 'Robot A', 'kbot-v1-23e', 'EFN8111MC', 'Robot para monitoreo de ambiente', '2024-12-01 10:00:00', '2024-12-01 10:00:00'),
(2, 'Robot B', 'kbot-v1-23e', 'KZL1693XW', 'Robot para recolección de datos de temperatura', '2024-12-01 11:00:00', '2024-12-01 11:00:00');


-- Insertar datos en la tabla 'robot_location'
INSERT INTO robot_location (id_robot, latitude, longitude, timestamp) VALUES
(1, 40.7128, -74.0060, '2024-12-01 10:15:00'),
(2, 34.0522, -118.2437, '2024-12-01 11:15:00');

-- Insertar datos en la tabla 'sensor'
INSERT INTO sensor (name, type, created_at, updated_at) VALUES
('Temperatura', 'NTC Thermistor', '2024-12-01 10:20:00', '2024-12-01 10:20:00'),
('Humedad', 'Capacitive', '2024-12-01 10:30:00', '2024-12-01 10:30:00'),
('Proximidad', 'Ultrasonic', '2024-12-01 10:40:00', '2024-12-01 10:40:00');

-- Insertar relaciones entre robots y sensores en la tabla robot_sensor
INSERT INTO robot_sensor (id_robot, id_sensor, created_at) VALUES
(1, 1, '2024-12-01 10:00:00'), -- Robot A - Temperatura
(1, 2, '2024-12-01 10:00:00'), -- Robot A - Humedad
(1, 3, '2024-12-01 10:00:00'), -- Robot A - Proximidad
(2, 1, '2024-12-01 11:00:00'), -- Robot B - Temperatura
(2, 2, '2024-12-01 11:00:00'); -- Robot B - Humedad

-- Insertar datos en la tabla 'sensor_data'
INSERT INTO sensor_data (id_sensor, id_robot, value, latitude, longitude, timestamp) VALUES
(1, 1, 25.6, 40.7128, -74.0060, '2024-12-01 10:25:00'),
(2, 1, 60.5, 40.7128, -74.0060, '2024-12-01 10:35:00'),
(3, 1, 5.0, 40.7128, -74.0060, '2024-12-01 10:45:00'),
(1, 2, 30.4, 34.0522, -118.2437, '2024-12-01 11:25:00'),
(2, 2, 55.2, 34.0522, -118.2437, '2024-12-01 11:35:00'),
(3, 2, 10.0, 34.0522, -118.2437, '2024-12-01 11:45:00');
