# Stage 1
FROM  nginx:1.17.1-alpine as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build --prod

# Stage 2
FROM nginxinc/nginx-unprivileged
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=build-step /app/dist/* /usr/share/nginx/html
    
    
  
  

