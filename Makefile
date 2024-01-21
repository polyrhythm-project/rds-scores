

.PHONY: experiment experiment2

KERN_RDS = kern
KERN = $(KERN_RDS)
KERN_TDS = ../tds-scores/kern

# Choose which experimental data to extract:
# Location of experimental data:
#EXP = experiment1
#EXP = experiment-lmf1
#EXP = experiment-lmf2
#EXP = experiment-lmf3
EXP = experiment-pqm2


BINDIR = bin

check: check-sibelius check-musicxml check-pdf check-kern

check-sibelius:
	(cd sibelius; ../$(BINDIR)/renamefile -c *.sib)
check-musicxml:
	(cd musicxml; ../$(BINDIR)/renamefile -c *.xml)
check-pdf:
	(cd pdf; ../$(BINDIR)/renamefile -c *.pdf)
check-kern:
	(cd $(KERN_RDS); ../$(BINDIR)/renamefile -c *.krn)

kern:	humdrum
krn:	humdrum
hum:	humdrum
humdrum: utf8
	echo "No longer converting data automatically"
#	for i in musicxml/*.xml; \
#	do \
#		echo Converting $$i; \
#		musicxml2hum $$i | extractxx --no-rest | \
#		   $(BINDIR)/adddummymetadata | $(BINDIR)/removedoublebarline | \
#		   grep -v "break:original" | \
#		   egrep -v "^\!\!\!(YEM|YEC)" > \
#		   $(KERN_RDS)/$$(basename $$i .xml).krn; \
#	done
#	echo "ADDING GROUPING INFORMATION TO SCORES"
#	(cd processing/groupings; make doit)
#	echo "ADDING *MM LINES (BEFORE RUNNING POLYMETA)"
#	(cd $(KERN_RDS); ../$(BINDIR)/addmmline *.krn)
#	echo "ADDING METADATA INFORMATION TO SCORES"
#	(cd $(KERN_RDS); ../$(BINDIR)/polymeta *.krn >& /dev/null)


xml: utf8
utf16: utf8
utf8:
	(cd musicxml && ../$(BINDIR)/utf16toutf8 *.xml)


index:
	$(BINDIR)/makehmdindex > index.hmd


clean-tabs:
	(cd $(KERN_RDS) && ../$(BINDIR)/removeTabs *.krn)


refs: metadata
references: metadata
reference: metadata
reference-data: metadata
meta: metadata
metadata:
	$(BINDIR)/polymeta $(KERN_RDS)/*.krn


experiment1-data:
	mkdir -p experiment
	cp $$(grep -l "experiment: 1" $(KERN_RDS)/*.krn) experiment
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

experiment2-data:
	# Note:after using myank, you need to insert groups manually back into the extract
	# data.

	#@mkdir -p experiment2
	#@-rm experiment2/*.krn

	# RDS files:
	#cat $(KERN_RDS)/R310*.krn | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 5.49/' > experiment2/$$(basename $$(ls $(KERN_RDS)/R310*.krn))
	#myank -m 3-6 $$(ls $(KERN_RDS)/R324*.krn) | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 7.83/' > experiment2/$$(basename $$(ls $(KERN_RDS)/R324*.krn))
	#myank -m 22-28 $$(ls $(KERN_RDS)/R350*.krn) | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 7.19/' > experiment2/$$(basename $$(ls $(KERN_RDS)/R350*.krn))
	#myank -m 0-6 $$(ls $(KERN_RDS)/R534x*.krn) | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 9.03/' > experiment2/$$(basename $$(ls $(KERN_RDS)/R534x*.krn))
	#myank -m 10-12 $$(ls $(KERN_RDS)/R560*.krn) | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 8.24/' > experiment2/$$(basename $$(ls $(KERN_RDS)/R560*.krn))
	#myank -m 74-76 $$(ls $(KERN_RDS)/R574*.krn) | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 7.13/' > experiment2/$$(basename $$(ls $(KERN_RDS)/R574*.krn))
	#myank -m 1-6 $$(ls $(KERN_RDS)/R582*.krn) | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 7.14/' > experiment2/$$(basename $$(ls $(KERN_RDS)/R582*.krn))
	#cat $(KERN_RDS)/R616*.krn | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 6.95/' > experiment2/$$(basename $$(ls $(KERN_RDS)/R616*.krn))
	#myank -m 91-94 $$(ls $(KERN_RDS)/R686x*.krn) | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec:6.16/' > experiment2/$$(basename $$(ls $(KERN_RDS)/R686x*.krn))

	# TDS files:
	#myank -m 77-85 $$(ls $(KERN_TDS)/T169*.krn) | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 8.8/' > experiment2/$$(basename $$(ls $(KERN_TDS)/T169*.krn))
	#cat $(KERN_TDS)/T232A*.krn | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 5.62/' > experiment2/$$(basename $$(ls $(KERN_TDS)/T232A*.krn))
	#cat $(KERN_TDS)/T271*.krn | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 5.92/' > experiment2/$$(basename $$(ls $(KERN_TDS)/T271*.krn))
	#myank -m 154-163 $$(ls $(KERN_TDS)/T339*.krn) | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 7.13/' > experiment2/$$(basename $$(ls $(KERN_TDS)/T339*.krn))
	#cat $(KERN_TDS)/T448*.krn | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 6.25/' > experiment2/$$(basename $$(ls $(KERN_TDS)/T448*.krn))
	#	#
	# The following example was hand edited to include the first quarter note of m181:
	#myank -m 177-180 $$(ls $(KERN_TDS)/T502*.krn) | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 7.1/' > experiment2/$$(basename $$(ls $(KERN_TDS)/T502*.krn))
	#
	#cat $(KERN_TDS)/T803*.krn | sed 's/excerpt-duration-sec:.*/excerpt-duration-sec: 8.56/' > experiment2/$$(basename $$(ls $(KERN_TDS)/T803*.krn))


