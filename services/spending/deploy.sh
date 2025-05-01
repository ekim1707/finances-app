aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 504347844373.dkr.ecr.region.amazonaws.com

docker build -t backend-api ./backend
docker tag backend-api:latest <ecr-url>/backend-api:latest
docker push <ecr-url>/backend-api:latest