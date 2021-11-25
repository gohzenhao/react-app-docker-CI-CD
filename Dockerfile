FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
#no need to 'start' ngix cause it automatically starts when we call the base image


#Elastic bean stalk will look for EXPOSE instruction and use that as the port that get map to incoming traffics