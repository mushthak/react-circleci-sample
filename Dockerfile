# Stage 0 : build environment
FROM node:14.16.0 as builder
RUN mkdir /usr/src/app
# set working directory
WORKDIR /usr/src/app
# add `/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH
# install app dependencies
COPY package.json /usr/src/app/package.json
RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent
# add app
COPY . /usr/src/app
RUN npm run build

# production environment
# Stage 1 : push the compressed  built app into nginx
FROM nginx:stable-alpine
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] 