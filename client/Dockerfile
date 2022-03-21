FROM node:14
RUN mkdir -p /usr/src/client
WORKDIR /usr/src/client
# Install app dependencies
COPY package.json .
# COPY yarn.lock /usr/src/client/
# RUN npm install -g yarn
# RUN yarn
RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]

