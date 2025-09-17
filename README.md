# Moodle Docker with H5P Support

A complete Docker Compose setup for running Moodle LMS with H5P Interactive Content plugin support, MariaDB database, and phpMyAdmin for database management.

## 🚀 Features

- **Moodle 4.4** - Latest stable version of the Moodle Learning Management System
- **H5P Support** - Interactive content creation and delivery
- **MariaDB 10.11** - Reliable database backend
- **phpMyAdmin** - Web-based database management interface
- **Persistent Storage** - Data persists across container restarts
- **Pre-configured** - Ready to run with sensible defaults

## 📋 Prerequisites

- Docker and Docker Compose installed on your system
- At least 2GB of available RAM
- Ports 8080 and 8081 available on your host machine

## 🛠️ Quick Start

### 1. Clone and Setup

```bash
git clone <your-repo-url>
cd moodle-docker
```

### 2. Configure Environment (Optional)

Edit `moodle.env` to customize your Moodle installation:

```bash
# Default values
MOODLE_SITE_NAME=My Moodle Site
MOODLE_USERNAME=admin
MOODLE_PASSWORD=admin123
MOODLE_EMAIL=admin@example.com
```

### 3. Start the Services

```bash
docker-compose up -d
```

### 4. Wait for Initialization

The first startup may take 3-5 minutes as Moodle performs its initial setup. You can monitor the progress with:

```bash
docker-compose logs -f moodle
```

### 5. Access Your Moodle Site

- **Moodle**: http://localhost:8080
  - Username: `admin`
  - Password: `admin123`

- **phpMyAdmin**: http://localhost:8081
  - Username: `moodle`
  - Password: `moodlepassword`

## 🔧 H5P Plugin Setup

The H5P Interactive Content plugin is included in this setup. To enable it:

1. Log in to Moodle as admin
2. Navigate to **Site administration** → **Plugins** → **Install plugins**
3. The H5P plugin should be automatically detected
4. Install and enable the plugin
5. Configure H5P settings as needed

## 📁 Project Structure

```
moodle-docker/
├── docker-compose.yml    # Main Docker Compose configuration
├── moodle.env           # Environment variables
├── h5p-plugin/          # H5P plugin directory (auto-created)
├── setup-h5p.bat        # Windows setup script
├── setup-h5p.sh         # Linux/Mac setup script
└── README.md            # This file
```

## ⚙️ Configuration

### Environment Variables

Key configuration options in `moodle.env`:

| Variable | Default | Description |
|----------|---------|-------------|
| `MOODLE_SITE_NAME` | My Moodle Site | Display name for your Moodle site |
| `MOODLE_USERNAME` | admin | Admin username |
| `MOODLE_PASSWORD` | admin123 | Admin password |
| `MOODLE_EMAIL` | admin@example.com | Admin email address |
| `PHP_MEMORY_LIMIT` | 512M | PHP memory limit |
| `PHP_UPLOAD_MAX_FILESIZE` | 100M | Maximum file upload size |

### Ports

- **8080**: Moodle web interface
- **8081**: phpMyAdmin interface

### Volumes

- `moodle_data`: Moodle application data and files
- `mariadb_data`: MariaDB database files

## 🐳 Docker Services

### Moodle Service
- **Image**: `bitnami/moodle:4.4`
- **Container**: `moodle_app`
- **Port**: 8080
- **Features**: Full Moodle LMS with H5P support

### MariaDB Service
- **Image**: `bitnami/mariadb:10.11`
- **Container**: `moodle_db`
- **Database**: `moodle`
- **Features**: UTF8MB4 character set, persistent storage

### phpMyAdmin Service
- **Image**: `phpmyadmin/phpmyadmin:latest`
- **Container**: `moodle_phpmyadmin`
- **Port**: 8081
- **Features**: Web-based database management

