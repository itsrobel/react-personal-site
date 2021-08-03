FROM node:16-alpine

RUN mkdir -p /app
WORKDIR /app

COPY package.json /app
RUN npm install

COPY . /app
RUN npm run build

# FROM nginx:1.20.1-alpine
# COPY --from=build /app/build /usr/share/nginx/html
# # RUN rm /etc/nginx/conf.d/default.conf
# # COPY nginx/nginx.conf /etc/nginx/cnf.d
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]
EXPOSE 9000
CMD ["npm", "start"]