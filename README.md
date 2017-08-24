# cls-docker-java-base

Base image for Java services, Java 8.

## Usage

### How to use this image

Create a Dockerfile in your Java service.

```
FROM cls-docker-java-base:latest

# replace this with your application's default port
EXPOSE 9000
```

You can then build and run the Docker image:
```
$ docker build -t my-java-service .
$ docker run -it --rm --name my-running-app my-java-service
```

## Image Variants

The cls-docker-java-base images come in many flavors, each designed for a specific use case.

### cls-docker-java-base:latest

This image uses Oracle Java 8 JDK and is based on Ubuntu.

### cls-docker-java-base:debian

This image uses OpenJDK and is based on Debian. If you are unsure about what your needs are, you probably want to use this one.

This tag is based off of official [openjdk docker repository](https://hub.docker.com/_/openjdk/), [Dockerfile](https://github.com/docker-library/openjdk/blob/e6e9cf8b21516ba764189916d35be57486203c95/8-jdk/Dockerfile).

### cls-docker-java-base:alpine

This image uses OpenJDK and is based on the Alpine Linux project.

This tag is based off of official [openjdk docker repository](https://hub.docker.com/_/openjdk/), [Dockerfile](https://github.com/docker-library/openjdk/blob/0476812eabd178c77534f3c03bd0a2673822d7b9/8-jre/alpine/Dockerfile).

Alpine Linux is much smaller than most distribution base images (~5MB), and thus leads to much slimmer images in general. The main caveat to note is that it does use [musl libc](http://www.musl-libc.org/) instead of [glibc and friends](http://www.etalabs.net/compare_libcs.html), so certain software might run into issues depending on the depth of their libc requirements.

## Build

With Alpine Linux
```
build.sh alpine <tag>
or
docker build -t cls-docker-java-base -f `pwd`/alpine/Dockerfile .
```

With Debian based system
```
build.sh debian <tag>
or
docker build -t cls-docker-java-base -f `pwd`/debian/Dockerfile .
```

With Ubuntu Linux
```
build.sh ubuntu <tag>
or
docker build -t cls-docker-java-base -f `pwd`/ubuntu/Dockerfile .
```

## Run

```
docker run --name cls-docker-java-base -ti --rm cls-docker-java-base /bin/sh
```

## Inspecting running image

```
docker exec -it cls-docker-java-base /bin/sh
```
