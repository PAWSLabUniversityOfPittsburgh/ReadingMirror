FROM python:3.10

WORKDIR /app
ENV DOCKER=1
ENV DOCKER_NETWORK = 1

EXPOSE 14987

CMD pip install --progress-bar off -r requirements.txt && python manage.py runserver 0.0.0.0:14987 --noreload