


check: check-sibelius check-musicxml check-pdf check-kern

check-sibelius:
	(cd sibelius; ../bin/renamefile -c *.sib)
check-musicxml:
	(cd musicxml; ../bin/renamefile -c *.xml)
check-pdf:
	(cd pdf; ../bin/renamefile -c *.pdf)
check-kern:
	(cd kern; ../bin/renamefile -c *.krn)

hum:	humdrum
humdrum:
	for i in musicxml/*.xml; \
	do \
		musicxml2hum $$i > kern/$$(basename $$i .xml).krn; \
		echo "!!!ONB: Converted from MusicXML on $$(date +'%Y/%m/%d')" >> kern/$$(basename $$i .xml).krn; \
	done
	

