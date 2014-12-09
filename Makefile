export PATH := ./node_modules/.bin/:$(PATH)

.PHONY: clean

node_modules_js_files = $(shell find node_modules -type f -name '*.js')
src_js_files = $(shell find src -type f -name '*.js')

dist/app.js: src/index.js $(node_modules_js_files) $(src_js_files)
	browserify -d src/index.js | exorcist dist/app.js.map > $@

dist/app.min.js: dist/app.js
	uglifyjs dist/app.js -c > $@

clean:
	rm dist/*
