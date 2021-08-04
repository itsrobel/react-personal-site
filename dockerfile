FROM node:alpine

RUN mkdir -p /app
WORKDIR /app

COPY package.json /app
COPY package-lock.json /app
RUN npm install --silent

COPY . /app
RUN npm run build

EXPOSE 9000
CMD ["npm", "start"]