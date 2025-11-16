CREATE TABLE robots
(
robot_id SERIAL PRIMARY KEY,
model VARCHAR(50),
station VARCHAR(50),
ip_address VARCHAR(50)
);

CREATE TABLE plcs
(
plc_id SERIAL PRIMARY KEY,
brand VARCHAR(50),
cell_name VARCHAR(50)
);

CREATE TABLE sensors (
    sensor_id SERIAL PRIMARY KEY,
    plc_id INT REFERENCES plcs(plc_id),
    type VARCHAR(30),
    unit VARCHAR(10)
);

CREATE TABLE production_cycle (
    cycle_id SERIAL PRIMARY KEY,
    robot_id INT REFERENCES robots(robot_id),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    status VARCHAR(20)
);

-- SENSOR LOGS table (high-frequency historian-like)
CREATE TABLE sensor_log (
    log_id BIGSERIAL PRIMARY KEY,
    sensor_id INT REFERENCES sensors(sensor_id),
    timestamp TIMESTAMP,
    value DOUBLE PRECISION
);

-- ALARMS table
CREATE TABLE alarms (
    alarm_id SERIAL PRIMARY KEY,
    plc_id INT REFERENCES plcs(plc_id),
    timestamp TIMESTAMP,
    code VARCHAR(20),
    severity VARCHAR(10),
    description TEXT
);

-- SHIFTS table
CREATE TABLE shifts (
    shift_id SERIAL PRIMARY KEY,
    operator VARCHAR(50),
    start_time TIMESTAMP,
    end_time TIMESTAMP
);
