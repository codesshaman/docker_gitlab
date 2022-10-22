# Gitlab container

> Configure this container following the [official guide](https://docs.gitlab.com/ee/install/docker.html "gitlab + docker")

### Step 1: create mounted folders

```
sudo mkdir /opt/gitlab/ && \
sudo mkdir /opt/gitlab/config && \
sudo mkdir /opt/gitlab/logs && \
sudo mkdir /opt/gitlab/data
```

### Step 2: Build container

Use commands ``make`` or ``make build`` for container building.

### Step 3: Configure container