##### ANALYSES #####

nested:
	@$(BINDIR)/getNestedRatio $(EXP)/*.krn


polarity:
	@$(BINDIR)/getPolarityRatio $(EXP)/*.krn


staff:
	@$(BINDIR)/getStaffCount $(EXP)/*.krn


range:
	@$(BINDIR)/getPitchRanges $(EXP)/*.krn


mean: pitch-mean
means: pitch-mean
pitch-means: pitch-mean
pitch-mean:
	@$(BINDIR)/getPitchMeans $(EXP)/*.krn


register:
	@$(BINDIR)/getPitchRegisters $(EXP)/*.krn


registerA:
	@$(BINDIR)/getPitchRegisters -g A $(EXP)/*.krn


registerB:
	@$(BINDIR)/getPitchRegisters -g B $(EXP)/*.krn


dissonant: dissonance
dissonance:
	@$(BINDIR)/getSonorityDissonance $(EXP)/*.krn


composite-count: cc
cc:
	@for i in $(EXP)/*.krn; do composite  $$i | extractx -i kern-comp | ridx -H | grep -v r |  grep -v "[]_]" | wc -l ; done


grpac: grpAEventCounts
grpAEventCounts:
	@for i in $(EXP)/*.krn; do composite -g $$i | extractx -i kern-grpA | ridx -H | grep -v r |  grep -v "[]_]" | wc -l ; done


grpbc: grpBEventCounts
grpBEventCounts:
	@for i in $(EXP)/*.krn; do composite -g $$i | extractx -i kern-grpB | ridx -H | grep -v r |  grep -v "[]_]" | wc -l ; done


coin: coin-count
coin-count: concidenceEventsCount
concidenceEventsCount:
	@for i in $(EXP)/*.krn; do composite -c $$i | extractx -i kern-coin | ridx -H | grep -v r |  grep -v "[]_]" | wc -l ; done


dur: duration
durs: duration
durations: duration
duration:
	@$(BINDIR)/getExampleDurations $(EXP)/*.krn


ed: event-density
event-density:
	@$(BINDIR)/getEventDensity $(EXP)/*.krn


edr: event-density-ratio
event-density-ratio:
	@$(BINDIR)/getEventDensityRatio $(EXP)/*.krn


nr: npvi-ratio
npvi-ratio:
	@$(BINDIR)/getNpviRatio $(EXP)/*.krn


tempo:
	bin/insertTempoRecords kern/*.krn


mididiss:
	mididiss $(EXP)/midi/*.mid




