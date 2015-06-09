#/bin/bash

declare -x OLYMPUS_HOME=$(pwd)
( [ -z ${OLYMPUS_PROJECTS} ] || [ ! -d ${OLYMPUS_PROJECTS} ] ) && echo "OLYMPUS_PROJECTS environment variable is not setted with right directory (that is: dir containing Diane, Socrates, Ulysses, etc)"
declare -x JAVA_VERSION="7"
declare -x JAVA_VENDOR="oracle"
declare -x J2REDIR="/usr/lib/jvm/java-$JAVA_VERSION-$JAVA_VENDOR/jre"
declare -x J2SDKDIR="/usr/lib/jvm/java-$JAVA_VERSION-$JAVA_VENDOR"
declare -x JAVA_HOME="/usr/lib/jvm/java-$JAVA_VERSION-$JAVA_VENDOR"
