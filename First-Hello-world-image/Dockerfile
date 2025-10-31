FROM node:20.18.1

WORKDIR /app

COPY index.html .

RUN npm install -g http-server

EXPOSE 5000

CMD ["http-server", "-p", "5000", "-a", "0.0.0.0"]