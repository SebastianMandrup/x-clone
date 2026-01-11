# Twitter Clone - PHP Project
Twitter is a social media platform centered around posts/reposts. The App is build with an MVC pattern.

### Core Domain
- user authentication & profiles
- posts & reposts
- post & comment likes
- post bookmarking
- comment creation
- comment replies

### Technical Features
- API & BRIDGE structure
- file based $_SESSION
- pagination & filtering
- file upload & hosting

### Infrastructure
- hosted on simply.com
- https://mvndrup.com

### Development Environment
1. git pull <url>
2. docker compose up --build
3. localhost:8080 for phpmyadmin
4. import company.sql from /.misc
5. localhost:80 for app

### Interesting points for the exam:
- CD pipeline vs Filezilla
- handle-exception.php
- logger.php
- protect-endpoint.php
- backend dictionary vs dictionary