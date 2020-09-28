


check: check-sibelius check-musicxml check-pdf check-kern

check-sibelius:
	(cd sibelius; ../bin/renamefile -c *.sib)
check-musicxml:
	(cd musicxml; ../bin/renamefile -c *.xml)
check-pdf:
	(cd pdf; ../bin/renamefile -c *.pdf)
check-kern:
	(cd kern; ../bin/renamefile -c *.krn)

kern:	humdrum
krn:	humdrum
hum:	humdrum
humdrum: utf8
	echo "No longer converting data automatically"
#	for i in musicxml/*.xml; \
#	do \
#		echo Converting $$i; \
#		musicxml2hum $$i | extractxx --no-rest | \
#		   bin/adddummymetadata | bin/removedoublebarline | \
#		   grep -v "break:original" | \
#		   egrep -v "^\!\!\!(YEM|YEC)" > \
#		   kern/$$(basename $$i .xml).krn; \
#	done
#	echo "ADDING GROUPING INFORMATION TO SCORES"
#	(cd processing/groupings; make doit)
#	echo "ADDING *MM LINES (BEFORE RUNNING POLYMETA)"
#	(cd kern; ../bin/addmmline *.krn)
#	echo "ADDING METADATA INFORMATION TO SCORES"
#	(cd kern; ../bin/polymeta *.krn >& /dev/null)
	

xml: utf8
utf16: utf8
utf8:
	(cd musicxml && ../bin/utf16toutf8 *.xml)

index:
	bin/makehmdindex > index.hmd


meta: metadata
metadata:
	bin/polymeta kern/*.krn


