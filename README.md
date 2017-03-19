# levonk/maven
Docker image to use the Apache Maven build tool

## Why

  * Continuous Delivery / Continuous Integration environments can have a "blessed" package for build consistency
  * Add this project as a submodule to keep your tooling together.
  * Try out multiple versions of Maven without any changes including alpha or other non-release  versions.
  * No separate downloads, M2_HOME enviornment variables, separate ubuntu repositories, etc...
  * Large team can get their version updated uniformly from a remote dockerhub deployment by moving tags
  * No onboarding documentation per platform, everybody gets the same documentation.
  * Run multiple versions of Maven trivially
  * Tool team can release new versions without the developers even being aware (besides a download)
  * Additional scripts can be added transparently to run before or after maven without changing workflow.

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

## Limitations

You won't be able to build a project from a sub-module/directory and expect it to be able to reference the projects above.   If you had built a parent earlier and installed it
to a local repo, it shouldn't be a problem.  However the proper strategy is always to start from the top of the project and leverage the arguments:
```console
mvnd -am -pl mySubModule,SeparatedByCommas install
```
