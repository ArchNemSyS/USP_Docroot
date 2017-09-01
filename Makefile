# !!! MAKE DOES NOT ALLOW SPACES IN PATHS OR FILENAMES !!!
.SUFFIXES: 
.SUFFIXES: .usp .htt

PREFIX = /usr/local
PROJDIR := $(realpath $(CURDIR))
SOURCEDIR := $(PROJDIR)/src
INCLUDE_DIR = $(PROJDIR)/include
BUILDDIR := $(PROJDIR)/docroot

# Sources can safely be combined for simplicity 
# this can create redundant build rules 
SOURCES_USP := $(shell find ${SOURCEDIR} -name '*.usp')
USP_SOURCE_DIRS = $(sort $(dir $(SOURCES_USP)))
USP_TARGET_DIRS := $(subst $(SOURCEDIR),$(BUILDDIR),$(USP_SOURCE_DIRS))

SOURCES_HTT := $(shell find ${SOURCEDIR} -name '*.htt')
HTT_SOURCE_DIRS = $(sort $(dir $(SOURCES_HTT)))
HTT_TARGET_DIRS := $(subst $(SOURCEDIR),$(BUILDDIR),$(HTT_SOURCE_DIRS))

VPATH = $(sort $(USP_SOURCE_DIRS) $(HTT_SOURCE_DIRS))



all : sync usp html
.PHONY : all 

# to stop unwanted source to build syncing
# add additional --exclude patterns like below
# or add an exclude file (man rsync)
sync :
	rsync -avz --exclude '*.htt' ${SOURCEDIR}/* ${BUILDDIR} 



usp : \
	$(subst $(SOURCEDIR),$(BUILDDIR),$(SOURCES_USP:.usp=.so))

define generateRules_so
$(1)%.so: %.usp
	usp_compile.sh -i ${INCLUDE_DIR} -o $$(@D)  $$<
endef
$(foreach targetdir, $(USP_TARGET_DIRS), $(eval $(call generateRules_so, $(targetdir))))



html : \
	$(subst $(SOURCEDIR),$(BUILDDIR),$(SOURCES_HTT:.htt=.html))

define generateRules_html
$(1)%.html: %.htt
	gpp -I${INCLUDE_DIR} -C $$< -o $$@
endef
$(foreach targetdir, $(HTT_TARGET_DIRS), $(eval $(call generateRules_html, $(targetdir))))


.PHONY: clean

clean:
	rm -Rf $(BUILDDIR)
