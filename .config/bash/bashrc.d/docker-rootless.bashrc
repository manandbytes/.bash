# https://docs.docker.com/engine/security/rootless/
# /usr/share/docker.io/contrib/dockerd-rootless-setuptool.sh --help

# Usage: /usr/share/docker.io/contrib/dockerd-rootless-setuptool.sh [OPTIONS] COMMAND
# A setup tool for Rootless Docker (dockerd-rootless.sh).
# Documentation: https://docs.docker.com/go/rootless/
# Options:
#   -f, --force                Ignore rootful Docker (/var/run/docker.sock)
#       --skip-iptables        Ignore missing iptables
# Commands:
#   check        Check prerequisites
#   install      Install systemd unit (if systemd is available) and show how to manage the service
#   uninstall    Uninstall systemd unit

export PATH=/usr/share/docker.io/contrib/:$PATH
# export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock

# docker context create rootless --docker "host=unix:///run/user/$(id -u)/docker.sock"
# docker context use rootless
# docker ...
