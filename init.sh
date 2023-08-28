docker build -t bestpracticeimg -f thin.dockerfile .
docker run -d -p 8000:5000  -v ./docs/:/app/docs/ --name bestpracticecont bestpracticeimg