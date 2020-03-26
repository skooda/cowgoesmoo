build: build/application.zip build/package.zip

.PHONY: prereq
prereq:
	command -v zip || { echo >&2 "I require zip but it's not installed. Aborting."; exit 1; }
	mkdir build

build/application.zip: prereq
	cd app &&zip -r ../build/application.zip ./

build/package.zip: build/application.zip
	touch build/update.webapp
	cp metadata.json build
	cd build &&zip package.zip application.zip metadata.json update.webapp
	rm build/update.webapp
	rm build/metadata.json

clean:
	rm -r build