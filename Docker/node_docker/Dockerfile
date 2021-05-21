# syntax=docker/dockerfile:1

# Image used to build
FROM node:12.18.1

# Enviroment development/production
ENV NODE_ENV=production

# path as the default location for all subsequentes commands
WORKDIR /app

# fils to be copied and the working directory ./ 
COPY [ "package.json", "package-lock.json*", "./" ]


#
RUN npm install --production 

# copy all the file in our current directory in the working directory
COPY . .

#
CMD [ "node", "server.js" ]

