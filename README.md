# maven-docker
Docker Image that support Maven's proxy configuration over environment variables. To use the image, simply pull:
```console
$ docker pull levonk/maven-docker
```
To map ```mvnd``` to this add the following to ```~/.bash_profile``` or similar
```console
mvnd() {
	docker run -it -v ${HOME}/.m2:/home/user/.m2 -v $(pwd):/workdir levonk/maven-docker:latest "$@";
}
```

This image extends `alpine_jdk8` to allow configuration of proxy for maven. Following environment variables are supported:

