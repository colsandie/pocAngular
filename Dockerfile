# Stage 1
FROM node:10-alpine as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build --prod

# Stage 2
FROM bitnami/nginx:latest
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=build-step /app/dist/* /usr/share/nginx/html
COPY --from=build-step /app/dist/* /app
    
    
  
  

