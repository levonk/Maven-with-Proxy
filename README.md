# levonk/maven
Docker image to use the Apache Maven build tool

## Why

Rather than convincing people to properly set up Java and the enviornment vairables for maven, I created an image.   If a developer wants the "blessed" version to use
internally, they can simply create a shell script for a function to use the latest docker image.   that way upgrades are taken care of for them.

Iniitally, I just watned to try Maven 3.5 without polluting my envionrment.

## To use maven wrapped in a docker image

### As a one time setup

To map `mvnd` to this add the following to `~/.bash_profile` or similar
```console
mvnd() {
	docker run --rm -it -v ${HOME}/.m2:/home/user/.m2 -v $(pwd):/workdir levonk/maven:latest "$@";
}
```

### Now when you want to use it, simply call use the ```mvnd``` command instead of the ```mvn``` command.

Then when your in your directory with a `pom.xml`, simply run
```console
mvnd package
```

## How

This image extends `alpine_jdk8`.   It also passes in a default parameter to show version information of Java and Maven.

