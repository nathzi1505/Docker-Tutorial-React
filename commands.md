# Commands

```
$ docker build -t nathzi1505/frontend -f Dockerfile.dev .
$ docker run -it nathzi1505/frontend npm run test
$ docker run -it -p 8080:3000 -v /app/node_modules -v$(pwd):/app nathzi1505/frontend

$ docker-compose ps
$ docker exec -it frontend_web_1 npm run test
```