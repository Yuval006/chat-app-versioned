docker build -t homeappimg .
docker run -it -p 5000:5000  --name homeappcont homeappimg