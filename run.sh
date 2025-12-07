export GITLAB_HOME=$HOME
docker run --detach \
  --hostname localhost \
  --env GITLAB_OMNIBUS_CONFIG="external_url 'http://localhost:8929'" \
  --publish 443:443 --publish 8929:8929 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ce:latest

docker exec -it gitlab update-permissions

read -n 1 -s -r -p "Press any key to continue..."
