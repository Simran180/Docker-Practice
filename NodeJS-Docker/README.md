# Node.js Docker Application

A simple Node.js web application with Express, containerized with Docker.

## 📋 Project Structure

```
NodeJS-Docker/
├── server.js          # Main Express server
├── package.json       # Node.js dependencies
├── Dockerfile        # Docker configuration
└── public/
    └── index.html    # Static HTML page
```

## 🚀 Features

- Express.js web server
- Health check API endpoint (`/api/health`)
- Beautiful, modern UI with responsive design
- Static file serving
- Fully containerized with Docker

## 📦 Prerequisites

- Docker installed on your system
- Node.js 18+ (if running without Docker)

## 🔨 Building and Running

### Using Docker (Recommended)

1. **Build the Docker image:**
   ```bash
   docker build -t nodejs-app .
   ```

2. **Run the container:**
   ```bash
   docker run -p 3000:3000 nodejs-app
   ```

3. **Access the application:**
   Open your browser and navigate to: `http://localhost:3000`

### Running Locally (Without Docker)

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Run the application:**
   ```bash
   npm start
   ```

3. **Access the application:**
   Open your browser and navigate to: `http://localhost:3000`

## 🛣️ API Endpoints

- `GET /` - Home page with UI
- `GET /api/health` - Health check endpoint (returns JSON with timestamp)

## 🐳 Docker Commands

### Build the image
```bash
docker build -t nodejs-app .
```

### Run the container
```bash
docker run -p 3000:3000 nodejs-app
```

### Run in detached mode
```bash
docker run -d -p 3000:3000 --name my-nodejs-app nodejs-app
```

### Stop the container
```bash
docker stop my-nodejs-app
```

### Remove the container
```bash
docker rm my-nodejs-app
```

### View container logs
```bash
docker logs my-nodejs-app
```

### Access container shell
```bash
docker exec -it my-nodejs-app sh
```

## 🧪 Testing the Application

Once the application is running, you can test it:

1. **Web Interface:** Visit `http://localhost:3000` in your browser
2. **Health Check:** Visit `http://localhost:3000/api/health` or click the "Check API Health" button on the web interface

Example health check response:
```json
{
  "status": "healthy",
  "message": "Node.js application is running!",
  "timestamp": "2025-11-11T09:00:00.000Z"
}
```

## 🛠️ Technology Stack

- **Node.js 18** - JavaScript runtime
- **Express 4.18.2** - Web framework
- **Docker** - Containerization platform

## 📝 Notes

- The application runs on port 3000 by default
- Uses Alpine Linux base image for smaller container size
- Static files are served from the `public/` directory
- For production, consider using a process manager like PM2

## 🎨 Features Included

- ✅ RESTful API structure
- ✅ Static file serving
- ✅ Health check endpoint
- ✅ Modern, responsive UI
- ✅ Docker optimization with Alpine image
- ✅ Error handling

## 🤝 Contributing

Feel free to fork this project and make your own modifications!

## 📄 License

This is a simple example project for learning purposes.

