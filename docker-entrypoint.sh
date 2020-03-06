#!/bin/sh -e
#!/busybox/sh -e

. /venv/bin/activate
case "$1" in
  "server") nginx && gunicorn -b 127.0.0.1:9000 my_django_react_template.wsgi ;;
  *) exec "$@" ;;
esac