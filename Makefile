ZIP_IGNORE=$(addprefix -x , \*.swp .git/\* ${DIST_DIR}/\* .gitignore .vimrc Makefile)

default: run

run:
	@love .

love:
	@zip -9 ${ZIP_IGNORE} -r dist/dvdsimulator.love .
