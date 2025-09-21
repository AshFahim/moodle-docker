# Moodle Docker Development Environment

A complete Docker-based development environment for Moodle LMS with PostgreSQL database and pgAdmin interface.

## 📋 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Detailed Setup](#detailed-setup)
- [Usage](#usage)
- [Development](#development)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)
- [Project Structure](#project-structure)

## 🚀 Overview

This Docker setup provides a complete Moodle development environment with:
- **Moodle 4.4.10** (not the latest version, Haven't test the letest one yet)
- **PHP 8.3** with Apache
- **PostgreSQL 17** database
- **pgAdmin 4** for database management
- **Local file mounting** for easy development

## 📋 Prerequisites

Before you begin, ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/) (version 20.10 or higher)
- [Docker Compose](https://docs.docker.com/compose/install/) (version 2.0 or higher)
- Git (for cloning Moodle files)

## ⚡ Quick Start

1. **Clone this repository:**
   ```bash
   git clone https://github.com/AshFahim/moodle-docker.git
   cd moodle_docker
   ```

2. **Download and setup Moodle files:**
   ```bash
   # Download Moodle 4.4.10
   wget -O moodle-latest.tgz https://download.moodle.org/download.php/direct/stable404/moodle-latest-404.tgz
   
   # Extract to moodle directory
   tar -xzf moodle-latest.tgz -C moodle --strip-components=1
   
   # Clean up
   rm moodle-latest.tgz
   ```

3. **Start the environment:**
   ```bash
   docker-compose up -d --build
   ```

4. **Access Moodle:**
   - Open your browser and go to `http://localhost`
   - Follow the Moodle installation wizard

## 🔧 Detailed Setup

### Step 1: Repository Setup

```bash
# Clone the repository
git clone <your-repository-url>
cd moodle_test

# Create moodle directory
mkdir moodle
```

### Step 2: Download Moodle

You have several options to get Moodle files:

#### Option A: Download from Official Site (Recommended)
```bash
# Download Moodle 4.4.10
wget -O moodle-latest.tgz https://download.moodle.org/download.php/direct/stable404/moodle-latest-404.tgz

# Extract to moodle directory
tar -xzf moodle-latest.tgz -C moodle --strip-components=1

# Clean up
rm moodle-latest.tgz
```

#### Option B: Clone from GitHub
```bash
# Clone Moodle repository
git clone https://github.com/moodle/moodle.git moodle

# Switch to stable branch
cd moodle
git checkout MOODLE_404_STABLE
cd ..
```

#### Option C: Use Existing Moodle Installation
```bash
# Copy your existing Moodle files
cp -r /path/to/your/moodle/* ./moodle/
```

### Step 3: Start Docker Environment

```bash
# Build and start all services
docker-compose up -d --build

# Check if all containers are running
docker-compose ps
```

## 🎯 Usage

### Accessing Services

| Service | URL | Credentials |
|---------|-----|-------------|
| **Moodle** | http://localhost | Setup during installation |
| **pgAdmin** | http://localhost:81 | admin@admin.com / adminpassword |

### Database Configuration

When setting up Moodle, use these database credentials:

- **Database type**: PostgreSQL
- **Database host**: `postgres`
- **Database name**: `moodle`
- **Database user**: `moodle_user`
- **Database password**: `moodle_password`
- **Database port**: `5432`

### Managing the Environment

```bash
# Start services
docker-compose up -d

# Stop services
docker-compose down

# Stop and remove volumes (⚠️ This will delete all data)
docker-compose down --volumes

# View logs
docker-compose logs -f

# View specific service logs
docker-compose logs -f moodleapp
```

## 💻 Development

### File Structure

```
moodle_test/
├── docker-compose.yml      # Docker services configuration
├── dockerfile              # Moodle container configuration
├── entrypoint.sh          # Container startup script
├── moodle/                # Moodle files (mounted to container)
│   ├── index.php
│   ├── config.php
│   └── ...
└── README.md              # This file
```
