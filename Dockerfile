FROM node:alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
EXPOSE 4200 80
COPY --from=0 /app/dist/docker-angular-app /usr/share/nginx/html