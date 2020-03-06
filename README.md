# My Django React Template[![Build Status](https://travis-ci.org/UDICatNCHU/udic-nlp-API.svg?branch=master)](https://travis-ci.org/UDICatNCHU/udic-nlp-API)

# My Django React Template

## Install

1. `pip3 install poetry`
2. `poetry install`
3. `python manage.py bower install`
4. `npm install; npm install -g bower`
5. `./node_modules/.bin/webpack --config webpack.config.index.js`
    * If you have new entry file, create a new webpack config and run `./node_modules/.bin/webpack --config webpack.config.<placeholder>.js`
    * eq: `./node_modules/.bin/webpack --config webpack.config.api.js`
    * eq: `./node_modules/.bin/webpack --config webpack.config.member.js`