#!/bin/bash

[ -z $OLYMPUS_HOME ] && echo "OLYMPUS_HOME is not setted, exit" && exit 0
export | grep -i java | grep -vi derby | grep "\-8\-" && echo "Java 8 is not allowed, exit." && exit 0

here=$(pwd)
tmp_log="${here}/tmp.log"
report_log="${here}/report.log"

function findBuild() {
   find | grep build.xml | sed "s/build.xml//g" |egrep -i -e "${1}" |sort
}

function seekAndCompile() {
	for i in $@; do
      cd ${here}/$i
		echo -n "$i: "
	   ant jars >/dev/null 2>$tmp_log
		if [ $? -eq 1 ]; then
			echo "failed"
			echo "$i failed details:" >> $report_log
			echo $(cat $tmp_log) >> $report_log
			echo >> $report_log
		else
			echo ok
		fi
	done
   cd $here
}

if [ -f build.xml ]; then 
   ant jars
else
   seekAndCompile $(findBuild 'library')
   seekAndCompile $(findBuild "demo|sample")
fi

[ -f $report_log ] && echo && cat $report_log
rm -f $report_log $tmp_log
cd $here
