<<<<<<< HEAD
﻿FROM python:3.14-slim

WORKDIR /django-app
=======
FROM python:3.12-slim

WORKDIR /app
>>>>>>> c588b25e8e93f41fb3a9d9a3687185eed7c3e227

RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

<<<<<<< HEAD
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
=======
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
>>>>>>> c588b25e8e93f41fb3a9d9a3687185eed7c3e227
