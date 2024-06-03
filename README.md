# Laravel Docker Boilerplate

This repository is a boilerplate for running Laravel applications using Docker. Follow the instructions below to get your Laravel application up and running.

## Prerequisites

Make sure you have the following installed on your system:

- Docker
- Docker Compose

## Getting Started

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/laravel-docker-boilerplate.git
   cd laravel-docker-boilerplate
   ```

2. **Create Environment File**
Copy the example environment file and update the variables as needed:

   ```bash
    cp .env.example .env
   ```
Edit the .env file to set your database credentials and any other environment variables required by your Laravel application.

3. **Build the Docker Containers**

   ```bash
   docker compose up --build -d
   ```
   
4. **Install Composer Dependencies**
   Access the application container and install the required PHP dependencies:

   ```bash
    docker compose exec app composer install
    ```
5. **Generate Laravel Application Key**

   ```bash
   docker compose exec app php artisan key:generate
   ```
6. **Run Migrations**

   ```bash
   docker compose exec app php artisan migrate
   ```
7. **Access the Application**

   Visit `http://localhost` in your browser to access the Laravel application.

## Docker Compose Services
- app: The Laravel application container.
- mysql: MySQL 8.0 database container.
- nginx: Nginx server container.
- redis: Redis cache container.

## Network Configuration
All services are connected through the laravel_docker_network.
- ./docker-compose/mysql_data:/var/lib/mysql: Persistent storage for MySQL database.
- ./docker-compose/nginx:/etc/nginx/conf.d/: Nginx configuration files.
