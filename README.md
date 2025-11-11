# Docker-Practice
Creating this repository to learn about Docker

1) Created First index.html with simple hello World! and dockarized this .
2) Commands used:
     docker build -t "image-name" . : It Created the image
     docker run -p 5000:5000 "image-name" : It created the container, started it and mapped with my machines's port 5000. Without -p , I wasn't able to see "hello world" page on any of my machine's port because http-server was started on container's localhost.
3) Containerized Apache Web server, folder: Apache-Docker
    command: docker build -t "image-name" .
    docker run -p 5000:80 "image-name"

4) Containerized Simple Python Flask Application
