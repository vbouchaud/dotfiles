#!/usr/bin/env sh

[ -d /proc/sys/net/ipv4/conf/tunsnx ] && echo '{"percentage": 100}' || echo '{"percentage": 0}'
