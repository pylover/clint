PRJ = prettyc
PIP = pip3
HERE = $(shell readlink -f `dirname .`)
VENVNAME = $(shell basename $(HERE) | cut -d'-' -f1)
VENV = $(HOME)/.virtualenvs/$(VENVNAME)


.PHONY: venv
venv:
	python3 -m venv $(VENV)


.PHONY: dev
dev:
	$(PIP) install -r requirements-dev.txt
	$(PIP) install -e .


.PHONY: dist
dist:
	python setup.py sdist


.PHONY: install
install:
	$(PIP) install .
