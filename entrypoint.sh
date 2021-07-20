#!/bin/bash
set -e

rm -f /docker_for_rails27/tmp/pids/server.pid
exec "$@"
