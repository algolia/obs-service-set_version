prefix = /usr
PYTHON ?= python3

servicedir = ${prefix}/lib/obs/service

all:

install:
	install -d $(DESTDIR)$(servicedir)
	install -m 0755 set_version $(DESTDIR)$(servicedir)
	install -m 0644 set_version.service $(DESTDIR)$(servicedir)

test:
	flake8 set_version tests/
	echo "Using python ${PYTHON}"
	${PYTHON} --version
	${PYTHON} -m unittest discover tests/

clean:
	find -name "*.pyc" -exec rm {} \;
	find -name '*.pyo' -exec rm {} \;
	rm -rf set_versionc

.PHONY: all install test
