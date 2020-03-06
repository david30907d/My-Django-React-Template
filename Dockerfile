FROM python:3.7.6-alpine3.11

COPY . /app

WORKDIR /app
RUN apk --update add gcc g++ git nginx postgresql-dev libffi-dev
RUN pip install --no-cache-dir poetry
RUN poetry install
RUN apk del gcc git \
    && rm -rf /tmp/* /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8000

CMD nginx && gunicorn -b 127.0.0.1:9000 my_django_react_template.wsgi
# if you don't need postgres, remember to remove postgresql-dev and sqlalchemy