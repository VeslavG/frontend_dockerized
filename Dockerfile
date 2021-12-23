# Build phase
## use an existing docker image as a base

FROM node:16-alpine as builder
WORKDIR '/app'

## download and install a dependency

COPY package.json .
RUN npm install

COPY .  .

## start build process

RUN npm run build

# Run phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


