#!/bin/sh
set -x
JAR=$1
shift

. /opt/run-java/dynamic_resources.sh

export MALLOC_ARENA_MAX=2

LOG_LEVEL=${LOG_LEVEL:-info}

if [ "${JAVA_DEBUG}" == "true" ]; then
  java_debug_args="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=${JAVA_DEBUG_PORT:-8787}"
fi

# Make sure that we use /dev/urandom
JAVA_OPTS="${JAVA_OPTS} -DLOG_LEVEL=${LOG_LEVEL} -Dvertx.disableDnsResolver=true -Duser.timezone=UTC -Dvertx.cacheDirBase=/tmp -Djava.security.egd=file:/dev/./urandom"

JAVA_OPTS="$(adjust_java_options ${JAVA_OPTS}) ${java_debug_args}"

exec java $JAVA_OPTS -jar $JAR $@
