FROM node:20

WORKDIR /usr/src/app

COPY package* .
COPY ./prisma .
    
RUN npm install
RUN npx prisma generate


COPY . .
RUN npm run build
# Any others cmd's to setup the project locally

EXPOSE 3000

CMD [ "node","dist/index.js" ]