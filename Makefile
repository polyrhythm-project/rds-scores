

.PHONY: experiment

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


clean-tabs:
	(cd kern && ../bin/removeTabs *.krn)


meta: metadata
metadata:
	bin/polymeta kern/*.krn


experiment:
	mkdir -p experiment
	cp $$(grep -l "experiment: 1" kern/*.krn) experiment
	# remove any that should not be there:
	@-rm experiment/R187_*
	@-rm experiment/R215_*
	@-rm experiment/R262_*
	@-rm experiment/R319_*
	#@-rm experiment/R350_*
	@-rm experiment/R415_*
	@-rm experiment/R432_*
	@-rm experiment/R443_*
	@-rm experiment/R453_*
	@-rm experiment/R534_*
	@-rm experiment/R686_*
	@-rm experiment/R688_*
	@-rm experiment/R730_*
	#@-rm experiment/R770_*

##### ANALYSES #####

nested:
	@bin/getNestedRatio experiment/*.krn


polarity:
	@bin/getPolarityRatio experiment/*.krn


staff:
	@bin/getStaffCount experiment/*.krn


range:
	@bin/getPitchRanges experiment/*.krn


mean: pitch-mean
means: pitch-mean
pitch-means: pitch-mean
pitch-mean:
	@bin/getPitchMeans experiment/*.krn


register:
	@bin/getPitchRegisters experiment/*.krn


registerA:
	@bin/getPitchRegisters -g A experiment/*.krn


registerB:
	@bin/getPitchRegisters -g B experiment/*.krn


dissonant: dissonance
dissonance:
	@bin/getSonorityDissonance experiment/*.krn


dur: duration
durs: duration
durations: duration
duration:
	@bin/getExampleDurations experiment/*.krn

ed: event-density
event-density:
	@bin/getEventDensity experiment/*.krn

edr: event-density-ratio
event-density-ratio:
	@bin/getEventDensityRatio experiment/*.krn

nr: npvi-ratio
npvi-ratio:
	@bin/getNpviRatio experiment/*.krn



