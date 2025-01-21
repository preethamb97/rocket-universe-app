# Universe Task Manager API

A RESTful API implementation for task management using Rocket Universe.

## Prerequisites

- Rocket Universe installed and configured
- SQL database access configured in Universe
- Basic knowledge of Universe BASIC programming

## File Structure

├── src/
│ ├── tasks_api.b # Main API implementation
│ ├── register_api.b # API registration program
│ └── test_tasks_api.b # Test suite
├── include/
│ ├── task_def.h # Task definitions
│ ├── config.h # Configuration settings
│ └── error_handling.h # Error handling utilities
└── sql/
└── tasks_schema.sql # Database schema



## Installation

1. Copy source files to your Universe programs directory:
   ```bash
   cp src/*.b /path/to/universe/programs/
   ```

2. Copy header files to your Universe includes directory:
   ```bash
   cp include/*.h /path/to/universe/includes/
   ```

3. Create database schema:
   ```bash
   uv
   SQL
   READ sql/tasks_schema.sql
   ```

4. Compile and catalog the API:
   ```bash
   uv
   BASIC BP TASKS.API tasks_api.b
   CATALOG BP TASKS.API
   ```

## API Endpoints

### GET /tasks
Retrieves all tasks

### GET /tasks/{id}
Retrieves a specific task by ID

### POST /tasks
Creates a new task

Request body:
```json
{
  "title": "Task Title",
  "description": "Task Description"
}
```


### PUT /tasks/{id}
Updates an existing task

Request body:
```json
{
  "title": "Updated Task Title",
  "description": "Updated Task Description"
}
```

### DELETE /tasks/{id}
Deletes a task by ID

## Testing

To test the API, run the test_tasks_api.b program:
```bash
uv
RUN BP TEST.TASKS
```

This will perform various tests on the API endpoints and print the results to the console.

## Notes

- Ensure your database is properly configured and accessible.
- Adjust the configuration settings in config.h as needed for your environment.
- This API is designed to be used with Rocket Universe, but can be adapted for other environments with appropriate modifications.


