#!/bin/bash
JVM_PARAM_FLAG="-j"
APP_PARAM_FLAG="-a"

if [ $# -lt 1 ]; then
  echo "Usage:"
  echo "<jarfile> ($JVM_PARAM_FLAG [jvm-param:s] ...) ($APP_PARAM_FLAG [app-param:s] ...)"
  echo "e.g."
  echo "  /app.jar $JVM_PARAM_FLAG -Xmx512M $APP_PARAM_FLAG --spring.active.profiles=default"
  echo "or"
  echo "  /opt/app.jar"
  echo
  exit 1
fi

JAR_FILE=""
JVM_OPTS="-server -DLOG_DIR=/data/logs"
APP_PARAMS=""
MODE_JVM="jvm"
MODE_APP="app"
MODE=""

for var in "$@"
do
    if [ "$var" == *".jar" ]; then
        JAR_FILE="$var"
        MODE=""
    elif [ "$var" == "$JVM_PARAM_FLAG" ]; then
        MODE=$MODE_JVM
    elif [ "$var" == "$APP_PARAM_FLAG" ]; then
        MODE=$MODE_APP
    else
        if [ "$MODE" == "$MODE_JVM" ]; then
            JVM_OPTS="$JVM_OPTS $var"
        elif [ "$MODE" == "$MODE_APP" ]; then
            APP_PARAMS="$APP_PARAMS $var"
        fi
    fi
done

JAR_COMMAND="java $JVM_OPTS -jar $JAR_FILE $APP_PARAMS"
JAR_COMMAND="$(echo -e "${JAR_COMMAND}" | sed -e 's/  */ /g')"
echo "running: $JAR_COMMAND"
exec $JAR_COMMAND
