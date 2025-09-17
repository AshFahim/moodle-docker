@echo off
echo Setting up Moodle with H5P Interactive Content plugin...

REM Create directories for H5P plugin
echo Creating H5P plugin directory...
if not exist h5p-plugin mkdir h5p-plugin

REM Download H5P Interactive Content plugin
echo Downloading H5P Interactive Content plugin...
cd h5p-plugin

REM Download the latest H5P plugin from GitHub
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/h5p/h5p-moodle-plugin/archive/refs/heads/master.zip' -OutFile 'hvp.zip'"

REM Extract the plugin
powershell -Command "Expand-Archive -Path 'hvp.zip' -DestinationPath '.' -Force"
powershell -Command "Move-Item -Path 'h5p-moodle-plugin-master\*' -Destination '.' -Force"
powershell -Command "Remove-Item -Path 'h5p-moodle-plugin-master' -Recurse -Force"
del hvp.zip

echo H5P plugin downloaded and extracted successfully!

REM Create a README with instructions
cd ..
(
echo # Moodle with H5P Interactive Content Plugin
echo.
echo This Docker Compose setup provides a complete Moodle installation with the H5P Interactive Content plugin.
echo.
echo ## Quick Start
echo.
echo 1. Start the services:
echo    ```bash
echo    docker-compose up -d
echo    ```
echo.
echo 2. Wait for Moodle to initialize ^(this may take a few minutes on first run^)
echo.
echo 3. Access Moodle at: http://localhost:8080
echo    - Username: admin
echo    - Password: admin123
echo.
echo 4. Access phpMyAdmin at: http://localhost:8081
echo    - Username: moodle
echo    - Password: moodlepassword
echo.
echo ## H5P Plugin Installation
echo.
echo The H5P Interactive Content plugin is automatically mounted to `/bitnami/moodle/mod/hvp` in the container.
echo.
echo After Moodle is running:
echo.
echo 1. Log in as admin
echo 2. Go to Site administration ^> Plugins ^> Install plugins
echo 3. The H5P plugin should be detected automatically
echo 4. Install and enable the plugin
echo.
echo ## Features Included
echo.
echo - Moodle LMS with H5P support
echo - MariaDB database
echo - Redis caching
echo - phpMyAdmin for database management
echo - Persistent data storage
echo - Pre-configured for H5P Interactive Content
echo.
echo ## Configuration
echo.
echo - Moodle URL: http://localhost:8080
echo - Database: MariaDB ^(moodle/moodlepassword^)
echo - Cache: Redis
echo - PHP Memory Limit: 512M
echo - Upload Max Filesize: 100M
echo.
echo ## Troubleshooting
echo.
echo If you encounter issues:
echo.
echo 1. Check container logs: `docker-compose logs moodle`
echo 2. Ensure all services are running: `docker-compose ps`
echo 3. Restart services: `docker-compose restart`
echo.
echo ## Stopping the Services
echo.
echo ```bash
echo docker-compose down
echo ```
echo.
echo To remove all data ^(WARNING: This will delete all Moodle data^):
echo ```bash
echo docker-compose down -v
echo ```
) > README.md

echo Setup complete! Check README.md for instructions.
pause
