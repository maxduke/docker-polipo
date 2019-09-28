# docker-polipo-with-conf-dir

[![](https://images.microbadger.com/badges/version/maxduke/polipo-with-conf-dir.svg)](https://microbadger.com/images/maxduke/polipo-with-conf-dir "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/maxduke/polipo-with-conf-dir.svg)](https://microbadger.com/images/maxduke/polipo-with-conf-dir "Get your own image badge on microbadger.com")

[![Docker Pulls](https://img.shields.io/docker/pulls/maxduke/polipo-with-conf-dir.svg)](https://hub.docker.com/r/maxduke/polipo-with-conf-dir/ "Docker Pulls")
[![Docker Stars](https://img.shields.io/docker/stars/maxduke/polipo-with-conf-dir.svg)](https://hub.docker.com/r/maxduke/polipo-with-conf-dir/ "Docker Stars")
[![Docker Automated](https://img.shields.io/docker/automated/maxduke/polipo-with-conf-dir.svg)](https://hub.docker.com/r/maxduke/polipo-with-conf-dir/ "Docker Automated")

## Usage

0. Prepare config and download directories with following commands.

    ```bash
    # Create config dir
    mkdir /storage/polipo/conf
    ```
0. Put all you polipo conf file in that floder.

    ```bash
	copy *.conf /storage/polipo/conf
    ```
0. Run following command to start polipo instances

    ```bash
    docker run \
      -d \
	  --network host \
      --name polipo \
      -v /storage/polipo/conf:/polipo/conf \
      maxduke/polipo-with-conf-dir
    ```

Note:
* Learn more about `polipo.conf`: [Config sample](https://www.irif.fr/~jch/software/polipo/config.sample)

## Parameters

The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
`http://192.168.x.x:8080` would show you what's running INSIDE the container on port 80.


* `--network host` - run as host mode, so that port mapping is not needed
* `-v /storage/polipo/conf:/polipo/conf` - where polipo config files that polipo should run with

It is based on alpine linux, for shell access whilst the container is running do `docker exec -it maxduke/polipo-with-conf-dir /bin/sh`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `-u 1001:1002`. To find yours use `id user` as below:

```bash
  $ id dockeruser
    uid=1001(dockeruser) gid=1002(dockergroup) groups=1002(dockergroup)
```
