## Docker Project
<br>


Make wordpress blog service.

<br>

Mariadb
<br>
Wordpress
<br>
NginX

<br>

### BUILD


```SHELL
	@bash srcs/requirements/tools/start.sh
	@bash srcs/requirements/tools/volume.sh
	@bash srcs/requirements/tools/hosts.sh
	docker compose -f ./srcs/docker-compose.yml up -d --build

```
