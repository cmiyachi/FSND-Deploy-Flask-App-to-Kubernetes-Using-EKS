FROM python:stretch

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENV GUNICORN_CMD_ARGS="--env-file=env_file"

EXPOSE 8080

ENTRYPOINT ["gunicorn"  , "-b", ":8080", "main:APP"]

