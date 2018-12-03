init:
	pip install -r reqs/dev-requirements.txt
	pip install -r reqs/travis-requirements.txt

test:
	py.test -rf -s --cov=lifelines -vv --block=False --cov-report term-missing

lint:
ifeq ($(TRAVIS_PYTHON_VERSION), 2.7)
		echo "Skip linting for Python2.7"
else
		prospector --output-format grouped
endif

format:
	black .

check_format:
ifeq ($(TRAVIS_PYTHON_VERSION), 3.6)
		black . --check
else
		echo "Only check format on Python3.6"
endif
