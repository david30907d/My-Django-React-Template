# My Django React Template[![Build Status](https://travis-ci.org/UDICatNCHU/udic-nlp-API.svg?branch=master)](https://travis-ci.org/UDICatNCHU/udic-nlp-API)

# My Django React Template

## Install

1. `pip3 install pipenv`
2. `pipenv install; pipenv shell`
3. `python manage.py bower install`
4. `npm install; npm install -g bower`
5. `./node_modules/.bin/webpack --config webpack.config.index.js`
    * If you have new entry file, create a new webpack config and run `./node_modules/.bin/webpack --config webpack.config.<placeholder>.js`
    * eq: `./node_modules/.bin/webpack --config webpack.config.api.js`
    * eq: `./node_modules/.bin/webpack --config webpack.config.member.js`

2. `git clone https://github.com/udicatnchu/udic-nlp-api`
3. `cd udic-nlp-api`
4. Need to specify which port to be exported for api server:`export OUTPUT_PORT=80`
5. `docker-compose --compatibility up -d`:
    This command will create three containers

    (check [Config](#config) to know further detail)
    1. Django (named as udic-nlp-api_web_1)
    2. MongoDB (named as udic-nlp-api_mongo_1)
    3. MySQL (named as udic-nlp-api_db_1)
6. `docker exec -it udic-nlp-api_db_1 bash`:Enter into the MySQL container
    * Insert WikiDump into MySQL:`nohup download_wikisql.sh <lang> &`
    * This command can be executed simultaneously with `command 7`
7. `docker exec -it udic-nlp-api_web_1 bash`:enter into the Django container
    * Build Model:`nohup bash -c 'time bash install.sh <lang>' &`
        * Env: 109G RAM, 32 cores
        * Execute time:
        ```bash
          real  2352m46.045s
          user  12311m52.132s
          sys   533m10.096s
        ```
8. After finishing the building process, you need to restart the Django container (udicnlpapi_web_1):`docker restart udic-nlp-api_web_1`
9. That's it !

