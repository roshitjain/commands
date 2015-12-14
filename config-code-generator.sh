FILE_NAME=$1
awk '{n = split($0,a,"\/>"); for (var in a) print a[var] }' $FILE_NAME | awk -F"<dnpPoint " '{print $2}' | awk -F"\"" '{print "point.setPointName(\""$2"\");","point.setPointValue(\""$4"\");points.add(point);point = new DnpPoint();"}'
