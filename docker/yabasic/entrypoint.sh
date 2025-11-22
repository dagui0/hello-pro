#!/bin/bash
#
# /entrypoint.sh for debian
#
# Instant mode:
#   docker run --rm -it <docker_options> <docker_image> cmd ...
# Daemon mode:
#   docker run -d --name <container_id> <docker_options> <docker_image>
#   docker exec -it <container_id>  cmd ...
#
# How to setup user, locale and timezone inside the container:
# docker run ... \
#    -e USER=$(id -un) \
#    -e UID=$(id -u) \
#    -e GID=$(id -g) \
#    -e LANG=$LANG \
#    -v /etc/localtime:/etc/localtime:ro \
#    ...

setup_user() {
    local user=${1:-$USER}
    local uid=${2:-$UID}
    local gid=${3:-$GID}

    if ! id -u "$user" >/dev/null 2>&1; then
      if ! getent group "$gid" >/dev/null 2>&1; then
        groupadd -g "$gid" "$user"
      fi
      useradd -M -u "$uid" -g "$gid" -d /tmp -s /bin/bash "$user"
    fi

    export USER=$user UID=$uid GID=$gid
}
setup_locale() {
    local lang=${1:-$LANG}
    if [[ -z "$lang" ]]; then
      lang="en_US.UTF-8"
    fi

    local encoding=${lang##*.}
    if [[ -z "$encoding" || "$encoding" = "$lang" ]]; then
      encoding="UTF-8"
    fi
    if locale -a 2>/dev/null | grep -iq "^${lang%%.*}.${encoding//-/}" >/dev/null 2>&1; then
      : locale already generated
    else
        sed -i "/${lang}/s/^# //" /etc/locale.gen
        locale-gen >/dev/null 2>&1
    fi

    export LANG="${lang%%.*}.${encoding}"
}

setup_user $USER $UID $GID
setup_locale $LANG

cmd="$1"; shift

case "$cmd" in
  sh|/bin/sh|bash|/bin/bash:/usr/bin/bash)
    HISTFILE=/dev/null exec gosu $USER /bin/bash "$@"
    ;;
  daemon)
    echo "Starting container in daemon mode..."
    echo "To connect to the container and execute BASIC program, run:"
    echo "  docker exec -it <container_id> basic hello.bas"
    exec gosu $USER sleep infinity
    ;;
  *)
    exec gosu $USER $cmd "$@"
    ;;
esac
