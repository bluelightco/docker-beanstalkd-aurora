#!/bin/sh

sed -i "s/servers =.*/servers = [\"$BEANSTALKD_HOST:$BEANSTALKD_PORT\"]/" /aurora.toml

exec "$@"
