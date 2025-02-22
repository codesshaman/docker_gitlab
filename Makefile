name = GitLab

No_color=\033[0m		# Color Reset
Color_Off='\e[0m'       # Color Off
Ok_green=\033[32;01m	# Green Ok
Err_red=\033[31;01m		# Error red
Warn_yel=\033[33;01m	# Warning yellow
Red='\e[1;31m'          # Red
Green='\e[1;32m'        # Green
Yellow='\e[1;33m'       # Yellow
Blue='\e[1;34m'         # Blue
Purple='\e[1;35m'       # Purple
Cyan='\e[1;36m'         # Cyan
White='\e[1;37m'        # White
UCyan='\e[4;36m'        # Cyan

all:
	@printf "Launch configuration ${name}...\n"
	@docker-compose -f ./docker-compose.yml up -d

help:
	@echo -e "$(OK_COLOR)==== All commands of ${name} configuration ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- make			: Launch configuration"
	@echo -e "$(WARN_COLOR)- make build			: Building configuration"
	@echo -e "$(WARN_COLOR)- make down			: Stopping configuration"
	@echo -e "$(WARN_COLOR)- make env			: Create envionment file"
	@echo -e "$(WARN_COLOR)- make git			: Set user and mail for git"
	@echo -e "$(WARN_COLOR)- make logs			: Show logs of gitlab"
	@echo -e "$(WARN_COLOR)- make ps			: Rebuild configuration"
	@echo -e "$(WARN_COLOR)- make push			: Push changes to the github"
	@echo -e "$(WARN_COLOR)- make re			: Rebuild configuration"
	@echo -e "$(WARN_COLOR)- make reconfigure		: Reconfigure gitlab"
	@echo -e "$(WARN_COLOR)- make clean			: Cleaning configuration$(NO_COLOR)"

build:
	@printf "$(OK_COLOR)==== Building configuration ${name}... ====$(NO_COLOR)\n"
	@docker-compose -f ./docker-compose.yml up -d --build

down:
	@printf "$(ERROR_COLOR)==== Stopping configuration ${name}... ====$(NO_COLOR)\n"
	@docker-compose -f ./docker-compose.yml down

env:
	@printf "$(OK_COLOR)==== Create new .env ${name}... ====$(NO_COLOR)\n"
	@cp .env.example .env

git:
	@printf "$(YELLOW)==== Set user name and email to git for ${name} repo... ====$(NO_COLOR)\n"
	@bash scripts/gituser.sh

logs:
	@printf "$(ERROR_COLOR)==== Show logs ${name}... ====$(NO_COLOR)\n"
	@docker logs gitlab

ps:
	@printf "$(OK_COLOR)==== View configuration ${name}... ====$(NO_COLOR)\n"
	@docker-compose -f ./docker-compose.yml ps

push:
	@bash scripts/push.sh

re:	down
	@printf "$(OK_COLOR)==== Rebuild configuration ${name}... ====$(NO_COLOR)\n"
	@docker-compose -f ./docker-compose.yml up -d --build

reconfigure:
	@printf "$(OK_COLOR)==== Reconfigure ${name}... ====$(NO_COLOR)\n"
	@docker exec -it --user root gitlab gitlab-ctl reconfigure

clean: down
	@printf "$(ERROR_COLOR)==== Cleaning configuration ${name}... ====$(NO_COLOR)\n"
	@docker system prune -a

fclean:
	@printf "$(ERROR_COLOR)==== Total clean of all configurations docker ====$(NO_COLOR)\n"
	# @docker stop $$(docker ps -qa)
	# @docker system prune --all --force --volumes
	# @docker network prune --force
	# @docker volume prune --force

.PHONY	: all help build down re clean fclean
