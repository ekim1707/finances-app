# for reference
# push images made by docker-compose to Dockerhub
docker tag deploy_frontend ekim1707/frontend:latest
docker tag deploy_spending ekim1707/spending:latest
docker push ekim1707/frontend:latest
docker push ekim1707/spending:latest