docker build -t bestpracticeimg:1.0.0 -f thin.dockerfile .
docker run -d --cpus="0.1" --memory="256m" -p 8000:5000  --name bestpracticecont bestpracticeimg:1.0.0