FROM resin/raspberrypi3-node:8.5

# Initial dependencies
RUN apt-get update
RUN apt-get install -y fswebcam
RUN npm install -g yarn

# Set app dir
WORKDIR /usr/src/app

# Copy
COPY package.json package.json

# This install npm dependencies on the resin.io build server,
# making sure to clean up the artifacts it creates in order to reduce the image size.
# RUN JOBS=MAX npm install --production && npm cache clean && rm -rf /tmp/*
RUN yarn install

# This will copy all files in our root to the working  directory in the container
COPY . ./

# Enable systemd init system in container
ENV INITSYSTEM on

# server.js will run when container starts up on the device
CMD ["npm", "start"]
