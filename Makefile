all: modularize-script minify-script convert-style minify-style lessify-style copy-assets

include ../../build/modules.mk

MODULE = uniform
MODULARIZE_OPTIONS = -jq

SOURCE_SCRIPT_FOLDER = .

SOURCE_STYLE_FILE = css/uniform.default.css

SOURCE_ASSET_FILES = images/*
TARGET_ASSET_FOLDER_NAME = images

TARGET_STYLE_CONVERTER = sed "s/url('..\/images/url('images/g"
TARGET_STYLE_LESS_CONVERTER = sed "s/url('..\/images/url('@{foundry_uri}\/uniform\/images/g" | \
	sed "s/filter: alpha(opacity:0)/filter: ~\"alpha(opacity:0)\"/g"