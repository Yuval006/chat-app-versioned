docker build -t homeappimg .
docker run -it -v ./rooms:/app/rooms -v ./docs/users.csv:/app/users.csv -p 5000:5000  --name homeappcont homeappimg