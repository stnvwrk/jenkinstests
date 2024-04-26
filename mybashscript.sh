#!/bin/bash

echo "Hello $1 I'm working!"


sed '/<child>/,/<\\/child/d' testfile.xml > edited_testfile.xml

values="10 22 23 33 45 66 78"

for value in ${values[@]}
do
  value_tag="\\t<child>\n\t\t<value>$value</value>\n\t</child>\n"
  value_tags="${value_tags} ${value_tag}"
done

sed "/<parent>/a ${value_tags}" edited_testfile.xml > final_testfile_${1}.xml
cat final_testfile_${1}.xml


