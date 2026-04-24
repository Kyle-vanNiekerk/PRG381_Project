# Delicious Catering Event Management System

This project is a university assignment (circa 2021) for an event management system, designed to handle client bookings, event planning, and catering logistics. The system is implemented in Java and uses a layered architecture.

## Project Structure

- **BusinessLogicLayer/**: Core business logic for events, bookings, clients, venues, food, and decor.
- **DataAccessLayer/**: Handles database connections and file operations.
- **PresentationLayer/**: User interface and program entry point.
- **DatabaseCreation.sql**: SQL script for initializing the database schema.

## Features

- Add and manage clients
- Book and manage events (with venue, food, and decor options)
- Calculate event pricing with discounts for large groups
- Store and retrieve data using file and database operations

## Main Classes

- `Program.java`: Main entry point with a console menu for user interaction
- `ProgramMethods.java`: Implements menu actions (add client, add/view/edit event)
- `Bookings.java`, `Event.java`: Core event and booking logic
- `Client.java`, `Venue.java`, `Food.java`, `Decor.java`: Represent domain entities
- `DBConnection.java`, `FileHandlerClass.java`, `Operations.java`: Data access and persistence

## How to Run

1. Ensure you have Java (JDK 8+) installed.
2. Set up the database using `DatabaseCreation.sql` (SQL Server recommended).
3. Compile the Java files:
   ```sh
   javac BusinessLogicLayer/*.java DataAccessLayer/*.java PresentationLayer/*.java
   ```
4. Run the program:
   ```sh
   java PresentationLayer.Program
   ```

## Notes

- This project was created for educational purposes and may not follow modern best practices.
- Some files (e.g., test files) are included for demonstration/testing.
- The system uses console input/output for interaction.

## License

This project is for academic use only. No warranty or support is provided.
