<!-- ##  ============================================================  ## -->
##  DOCKER Badges
<!-- ##  ============================================================  ## -->

![dockeri.co](http://dockeri.co/image/tbaltrushaitis/ubuntu-nodejs)

<!-- ##  ============================================================  ## -->
##  DOCKER Commands
<!-- ##  ============================================================  ## -->

```shell
$ sudo docker pull store/percona/percona-server:5.7.14
```

```bash
# docker build -t mysql-percona:5.7 -f Dockerfile --force-rm --no-cache --pull .
# docker tag mysql-percona:5.7 tbaltrushaitis/mysql-percona:5.7
# docker push tbaltrushaitis/mysql-percona:5.7
```

```bash
# docker -D run                               \
        --name=app-db-master                \
        -t                                  \
        -e MYSQL_ROOT_PASSWORD='123123qa'   \
        -d tbaltrushaitis/mysql-percona:5.7

# docker build -t tbaltrushaitis/docker-mongodb:3.4 .

# docker -D create                                                          \
        --name=mongo_instance_0001                                          \
        --cap-add=ALL                                                       \
        -p 28017:27017                                                      \
        -v /storage/docker-assets/mongo_instance_001/:/dockerdata/mongodb/  \
        -it docker-mongodb_341_100:custom                                   \
        --dbpath /dockerdata/mongodb/

# docker start ${CONTAINER_ID}


# docker -D build -t tbaltrushaitis/gsmc-public:mongo .
# docker tag 1fd7a2402307 tbaltrushaitis/gsmc-public:mongo-3.4.0
# docker push tbaltrushaitis/gsmc-public:mongo-3.4.0

# docker -D run                                       \
        --name mongo_instance_001                   \
        -d tbaltrushaitis/gsmc-public:mongo-3.4.0

# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mongo_instance_001

### docker images
REPOSITORY                                TAG                 IMAGE ID            CREATED             SIZE
tbaltrushaitis/docker-mongodb             3.4                 698f1a70d787        14 seconds ago      388.2 MB
docker.io/tbaltrushaitis/docker-mongodb   latest              2ea6ca6f43d0        23 minutes ago      388.2 MB
docker.io/ubuntu                          16.04               104bec311bcd        2 weeks ago         128.9 MB

# docker tag 698f1a70d787 tbaltrushaitis/docker-mongodb:3.4.0
# docker push tbaltrushaitis/docker-mongodb:3.4.0

# docker -D run                                 \
        --name mongo_instance_010               \
        -d tbaltrushaitis/docker-mongodb:3.4.0  \
        -p 27017:28017

## 64f9abda79c40b09d5577b8333ddce1b6a9ed402c6144c714f36564d71039e70


# docker -D create    --name dbstore      \
                    -v /dbdata          \
                    training/postgres   \
                    /bin/true

# docker create   --name datakeeper       \
                -v /storage_mongodb     \
                -v /storage_logs        \
                ubuntu:16.04 /bin/true

```

<!-- ##  ============================================================  ## -->

```bash
docker build
            --pull
            -t lh/appcode
            .

docker run
            --name lh-appcode
            -it 97f27ae5dd5a
            /bin/bash
```

<!-- ##  ============================================================  ## -->
##  Docker Compose: default environment variables
<!-- ##  ============================================================  ## -->
##  https://docs.docker.com/compose/env-file/

Those environment variables will be used for variable substitution in your Compose file,
but can also be used to define the following CLI variables:

COMPOSE_API_VERSION
COMPOSE_CONVERT_WINDOWS_PATHS
COMPOSE_FILE
COMPOSE_HTTP_TIMEOUT
COMPOSE_TLS_VERSION
COMPOSE_PROJECT_NAME
DOCKER_CERT_PATH
DOCKER_HOST
DOCKER_TLS_VERIFY

<!-- ##  ============================================================  ## -->
##  Docker Volumes
<!-- ##  ============================================================  ## -->

```bash
docker volume create --driver local --label Storage-MongoDB --name storage_mongodb
docker volume create --driver local --label Storage-Mysql --name storage_mysql
docker volume create --driver local --label Storage-AppCode --name storage_appcode
```

### Just specify a path and let the Engine create a volume
```bash
  - /var/lib/mysql
```

### Specify an absolute path mapping

```bash
  - /opt/data:/var/lib/mysql
```

### Path on the host, relative to the Compose file
```bash
  - ./cache:/tmp/cache
```

### User-relative path
```bash
  - ~/configs:/etc/configs/:ro
```

### Named volume
```bash
  - datavolume:/var/lib/mysql
```

<!-- ##  ============================================================  ## -->
##  Docker Compose on CentOS 7
<!-- ##  ============================================================  ## -->

```bash
curl -L https://github.com/docker/compose/releases/download/1.10.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

<!-- ##  ============================================================  ## -->
##  Local Persist Volume Plugin for Docker
<!-- ##  ============================================================  ## -->

```bash
curl -fsSL https://raw.githubusercontent.com/CWSpear/local-persist/master/scripts/install.sh | sudo bash
```

<!-- ###  ============================================================  ## -->
##  RANCHER setup
<!-- ###  ============================================================  ## -->

###  Launching Management Server
```bash
docker run -d --restart=unless-stopped -p 8080:8080 rancher/server
```

###  Rancher Client
```bash
docker run  -d --privileged                                 \
            -v /var/run/docker.sock:/var/run/docker.sock    \
            -v /var/lib/rancher:/var/lib/rancher            \
            rancher/agent:v1.1.3                            \
            http://rancher.hunter-love.ru/v1/scripts/84C41DC810CDB3746BF6:1484733600000:pVBrrC3xrvqPE80tSdtUjGJo2o
```

<!-- ###  ============================================================  ## -->

```bash
docker build --rm -t "ubuntu:16.04" -f Dockerfile .
             --tag="docker.io/ubuntu:16.04" \
             -o "3070":"3070" \
             -v ${APP_DIR} \
```

```bash
docker build -m 1024M   \
             --no-cache  \
             --force-rm  \
             --pull       \
             -t "ubuntu:16.04" \
             -v "/storage:${APP_DIR}"   \
             -f Dockerfile     \
             .
```

```bash
docker tag "ubuntu:16.04" "tbaltrushaitis/nodejs:6.9.1"

docker push "tbaltrushaitis/nodejs:6.9.1"

docker run  -it \
            -a STDIN \
            -a STDOUT \
            -a STDER \
            --env-file=".env.src" \
            --expose="3070:3070" \
            "tbaltrushaitis/nodejs:6.9.1"

            --group-add="no"
```

<!-- ##  ============================================================  ## -->

```bash
$ sudo -i \
  && set REPO "deb https://apt.dockerproject.org/repo ubuntu-trusty main" \
  && echo "${REPO}" | sudo tee /etc/apt/sources.list.d/docker.list

# apt-cache policy docker
docker:
  Installed: 1.5-1
  Candidate: 1.5-1
  Version table:
 *** 1.5-1 0
        500 http://ua.archive.ubuntu.com/ubuntu/ trusty-updates/universe i386 Packages
        100 /var/lib/dpkg/status
     1.4-5ubuntu1 0
        500 http://ua.archive.ubuntu.com/ubuntu/ trusty/universe i386 Packages


# apt-cache policy docker-compose
N: Unable to locate package docker-compose

# apt-cache policy docker-*
kdocker:
  Installed: (none)
  Candidate: 4.6-2
  Version table:
     4.6-2 0
        500 http://ua.archive.ubuntu.com/ubuntu/ trusty/universe i386 Packages
docker:
  Installed: 1.5-1
  Candidate: 1.5-1
  Version table:
 *** 1.5-1 0
        500 http://ua.archive.ubuntu.com/ubuntu/ trusty-updates/universe i386 Packages
        100 /var/lib/dpkg/status
     1.4-5ubuntu1 0
        500 http://ua.archive.ubuntu.com/ubuntu/ trusty/universe i386 Packages
golang-docker-dev:
  Installed: (none)
  Candidate: 1.6.2~dfsg1-1ubuntu4~14.04.1
  Version table:
     1.6.2~dfsg1-1ubuntu4~14.04.1 0
        500 http://ua.archive.ubuntu.com/ubuntu/ trusty-updates/universe i386 Packages
vim-syntax-docker:
  Installed: (none)
  Candidate: 1.6.2~dfsg1-1ubuntu4~14.04.1
  Version table:
     1.6.2~dfsg1-1ubuntu4~14.04.1 0
        500 http://ua.archive.ubuntu.com/ubuntu/ trusty-updates/universe i386 Packages
     0.9.1~dfsg1-2 0
        500 http://ua.archive.ubuntu.com/ubuntu/ trusty/universe i386 Packages
docker.io:
  Installed: 1.6.2~dfsg1-1ubuntu4~14.04.1
  Candidate: 1.6.2~dfsg1-1ubuntu4~14.04.1
  Version table:
 *** 1.6.2~dfsg1-1ubuntu4~14.04.1 0
        500 http://ua.archive.ubuntu.com/ubuntu/ trusty-updates/universe i386 Packages
        100 /var/lib/dpkg/status
     0.9.1~dfsg1-2 0
        500 http://ua.archive.ubuntu.com/ubuntu/ trusty/universe i386 Packages
```

<!-- ##  ============================================================  ## -->
