-- Create Train Booking Database Schema

-- Table: train_station
CREATE TABLE train_station (
    id INT PRIMARY KEY,
    station_name VARCHAR(255) NOT NULL
);

-- Table: schedule
CREATE TABLE schedule (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Table: carriage_class
CREATE TABLE carriage_class (
    id INT PRIMARY KEY,
    class_name VARCHAR(255) NOT NULL,
    seating_capacity INT NOT NULL
);

-- Table: train_journey
CREATE TABLE train_journey (
    id INT PRIMARY KEY,
    schedule_id INT NOT NULL,
    name VARCHAR(255),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

-- Table: journey_station
CREATE TABLE journey_station (
    journey_id INT NOT NULL,
    station_id INT NOT NULL,
    stop_order INT NOT NULL,
    departure_time DATETIME,
    PRIMARY KEY (journey_id, station_id),
    FOREIGN KEY (journey_id) REFERENCES train_journey(id),
    FOREIGN KEY (station_id) REFERENCES train_station(id)
);

-- Table: journey_carriage
CREATE TABLE journey_carriage (
    journey_id INT NOT NULL,
    carriage_class_id INT NOT NULL,
    position INT NOT NULL,
    PRIMARY KEY (journey_id, carriage_class_id),
    FOREIGN KEY (journey_id) REFERENCES train_journey(id),
    FOREIGN KEY (carriage_class_id) REFERENCES carriage_class(id)
);

-- Table: carriage_price
CREATE TABLE carriage_price (
    schedule_id INT NOT NULL,
    carriage_class_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (schedule_id, carriage_class_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id),
    FOREIGN KEY (carriage_class_id) REFERENCES carriage_class(id)
);

-- Table: passenger
CREATE TABLE passenger (
    id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email_address VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Table: booking_status
CREATE TABLE booking_status (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Table: booking
CREATE TABLE booking (
    id INT PRIMARY KEY,
    passenger_id INT NOT NULL,
    status_id INT NOT NULL,
    booking_date DATE NOT NULL,
    starting_station_id INT NOT NULL,
    ending_station_id INT NOT NULL,
    train_journey_id INT NOT NULL,
    ticket_class_id INT NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    ticket_no INT NOT NULL,
    seat_no INT NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES passenger(id),
    FOREIGN KEY (status_id) REFERENCES booking_status(id),
    FOREIGN KEY (starting_station_id) REFERENCES train_station(id),
    FOREIGN KEY (ending_station_id) REFERENCES train_station(id),
    FOREIGN KEY (train_journey_id) REFERENCES train_journey(id),
    FOREIGN KEY (ticket_class_id) REFERENCES carriage_class(id)
);

-- Populate the Train Booking Database with Sample Data

-- Insert data into train_station
INSERT INTO train_station (id, station_name) VALUES
(1, 'Nairobi Station'),
(2, 'South Nyanza Station'),
(3, 'Kilifi Station'),
(4, 'Kericho Central Station'),
(5, 'Nandi Cross Station'),
(6, 'Kakamega Street Station'),
(7, 'Thika Station'),
(8, 'Madaraka Station'),
(9, 'Kaimosi Station'),
(10, 'Malindi Station');

-- Insert data into schedule
INSERT INTO schedule (id, name) VALUES
(1, 'Weekday'),
(2, 'Weekend'),
(3, 'Public Holiday'),
(4, 'Special Event'),
(5, 'Night Schedule');

-- Insert data into carriage_class
INSERT INTO carriage_class (id, class_name, seating_capacity) VALUES
(1, 'First Class', 20),
(2, 'Business', 50),
(3, 'Economy', 150),
(4, 'Sleeper', 40),
(5, 'Luxury', 10);

-- Insert data into train_journey
INSERT INTO train_journey (id, schedule_id, name) VALUES
(1, 1, '9:05 Nairobi Station to South Nyanza Station'),
(2, 2, '12:45 Kilifi Station to Kericho Central Station'),
(3, 3, '14:00 Nandi Cross Station to Kakamega Street Station'),
(4, 4, '16:30 Thika to Madaraka'),
(5, 5, '20:00 Kaimosi to Malindi');

-- Insert data into journey_station
INSERT INTO journey_station (journey_id, station_id, stop_order, departure_time) VALUES
(1, 1, 1, '2025-01-10 09:05:00'),
(1, 2, 2, '2025-01-10 11:10:00'),
(2, 3, 1, '2025-01-10 12:45:00'),
(2, 4, 2, '2025-01-10 14:50:00'),
(3, 5, 1, '2025-01-10 14:00:00'),
(3, 6, 2, '2025-01-10 15:30:00'),
(4, 7, 1, '2025-01-10 16:30:00'),
(4, 8, 2, '2025-01-10 17:50:00'),
(5, 9, 1, '2025-01-10 20:00:00'),
(5, 10, 2, '2025-01-10 22:10:00');

-- Insert data into journey_carriage
INSERT INTO journey_carriage (journey_id, carriage_class_id, position) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(2, 1, 1),
(2, 4, 2),
(3, 2, 1),
(3, 5, 2),
(4, 3, 1),
(4, 4, 2),
(5, 5, 1);

-- Insert data into carriage_price
INSERT INTO carriage_price (schedule_id, carriage_class_id, price) VALUES
(1, 1, 100.00),
(1, 2, 75.00),
(1, 3, 50.00),
(2, 1, 120.00),
(2, 3, 60.00),
(3, 2, 85.00),
(3, 4, 90.00),
(4, 1, 150.00),
(4, 5, 200.00),
(5, 3, 45.00);

-- Insert data into passenger
INSERT INTO passenger (id, first_name, last_name, email_address, password) VALUES
(1, 'John', 'Doe', 'john.doe@mail.com', 'password123'),
(2, 'Jane', 'Smith', 'jane.smith@mail.com', 'password456'),
(3, 'James', 'Brown', 'james.brown@mail.com', 'password789'),
(4, 'Emily', 'Clark', 'emily.clark@mail.com', 'password321'),
(5, 'Michael', 'Jones', 'michael.jones@mail.com', 'password654'),
(6, 'Sophia', 'Taylor', 'sophia.taylor@mail.com', 'password987'),
(7, 'Daniel', 'Wilson', 'daniel.wilson@mail.com', 'password111'),
(8, 'Olivia', 'Moore', 'olivia.moore@mail.com', 'password222'),
(9, 'Lucas', 'White', 'lucas.white@mail.com', 'password333'),
(10, 'Ava', 'Martin', 'ava.martin@mail.com', 'password444');

-- Insert data into booking_status
INSERT INTO booking_status (id, name) VALUES
(1, 'Active'),
(2, 'Cancelled'),
(3, 'Pending');

-- Insert data into booking
INSERT INTO booking (id, passenger_id, status_id, booking_date, starting_station_id, ending_station_id, train_journey_id, ticket_class_id, amount_paid, ticket_no, seat_no) VALUES
(1, 1, 1, '2025-01-08', 1, 2, 1, 1, 100.00, 101, 1),
(2, 2, 1, '2025-01-08', 3, 4, 2, 2, 75.00, 102, 2),
(3, 3, 2, '2025-01-09', 5, 6, 3, 3, 50.00, 103, 3),
(4, 4, 3, '2025-01-09', 7, 8, 4, 4, 90.00, 104, 4),
(5, 5, 1, '2025-01-10', 9, 10, 5, 5, 200.00, 105, 5),
(6, 6, 1, '2025-01-10', 1, 3, 1, 2, 75.00, 106, 6),
(7, 7, 2, '2025-01-11', 2, 4, 2, 3, 60.00, 107, 7),
(8, 8, 1, '2025-01-11', 5, 7, 3, 4, 85.00, 108, 8),
(9, 9, 3, '2025-01-12', 6, 8, 4, 5, 150.00, 109, 9),
(10, 10, 1, '2025-01-12', 9, 10, 5, 1, 100.00, 110, 10);

-- Display all data from each table in the database

-- Select all from train_station
SELECT * FROM train_station;

-- Select all from schedule
SELECT * FROM schedule;

-- Select all from carriage_class
SELECT * FROM carriage_class;

-- Select all from train_journey
SELECT * FROM train_journey;

-- Select all from journey_station
SELECT * FROM journey_station;

-- Select all from journey_carriage
SELECT * FROM journey_carriage;

-- Select all from carriage_price
SELECT * FROM carriage_price;

-- Select all from passenger
SELECT * FROM passenger;

-- Select all from booking_status
SELECT * FROM booking_status;

-- Select all from booking
SELECT * FROM booking;
