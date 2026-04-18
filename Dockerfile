FROM python:3.10

WORKDIR /app
ENV DOCKER=1

EXPOSE 14987


CMD sh -c "pip install --progress-bar off -r requirements.txt && python manage.py collectstatic --noinput && gunicorn ereader.wsgi:application --bind 0.0.0.0:14987 --workers 1 --threads 1 -k sync --no-sendfile --preload"