# pull image dari docker.io dan label sebagai base image
FROM node:18-alpine as base
# working directory
WORKDIR /src
# copy file dari local ke working directory
COPY package*.json ./

# gunakan image base dan label sebagai production image
FROM base as production
# tambahan environment
ENV NODE_ENV=production

# jalankan npm clean install (packages from the package-lock.json file)
RUN npm ci
# copy file dari local ke working directory
COPY ./*.js ./
COPY ./.env ./
# command saat container ready
CMD ["node", "index.js"]

# gunakan image base dan label sebagai dev image
FROM base as dev
# install bash apk 
RUN apk add --no-cache bash
# download file dari link
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
# ubah permission file agar dapat di execute
RUN chmod +x /bin/wait-for-it.sh

# tambahan environment
ENV NODE_ENV=development
# jalan kan npm install (package from node_modules cache)
RUN npm install
# copy file dari local ke working directory
COPY ./*.js ./
COPY ./.env ./
# command saat container ready
CMD ["node", "index.js"]
