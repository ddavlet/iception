# Inception

## 🐳 Overview
This project focuses on the use of **Docker** and **Docker Compose** to set up and manage a multi-service architecture. It is part of the [42 School](https://www.42berlin.de/en/program/curriculum/) curriculum and designed to teach containerization and infrastructure management.

## 🚀 Features
- **Nginx**: Web server setup.
- **WordPress**: CMS container.
- **MariaDB**: Database management.
- **Docker Compose**: Multi-container orchestration.
**Bonus fetures**:
- **Restic:** Database and Wordpress data backup
- **FTP:** File transfer pointing to Wordpress files
- **Adminer:** Database management tool
- **Notifier:** Telegram bot notification if service is down
- **Static page:** Static web page with information on subject and key features

## 🛠️ Getting Started
1. Clone the repository:
  ```bash
  git clone https://github.com/ddavlet/inception.git
  ```
2. Build and start the services:
  ```bash
  docker-compose up --build
  ```
## 🧪 Testing
Run the services and access the web application through the browser at localhost.

