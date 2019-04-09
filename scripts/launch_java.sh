#!/usr/bin/env bash

set -ex
JAR="$1"
shift

 : ${JAVA_LAUNCH_PROFILE:=legacy}

echo "Starting with profile: ${JAVA_LAUNCH_PROFILE}"

exec "/opt/run-java/profiles/${JAVA_LAUNCH_PROFILE}/launch_java.sh" -jar ${JAR} $@
