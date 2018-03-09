#!/bin/sh
set -x
JAR=$1
shift

. /opt/run-java/dynamic_resources.sh

export MALLOC_ARENA_MAX=2
export LOG_LEVEL=${LOG_LEVEL:-info}

# Make sure that we use /dev/urandom
JAVA_OPTS="${JAVA_OPTS} -Dvertx.cacheDirBase=/tmp -Djava.security.egd=file:/dev/./urandom"

JAVA_OPTS="$(adjust_java_options ${JAVA_OPTS})"

exec java $JAVA_OPTS -jar $JAR $@
