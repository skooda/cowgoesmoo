build: build/application.zip build/package.zip

.PHONY: prereq
prereq:
	command -v zip || { echo >&2 "I require zip but it's not installed. Aborting."; exit 1; }
	mkdir build

build/application.zip: prereq
	zip -r build/application.zip app

build/package.zip: build/application.zip
	touch update.webapp
	zip build/package.zip build/application.zip update.webapp metadata.json
	rm update.webapp

clean:
	rm -r build