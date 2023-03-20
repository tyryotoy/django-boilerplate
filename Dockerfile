FROM python:3.11-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev

WORKDIR /app/backend
RUN python3 -m pip install --upgrade pip
ADD . /app/backend

RUN python3 -m pip install -r requirements.txt
COPY . /app/backend/

EXPOSE 8888
