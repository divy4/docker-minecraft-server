# Docker Minecraft Server

Yet another Minecraft server, now without the need for external sources when running!

## Why not use [itzg/minecraft-server](https://github.com/itzg/docker-minecraft-server)?

[itzg/minecraft-server](https://github.com/itzg/docker-minecraft-server) is
a great dockerized Minecraft server for someone that wants to run the latest
Minecraft server. But I was looking to make a Minecraft image that does the
following:

- Stores level data in a separate directory, so that docker volumes don't contain binaries and server configs
  - This makes server upgrades easier
- Doesn't download resources from the internet
  - This is good for zero-trust security

If you're looking for an image that meets this criteria, this image should work
great. If not, [itzg/minecraft-server](https://github.com/itzg/docker-minecraft-server) is probably a better option

## Using this Image with Docker

The below command executes a Minecraft server in detach mode on port `25565`
and stores any world data to `/some/directory`.

```
docker run --detach --env EULA=true --publish 25565:25565 --volume /some/directory:/data divy4/minecraft-server
```

### Attaching Additional Config Files

For mounting additional minecraft config files (e.g. `ops.json`,
`whitelist.json`, etc. In this example, `server.properties`.), add the following to right before `divy4/minecraft-server`:

```
--volume /some/path/server.properties:/minecraft/server.properties:ro
```

## Using this Image with Kubernetes

TODO

```
TODO
```

## Developing this Image

### Build the Image

```
make build
```

### Run the Image

```
make run
```

### Run the Image in Ash Instead of Starting the Server

```
make shell
```
