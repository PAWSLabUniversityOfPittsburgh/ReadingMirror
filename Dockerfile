FROM python:3.10

RUN apt-get update && apt-get install -y default-libmysqlclient-dev pkg-config

WORKDIR /app
ENV DOCKER=1

EXPOSE 14987

CMD pip install -r requirements.txt && python manage.py runserver 0.0.0.0:14987