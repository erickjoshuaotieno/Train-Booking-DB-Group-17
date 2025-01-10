# Train Booking Database

## Overview
The Train Booking Database is a relational database designed to manage a train booking system. It supports features like passenger management, journey scheduling, booking reservations, and pricing. This README provides an overview of the database design, its key entities, relationships, and the Entity-Relationship Diagram (ERD).

## Database Design
The database consists of ten interconnected tables that collectively represent the structure of a train booking system. Below is a summary of the core entities and their purpose:

### 1. **train_station**
- Represents train stations where journeys start or end.
- **Key Attributes:**
  - `id`: Unique identifier for each station.
  - `station_name`: Name of the station.

### 2. **schedule**
- Manages different schedule types like weekdays, weekends, and holidays.
- **Key Attributes:**
  - `id`: Unique identifier for each schedule.
  - `name`: Name of the schedule.

### 3. **carriage_class**
- Defines the types of carriages available on trains, such as Economy, Business, and First Class.
- **Key Attributes:**
  - `id`: Unique identifier for each class.
  - `class_name`: Name of the carriage class.
  - `seating_capacity`: Number of seats in this class.

### 4. **train_journey**
- Tracks individual train journeys and their schedules.
- **Key Attributes:**
  - `id`: Unique identifier for each journey.
  - `schedule_id`: Links to the schedule for this journey.
  - `name`: Description of the journey.

### 5. **journey_station**
- Represents the stations and stops associated with each journey.
- **Key Attributes:**
  - `journey_id`: Links to the train journey.
  - `station_id`: Links to the station.
  - `stop_order`: Order of the stops on the journey.
  - `departure_time`: Departure time from the station.

### 6. **journey_carriage**
- Tracks the carriages assigned to each train journey.
- **Key Attributes:**
  - `journey_id`: Links to the train journey.
  - `carriage_class_id`: Links to the carriage class.
  - `position`: Position of the carriage in the train.

### 7. **carriage_price**
- Manages the price for each class of carriage based on schedule type.
- **Key Attributes:**
  - `schedule_id`: Links to the schedule.
  - `carriage_class_id`: Links to the carriage class.
  - `price`: Price for the combination.

### 8. **passenger**
- Stores details of passengers using the booking system.
- **Key Attributes:**
  - `id`: Unique identifier for each passenger.
  - `first_name`, `last_name`: Passenger's name.
  - `email_address`: Contact email.
  - `password`: Encrypted password for login.

### 9. **booking_status**
- Defines the status of bookings, such as Active, Cancelled, or Pending.
- **Key Attributes:**
  - `id`: Unique identifier for each status.
  - `name`: Status name.

### 10. **booking**
- Manages reservations made by passengers.
- **Key Attributes:**
  - `id`: Unique identifier for each booking.
  - `passenger_id`: Links to the passenger.
  - `status_id`: Links to the booking status.
  - `starting_station_id`, `ending_station_id`: Links to the start and end stations.
  - `train_journey_id`: Links to the train journey.
  - `ticket_class_id`: Links to the carriage class.
  - `amount_paid`, `ticket_no`, `seat_no`: Payment and ticket details.

## Entity-Relationship Diagram (ERD)
The ERD below illustrates the relationships between the entities in the database. Key relationships include:

- **One-to-Many Relationships:**
  - `train_journey` → `journey_station`
  - `schedule` → `train_journey`
  - `carriage_class` → `journey_carriage`
  - `passenger` → `booking`

- **Many-to-Many Relationships:**
  - `train_journey` ↔ `journey_station` (via `journey_station`)
  - `schedule` ↔ `carriage_class` (via `carriage_price`)



## How to Use
1. Clone the repository.
2. Execute the SQL schema file (`booking.sql`) to set up the database.
3. Populate the database with sample data provided in the `populate.sql` file.
4. Use SQL queries to interact with the database for testing and validation.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

---

