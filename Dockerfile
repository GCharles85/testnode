#Uses the node image template to create an image which we 
#can use to make a container in the command line

# docker build -t <imagename>/<home directory name> . 
# above is to create an image
# docker images -> lists images created, manage with IDs
# docker run -p <port:port> <image to use/home dir> -> to make a container
#docker ps -> to get container(s)'s info
# to stop or kill container - docker stop/kill ID
FROM node

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

COPY package*.json /usr/src/app
 
RUN npm install

ADD . /usr/src/app

EXPOSE 4000
CMD ["npm", "start"]