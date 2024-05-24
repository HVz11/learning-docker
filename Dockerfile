FROM node:20

WORKDIR /app

COPY . .

RUN npm install
RUN npx prisma generate
RUN npm run build
# Any others cmd's to setup the project locally

EXPOSE 3000

CMD [ "node","dist/index.js" ]