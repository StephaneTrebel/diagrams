.DEFAULT: help

DIST:=dist

#: Show help
.PHONY: help
help:
	@grep -B2 -E "^[a-zA-Z0-9_-%]+\:" Makefile \
     | grep -v -E ".PHONY\: [a-zA-Z0-9_-]+" \
     | grep -v -- -- \
     | sed 'N;s/\n/###/' \
     | sed -n 's/^#: \(.*\)###\(.*\):.*/\2###\1/p' \
     | column -t  -s '###'

#: Install dependencies
.PHONY: install
install:
	sudo apt install \
		# Converts plantUML files to images
		plantuml
		# Handy file watcher
		entr

#: Generate all SVG images in `dist` directory
all:
	plantuml -o $(DIST) -tsvg *.puml

#: Generate an SVG image from its plantUML script
$(DIST)/%.svg: %.puml
	plantuml -o $(DIST) -tsvg $<

#: Watch for plantUML files and generate images when updated
.PHONY: watch
watch:
	ls *.puml | entr plantuml -o $(DIST) -tsvg /_

#: Remove generated images
.PHONY: clean
clean:
	rm -rf $(DIST)
