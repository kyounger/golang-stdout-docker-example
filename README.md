# golang-stdout-docker-example


To build this multi-stage Dockerfile with Kaniko:

1. git clone this repo
2. run this: `docker run -it -v $(pwd):/workspace gcr.io/kaniko-project/executor:latest --no-push --cleanup`
