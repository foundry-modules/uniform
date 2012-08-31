include ../../build/modules.mk

MODULE		= uniform
FILENAME	= jquery.${MODULE}.js
OUTPUTFILE	= ${MODULE}.js
SOURCE 		= ${FILENAME}
PRODUCTION	= ${PRODUCTION_DIR}/${OUTPUTFILE}
DEVELOPMENT = ${DEVELOPMENT_DIR}/${OUTPUTFILE}
PRODUCTION_FOLDER	= ${PRODUCTION_DIR}/${MODULE}
DEVELOPMENT_FOLDER	= ${DEVELOPMENT_DIR}/${MODULE}

all: premake body assets

premake:
	mkdir -p ${DEVELOPMENT_FOLDER}
	mkdir -p ${PRODUCTION_FOLDER}

body:
	${MODULARIZE} -jq -n "${MODULE}" ${SOURCE} > ${DEVELOPMENT}
	${UGLIFYJS} ${DEVELOPMENT} > ${PRODUCTION}

assets:

	# Create css folder
	mkdir -p ${DEVELOPMENT_FOLDER}/css
	mkdir -p ${PRODUCTION_FOLDER}/css

	# Create images folder
	mkdir -p ${DEVELOPMENT_FOLDER}/images
	mkdir -p ${PRODUCTION_FOLDER}/images

	cp -Rp css/* ${DEVELOPMENT_FOLDER}/css/
	cp -Rp css/* ${PRODUCTION_FOLDER}/css/

	cp -Rp images/* ${DEVELOPMENT_FOLDER}/images/
	cp -Rp images/* ${PRODUCTION_FOLDER}/images/

clean:
	rm -rf ${DEVELOPMENT}
	rm -rf ${DEVELOPMENT_FOLDER}
	rm -rf ${PRODUCTION}
	rm -rf ${PRODUCTION_FOLDER}