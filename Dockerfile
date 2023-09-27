# pulling base image nodejs v14 from docker hub 
FROM node:14
# create and set working directory to /app on container
WORKDIR /app
# copy all file in current local host directory to container working directory
COPY . .
# set container environment variable
ENV NODE_ENV=production DB_HOST=item-db
# installing dependencies for production environment then build app
RUN npm install --production --unsafe-perm && npm run build
# expose app on port 8080
EXPOSE 8080
# after container launched, start the server with "npm start" command
CMD ["npm", "start"]