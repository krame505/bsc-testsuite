#
CONFDIR = $(realpath .)
KEEPFILES = test_list.sh
RUNTESTFLAGS = --tool bsc 
LOCALCHKCMD = echo "Local check is not supported at top level" 

## 

## default top level target    run all tests
all:	check
	@echo "ran all tests"


include norealclean.mk


# includes the groups list which is generated by script from testsuite tree
-include groups.list


# These are a list of long running test which are not include in the basic tests --
# that is when    make dev.group  is run
# make check runs all tests 
long_tests.list = \
	Boolify \
	ETooManySteps \
	List \
	ListN \
	ListN_old \
	PopCount \
	bsc_examples \
	bsv05 \
	bugID403 \
	cache_coherence \
	course_lab \
	des_core \
	floating_point \
	idct \
	pong \
	reginit \
	rotors_control \
	three_way_round_robin_arbiter \
	verilog \
        bscpong \
	spiless-tx-bsv \
	spiless-tx-bsv-cocoon \


smoke_test.list = \
	options \
	quirks  \
	compile \
	gcd \
	example_misc.exp \
	fib1 \
	typechecker \
	firfilter \
	compile \
	if \
	verilog \
	undet \
	comments \
	vcd \
	inline \
	astate \
	interfacecalls \
	time \
	tasks \
	noinline \
	portprops \
	mcd \
	options \
	schedule \
	handshake_protocol \
	b247 \
        statename \
        rwire \
        fifo \
        rega \
	commands \
	evaluator \


# we want to make this all the time 
groups.list: test_list.sh Makefile
	rm -f groups.list 
	./test_list.sh $(long_tests.list) > groups.list


## This target makes any .exp file found in the directories below 
## E.g., make rulesort.check
.PHONY: .check
%.check : clean
	$(RUNTESTENV) $(RUNTEST) $(RUNTESTFLAGS) --tool bsc $(basename $@).exp

.PHONY: fullcheck
fullcheck: clean releasecheck

.PHONY: enablelongtests
enablelongtests:
	cd bsc.long_tests && $(MAKE) all

.PHONY: releasecheck
releasecheck: enablelongtests
	$(RUNTESTENV) $(RUNTEST) $(RUNTESTFLAGS) 

## this target makes a custom suite of tests which are defined in the .list section above.
## usage -- make scheduler.group 
.PHONY: .group
%.group	: clean groups.list 
	$(RUNTESTENV) $(RUNTEST) $(RUNTESTFLAGS)   $(addsuffix .exp, $($(basename $@).list))

.PHONY:	smoke
smoke:	smoke_test.group 

SUBDIRS := $(dir $(wildcard bsc.*/Makefile*))

.PHONY: realclean
realclean: clean
	-rm -f groups.list 
	-rm -f *.tar.gz
	-rm -f bsc.log*
	-rm -f `find . -name '*~' -o -name 'core'`
	-rm -f testrun.html

.PHONY:	submakefiles

submakefiles:
	@for dir in $(SUBDIRS) ; do \
	if [ ! -f "$$dir/Makefile" ] ; then \
	echo 'doing cp for '$$dir ; \
	cp config/mkclean.Makefile $$dir/Makefile ;\
	elif ! egrep '^clean:|clean\.mk' $$dir/Makefile > /dev/null ; \
	then echo 'doing cat for '$$dir ; \
	cat config/mkclean.Makefile >> $$dir/Makefile ; \
	fi ; done

