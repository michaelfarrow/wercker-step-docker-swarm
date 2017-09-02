## Wercker Step - Docker Swarm

Deploy an image to a Docker Swarm cluster.

[![wercker status](https://app.wercker.com/status/9d35e3c6afc4d7d5afd4c8624b05543a/m "wercker status")](https://app.wercker.com/project/bykey/9d35e3c6afc4d7d5afd4c8624b05543a)

### Options:

- `manager` (required) Manager Docker Swarm node ip or fqdn.
- `user` (optional, default: `root`) The user to use when logging into the Docker Swarm Manager.
- `service` (optional) The Docker Swarm service name. Will use the git repo name if not supplied.
- `image` (required) The image to deploy.
- `tag` (required) The image tag to deploy.

### Initial Deploy

This deploy step will only handle updating of already existing services. It is recommended to run this step initially, and run the resulting create command manually on Swarm Manager. Subsequent deploys will then update accordingly.

### Example

```
deploy:
    steps:
        - internal/docker-push:
            username: $DOCKER_REGISTRY_USERNAME
            password: $DOCKER_REGISTRY_PASSWORD
            tag: $WERCKER_GIT_COMMIT
            repository: $DOCKER_REGISTRY_REPO
            registry: $DOCKER_REGISTRY
        - add-to-known_hosts:
            name: add to known hosts
            hostname: $DOCKER_SWARM_MANAGER
        - add-ssh-key:
            name: add ssh key
            keyname: DOCKER_SWARM_KEY
        - weyforth/docker-swarm:
            manager: $DOCKER_SWARM_MANAGER
            user: $DOCKER_SWARM_USER
            service: $DOCKER_SWARM_SERVICE_NAME
            image: $DOCKER_REGISTRY_REPO
            tag: $WERCKER_GIT_COMMIT
```
