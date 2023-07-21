FROM node:18 AS node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.25.1
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=node /app/build/ /usr/share/nginx/html
EXPOSE 80