# API Service User for Buildwith Fajar

- copy .env.example to .env
- install package with npm install or yarn install
- run with npm start or yarn start

- run migrate

```sh
npx sequelize db:migrate
```

- to undo migrate

```sh
npx sequelize db:migrate:undo:all
```

- run seed

```sh
npx sequelize db:seed
npx sequelize db:seed:all
```

- build image

```sh
docker build -t fajjarnr/bwf-service-user .
```

- docker run

```sh
docker run -d --name bwf-service-user -p 5000:5000 -e PORT="5000" -e DB_HOSTNAME="bwf-micro.cyh0sfq8vv2a.ap-southeast-3.rds.amazonaws.com" -e DB_NAME="service_user" -e DB_USERNAME="admin" DB_PASSWORD="rahasia123" fajjarnr/bwf-service-user
```
