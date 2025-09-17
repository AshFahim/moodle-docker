#!/bin/bash

# Setup script for Moodle with H5P Interactive Content plugin
echo "Setting up Moodle with H5P Interactive Content plugin..."

# Create directories for H5P plugin
echo "Creating H5P plugin directory..."
mkdir -p h5p-plugin

# Download H5P Interactive Content plugin
echo "Downloading H5P Interactive Content plugin..."
cd h5p-plugin

# Download the latest H5P plugin from GitHub
wget -O hvp.zip https://github.com/h5p/h5p-moodle-plugin/archive/refs/heads/master.zip

# Extract the plugin
unzip hvp.zip
mv h5p-moodle-plugin-master/* .
rm -rf h5p-moodle-plugin-master hvp.zip

echo "H5P plugin downloaded and extracted successfully!"

# Create a README with instructions
cat > ../README.md << 'EOF'
# Moodle with H5P Interactive Content Plugin

This Docker Compose setup provides a complete Moodle installation with the H5P Interactive Content plugin.

## Quick Start

1. Start the services:
   ```bash
   docker-compose up -d
   ```

2. Wait for Moodle to initialize (this may take a few minutes on first run)

3. Access Moodle at: http://localhost:8080
   - Username: admin
   - Password: admin123

4. Access phpMyAdmin at: http://localhost:8081
   - Username: moodle
   - Password: moodlepassword

## H5P Plugin Installation

The H5P Interactive Content plugin is automatically mounted to `/bitnami/moodle/mod/hvp` in the container.

After Moodle is running:

1. Log in as admin
2. Go to Site administration > Plugins > Install plugins
3. The H5P plugin should be detected automatically
4. Install and enable the plugin

## Features Included

- Moodle LMS with H5P support
- MariaDB database
- Redis caching
- phpMyAdmin for database management
- Persistent data storage
- Pre-configured for H5P Interactive Content

## Configuration

- Moodle URL: http://localhost:8080
- Database: MariaDB (moodle/moodlepassword)
- Cache: Redis
- PHP Memory Limit: 512M
- Upload Max Filesize: 100M

## Troubleshooting

If you encounter issues:

1. Check container logs: `docker-compose logs moodle`
2. Ensure all services are running: `docker-compose ps`
3. Restart services: `docker-compose restart`

## Stopping the Services

```bash
docker-compose down
```

To remove all data (WARNING: This will delete all Moodle data):
```bash
docker-compose down -v
```
EOF

echo "Setup complete! Check README.md for instructions."
