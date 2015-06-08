
[ -z $ANDROID_HOME ] && echo ANDROID_HOME not setted && exit 1
[ -z $ROBOGUICE_DIR ] && echo ROBOGUICE_DIR not setted && exit 1
[ -z $ROBOGUICE_MAJOR_VERSION ] && echo "ROBOGUICE_MAJOR_VERSION (ex: 3.0) not setted" && exit 1
[ -z $ROBOGUICE_COMPLETE_VERSION ] && echo "ROBOGUICE_COMPLETE_VERSION (ex: 3.0.1) not setted" && exit 1

RM="echo rm -fv"
LNS="echo ln -sv"

[ ! -h android-support-v4.jar ] && $RM -f android-support-v4.jar && $LNS $ANDROID_HOME/extras/android/support/v4/android-support-v4.jar

for i in ../Diane/library/common/build/jars/diane-common.jar ../Diane/library/task/roboguiced/build/jars/diane-robotasks.jar ../Diane/library/utils/roboguiced/build/jars/diane-roboutils.jar ../Enhancedsafeasynctask/vanilla/library/build/jars/enhancedsafeasynctask.jar ../Epicurus/build/jar/epicurus.jar ../Socrates/library/build/jars/google-preconditions.jar ../Kusor/build/jars/kusor-common.jar ../Kusor/build/jars/kusor-roboguiced.jar ../Kusor/build/jars/kusor-tasks-roboguiced.jar ../MirroringException/jars/mirroringexception.jar ../Polaris/build/jars/polaris-core.jar ../Polaris/build/jars/polaris-core-roboguiced.jar ../Polaris/build/jars/polaris-observatory.jar ../Polaris/build/jars/polaris-utils.jar ../Enhancedsafeasynctask/roboguiced/library/build/jars/roboenhancedasynctask.jar ../Socrates/library/build/jars/socrates-base.jar ../Socrates/library/build/jars/socrates-events.jar ../Socrates/library/build/jars/socrates-roboguiced.jar ../Ulysses/library/common/build/jars/ulysses-common.jar ../Ulysses/library/common/build/jars/ulysses-roboguiced.jar ../Ulysses/library/ui/ui-jar/build/jar/ulysses-ui.jar; do
   file=$(echo $i | awk -F"/" '{print $NF}')
   # if real file, remove it
   [ -f $file ] && [ ! -h $file ] && $RM $file
   # if broken link, recreate it
   [ -e $file ] || $LNS $i .
done

file="roboguice"
# really, it's a dir
[ -d $file ] && [ ! -h $file ] && $RM $file
[ -e $file ] || $LNS $ROBOGUICE_DIR file

file="roboguice.jar"
[ -f $file ] && [ ! -h $file ] && $RM $file
[ -e $file ] || $LNS roboguice/$ROBOGUICE_MAJOR_VERSION/roboguice-$ROBOGUICE_COMPLETE_VERSION.jar $file


#google-api-client-1.6.0-beta.jar
#google-http-client-1.6.0-beta.jar
#google-http-client-extensions-android2-1.6.0-beta.jar
#imageloader.jar
#jackson-mini-1.9.2.jar
#novocation-core-1.0.8.jar
