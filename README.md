# PostgreSQL Database Setup

This setup provides a PostgreSQL database using Docker with an initial schema and data. The database is configured for a user management system with roles and users.

## Requirements

- Docker 3.8 or higher
- PostgreSQL image version: `16.1`

## Database Details

- **Database Name:** `userdb`
- **Username:** `beta`
- **Password:** `beta`
- **Tables:**
  - `rol`: Stores roles with permissions.
  - `users`: Stores user information, linked to roles.

## Schema

### Table: `rol`

| Column       | Type         | Constraints           |
|--------------|--------------|-----------------------|
| `id`         | `serial`     | Primary Key           |
| `name`       | `varchar(50)`| Not Null              |
| `description`| `text`       |                       |
| `logo`       | `varchar(255)`|                       |
| `created_at` | `TIMESTAMP`  | Not Null              |
| `updated_at` | `TIMESTAMP`  | Not Null              |

### Table: `users`

| Column       | Type          | Constraints                    |
|--------------|---------------|--------------------------------|
| `id`         | `serial`      | Primary Key                   |
| `id_rol`     | `bigint`      | Foreign Key -> `rol(id)`      |
| `name`       | `varchar(50)` |                                |
| `photo`      | `text`        |                                |
| `address`    | `text`        |                                |
| `email`      | `varchar(50)` | Unique                        |
| `password`   | `varchar(255)`|                                |
| `created_at` | `TIMESTAMP`   |                                |
| `updated_at` | `TIMESTAMP`   |                                |

### Relationships

- `users.id_rol` references `rol.id` (on delete cascade).

## Initial Data

### Roles

| Name      | Description                  | Logo                       |
|-----------|------------------------------|----------------------------|
| Admin     | Role with full permissions   | `/images/admin_logo.png`   |
| Viewer    | Role with read-only access   | `/images/viewer_logo.png`  |

### Users

| Name           | Email            | Address       | Role       | Password   |
|----------------|------------------|---------------|------------|------------|
| administrador  | admin@admin.com  | kr24E # 8-11  | Admin      | admin123   |
| Luis Herrera   | luis@user.com    | kr54a # 1-87  | Admin      | user123    |

## Usage

### Docker Compose Configuration

```yaml
version: '3.8'

services:
  db:
    image: postgres:16.1
    container_name: db-sensor
    restart: always
    volumes:
      - ./sql/create_schema.sql:/docker-entrypoint-initdb.d/create_schema.sql
      - ./sql/data.sql:/docker-entrypoint-initdb.d/data.sql
    environment:
      POSTGRES_DB: 'userdb'
      POSTGRES_USER: 'beta'
      POSTGRES_PASSWORD: 'beta'
    ports:
      - '5432:5432'
```

### Steps to Run

1. **Ensure Docker is installed and running.**
2. **Clone this repository** and navigate to the project directory.
3. **Create the SQL files:**
   - `create_schema.sql`: Defines the database schema.
   - `data.sql`: Inserts initial data.
4. **Run the following command to start the database:**

   ```bash
   docker-compose up -d
   ```

5. **Access the database:**

   - Use a database client like `psql`, DBeaver, or pgAdmin.
   - Connect to `localhost:5432` using the credentials specified above.

### Stopping the Database

To stop the database container:

```bash
docker-compose down
```

## Notes

- Ensure the file paths for `create_schema.sql` and `data.sql` are correct relative to the Docker Compose file.
- Passwords and sensitive data should not be hardcoded in production environments. Consider using `.env` files for better security.
- The provided password hashes are bcrypt-encoded for better security.
