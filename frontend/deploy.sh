aws ecr get-login-password | docker login --username AWS --password-stdin 504347844373.dkr.ecr.region.amazonaws.com

docker build -t frontend-app ./frontend
docker tag frontend-app:latest <ecr-url>/frontend-app:latest
docker push <ecr-url>/frontend-app:latest