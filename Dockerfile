#nous partons de l’image de Python 3.8, et plus particulièrement de sa version alpine. 
#Alpine Linux est une solution Linux connue pour sa panoplie d’outils légère, et complète.
# FROM python:3.8-alpine as base

#Nous installons quelques paquets nécessaires à la construction de notre image (dont pip).
# RUN apk update && apk add postgresql-dev gcc musl-dev
# RUN /usr/local/bin/python -m pip install --upgrade pip

#Nous créons un répertoire de travail (dans les conteneurs qui seront exécutés) appelé /code.
# WORKDIR /code
# COPY . /code

# nous configurons quelques variables d’environnement pour que le conteneur fonctionne correctement
# RUN pip install -r requirements-dev.txt
# nous installons les configurations requises (en mode développement pour cet exercice)
# ENV DATABASE_URL postgres://localhost/twitter_api_flask
# ENV FLASK_APP wsgi.py
# ENV FLASK_ENV development

# EXPOSE 5000
# Nous configurons une commande à exécuter lorsque le conteneur est lancé.
# CMD ["flask", "run", "--host", "0.0.0.0"]

# a. mettre à jour notre Dockerfile en conséquence

FROM python:3.8-alpine as base

RUN apk update && apk add postgresql-dev gcc musl-dev bash
RUN pip install --upgrade pip

WORKDIR /code
COPY . /code

RUN pip install -r requirements-dev.txt

EXPOSE 5000

ENV FLASK_APP wsgi.py
# nous avons supprimé certaines variables d’environnement
# nous supprimons l’instruction CMD que le conteneur doit exécuter