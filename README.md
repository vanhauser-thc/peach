# peach
Dockerfile for peach with everything set up as needed plus some extras

## Why

peach does not work with mono >= 5.17 hence this needs a docker container on
newer Linux distributions.

This container has quite a few extra tools for when using `--entrypoint /bin/bash`
that are likely only useful for me :)
