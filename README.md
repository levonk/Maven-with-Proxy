# levonk/maven
Docker image to use the Apache Maven build tool

## Why

Rather than convincing people to properly set up Java and the enviornment vairables for maven, I created an image.   If a developer wants the "blessed" version to use
internally, they can simply create a shell script for a function to use the latest docker image.   that way upgrades are taken care of for them.

Iniitally, I just watned to try Maven 3.5 without polluting my envionrment.

As I looked around for a solution, I saw plenty of solutions tied to people's enviornments, suggesting that people do development in the container, or doing bash variable
substitutions to change settings files in the container.   With this strategy, you use your existing local-repo and leverage your existing settings.xml.

## To use Maven wrapped in a docker image

First you need to make sure you have Docker installed:
	http://docs.docker.com/engine/installation/

If you just want to use it then run the command with whatever maven targets you want
```console
docker run --rm -it -v ${HOME}/.m2:/home/user/.m2 -v $(pwd):/workdir levonk/maven:latest clean install site
```

To go a step further, and save yourself a lot of typing/head-scratching, map `mvnd` (or whatever you want) to add the following to `~/.bash_profile` or the equivelent for your shell
```console
mvnd() {
	docker run --rm -it -v ${HOME}/.m2:/home/user/.m2 -v $(pwd):/workdir levonk/maven:latest "$@";
}
```
Now when you want to use it, simply call use the ```mvnd``` command instead of the ```mvn``` command.

For example: when your in your directory with a `pom.xml`, simply run
```console
mvnd package
```

## How

This image extends `alpine_jdk8`.   It also passes in a default parameter to show version information of Java and Maven.

