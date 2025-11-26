FROM node:v18.20.8-alphine
WORKDIR /app
ENV APP_PORT=3000
ADD . .
RUN npm install
CMD npm start
