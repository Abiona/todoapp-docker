from node:18-alpine as installer

WORKDIR /app

COPY Package*.json ./ 
RUN npm install

COPY . .

RUN npm RUN build

FROM ngnix:latest as deployer

COPY --from=installer app/build /usr/share/nginx/html
