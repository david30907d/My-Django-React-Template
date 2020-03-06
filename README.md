# My Django React Template[![Build Status](https://travis-ci.com/david30907d/My-Django-React-Template.svg?branch=master)](https://travis-ci.com/david30907d/My-Django-React-Template)

# My Django React Template

## Install

1. local:
    1. `pip3 install poetry`
    2. `poetry install`
    3. `python manage.py bower install`
    4. `npm install; npm install -g bower`
    5. `./node_modules/.bin/webpack --config webpack.config.index.js`
        * If you have new entry file, create a new webpack config and run `./node_modules/.bin/webpack --config webpack.config.<placeholder>.js`
        * eq: `./node_modules/.bin/webpack --config webpack.config.api.js`
        * eq: `./node_modules/.bin/webpack --config webpack.config.member.js`
2. travis:
    1. `docker-compose build`

## Run

`docker-compose up --remove-orphans web postgres`

## Test

Please check [.travis.yml](.travis.yml)

## Deploy

All you need to do is `git push` and then wait for Travis-CI to do the `CD` job for you.

He would patch the latest Docker image to `k8s`

![doc](doc/travis-gke.png)