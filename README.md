# Gitlab container

> Configure this container following the [official guide](https://docs.gitlab.com/ee/install/docker.html "gitlab + docker")

### Step 1: create mounted folders

```
sudo mkdir /opt/gitlab/ && \
sudo mkdir /opt/gitlab/config && \
sudo mkdir /opt/gitlab/logs && \
sudo mkdir /opt/gitlab/data
```

If your use domain or remote server IP, change "localhost" in docker compose file to your address.

### Step 2: Build container

Use commands ``make`` or ``make build`` for container building.

Whait some times, because build will take time.

Use ``make ps`` to display container status and ``make logs`` to view build logs.

After successfull build container halthcheck status change to ``(health)``.

After build configure tour project.

### Step 3: Configure container

Change config file of gitlab:

``nano /opt/gitlab/config/gitlab.rb``

Change ``external_url`` to your URL considering [https settings](https://docs.gitlab.com/omnibus/settings/ssl.html "setting ssl").

Change registry url if you use registrys.

### Step 4: Reconfigure container

Use ``make reconfigure`` command for change gitlab configuration.

Use your external url address for access to gitlab.

### Step 4: Root password

Use this command to show root password:

```
docker exec -it gitlab cat /etc/gitlab/initial_root_password
```

command for check your root password.

Change or save tins password and delete this output file for security reasons.
