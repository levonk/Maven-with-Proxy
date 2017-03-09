# maven-docker
Docker Image that support Maven's proxy configuration over environment variables. To use the image, simply pull:
```console
$ docker pull levonk/maven-docker
```
Here is a sample command to start the image
```console
$ docker run -it -e "PROXY_HOST=localproxy" -e "PROXY_PORT=8080" -v $HOME/.m2:/home/user/.m2  levonk/maven-docker:latest bash
```
To map ```mvnd``` to this add the following to ```~/.bash_profile``` or similar
```console
mvnd() {
	docker run -rm -it -v $HOME/.m2:/home/user/.m2 -v $(pwd):/home/user/proj levonk/maven-docker:latest "$@";
}
```

This image extends `alpine_jdk8` to allow configuration of proxy for maven. Following environment variables are supported:

Variable Name| Description | Example
--- | --- | ---
PROXY_HOST | Hostname without the protocol | localproxy
PROXY_PORT | Port number of the proxy | 8080
PROXY_PROTOCOL | The protocol | http
PROXY_USER | Proxy Username | max
PROXY_PASS | Proxy Password | secret
NO_PROXY | List of hosts accessible outside proxy | localhost,127.0.0.1

