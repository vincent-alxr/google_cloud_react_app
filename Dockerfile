FROM node:18
WORKDIR /app
COPY . .
RUN npm install
RUN npm build

FROM nginx:1.25.1
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=node /app/build/ /usr/share/nginx/html
EXPOSE 80