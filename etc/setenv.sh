#/bin/bash

declare -x OLYMPUS_HOME=$(pwd)

declare -x JAVA_VERSION="7"
declare -x JAVA_VENDOR="oracle"
declare -x J2REDIR="/usr/lib/jvm/java-$JAVA_VERSION-$JAVA_VENDOR/jre"
declare -x J2SDKDIR="/usr/lib/jvm/java-$JAVA_VERSION-$JAVA_VENDOR"
declare -x JAVA_HOME="/usr/lib/jvm/java-$JAVA_VERSION-$JAVA_VENDOR"
