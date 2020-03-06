FROM python:3.7.6-alpine3.11

COPY . /app

WORKDIR /app
RUN apk --update add gcc g++ git nginx postgresql-dev libffi-dev npm \
    # if you don't need postgres, remember to remove postgresql-dev and sqlalchemy
    && python3 -m venv /venv \
    && . /venv/bin/activate \
    && pip install --no-cache-dir poetry \
    && poetry install --no-interaction --no-dev \
    && npm install; npm install -g bower \
    # use bower to install js library
    && python manage.py bower install \
    && apk del gcc git \
    && pip uninstall -yq poetry \
    && rm -rf /tmp/* /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8000

# Setup ENTRYPOINT
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["server"]