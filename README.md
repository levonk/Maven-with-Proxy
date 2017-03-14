# levonk/maven
Docker image to use the Apache Maven build tool

To map `mvnd` to this add the following to `~/.bash_profile` or similar
```console
mvnd() {
	docker run --rm -it -v ${HOME}/.m2:/home/user/.m2 -v $(pwd):/workdir levonk/maven:latest "$@";
}
```

Then when your in your directory with a `pom.xml`, simply run
```console
mvnd package
```

This image extends `alpine_jdk8`.

