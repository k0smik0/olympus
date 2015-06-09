#!/bin/bash

[ -z $ANDROID_HOME ] && echo ANDROID_HOME not setted && exit 1
[ -z $OLYMPUS_PROJECTS ] && echo OLYMPUS_PROJECTS not setted && exit 1
[ -z $ROBOGUICE_DIR ] && echo ROBOGUICE_DIR not setted && exit 1
[ -z $ROBOGUICE_MAJOR_VERSION ] && echo "ROBOGUICE_MAJOR_VERSION (ex: 3.0) not setted" && exit 1
[ -z $ROBOGUICE_COMPLETE_VERSION ] && echo "ROBOGUICE_COMPLETE_VERSION (ex: 3.0.1) not setted" && exit 1

RM="rm -fv"
LNS="ln -fsv"

[ ! -h android-support-v4.jar ] && [ ! -e android-support-v4.jar ] && $RM android-support-v4.jar && $LNS $ANDROID_HOME/extras/android/support/v4/android-support-v4.jar

for i in $OLYMPUS_PROJECTS/Diane/library/common/build/jars/diane-common.jar $OLYMPUS_PROJECTS/Diane/library/task/roboguiced/build/jars/diane-robotasks.jar $OLYMPUS_PROJECTS/Diane/library/utils/roboguiced/build/jars/diane-roboutils.jar $OLYMPUS_PROJECTS/Enhancedsafeasynctask/vanilla/library/build/jars/enhancedsafeasynctask.jar $OLYMPUS_PROJECTS/Epicurus/build/jar/epicurus.jar $OLYMPUS_PROJECTS/Socrates/library/build/jars/google-preconditions.jar $OLYMPUS_PROJECTS/Kusor/build/jars/kusor-common.jar $OLYMPUS_PROJECTS/Kusor/build/jars/kusor-roboguiced.jar $OLYMPUS_PROJECTS/MirroringException/jars/mirroringexception.jar $OLYMPUS_PROJECTS/Polaris/build/jars/polaris-core.jar $OLYMPUS_PROJECTS/Polaris/build/jars/polaris-core-roboguiced.jar $OLYMPUS_PROJECTS/Polaris/build/jars/polaris-task.jar $OLYMPUS_PROJECTS/Polaris/build/jars/polaris-task-roboguiced.jar $OLYMPUS_PROJECTS/Polaris/build/jars/polaris-observatory.jar $OLYMPUS_PROJECTS/Polaris/build/jars/polaris-utils.jar $OLYMPUS_PROJECTS/Enhancedsafeasynctask/roboguiced/library/build/jars/roboenhancedasynctask.jar $OLYMPUS_PROJECTS/Socrates/library/build/jars/socrates-base.jar $OLYMPUS_PROJECTS/Socrates/library/build/jars/socrates-events.jar $OLYMPUS_PROJECTS/Socrates/library/build/jars/socrates-roboguiced.jar $OLYMPUS_PROJECTS/Ulysses/library/common/build/jars/ulysses-common.jar $OLYMPUS_PROJECTS/Ulysses/library/common/build/jars/ulysses-roboguiced.jar $OLYMPUS_PROJECTS/Ulysses/library/ui/ui-jar/build/jar/ulysses-ui.jar; do
   file=$(echo $i | awk -F"/" '{print $NF}')
   # if real file, remove it
   [ -f $file ] && [ ! -h $file ] && $RM $file
   # if broken link, recreate it
   [ -e $file ] || $LNS $i .
done

file="roboguice"
# really, it's a dir
[ -d $file ] && [ ! -h $file ] && $RM $file
[ -e $file ] || $LNS $ROBOGUICE_DIR $file

file="roboguice.jar"
[ -f $file ] && [ ! -h $file ] && $RM $file
[ -e $file ] || $LNS roboguice/$ROBOGUICE_MAJOR_VERSION/roboguice-$ROBOGUICE_COMPLETE_VERSION.jar $file


#google-api-client-1.6.0-beta.jar
#google-http-client-1.6.0-beta.jar
#google-http-client-extensions-android2-1.6.0-beta.jar
#imageloader.jar
#jackson-mini-1.9.2.jar
#novocation-core-1.0.8.jar
