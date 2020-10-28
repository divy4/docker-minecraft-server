.DEFAULT_GOAL := build

build:
	docker build -t divy4/minecraft-server .

run:
	docker run --rm --interactive --tty --env EULA=true --publish 25565:25565 divy4/minecraft-server

shell:
	docker run --rm --interactive --tty --env EULA=true --publish 25565:25565 divy4/minecraft-server ash
