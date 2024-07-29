FROM python:3.9-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config
    && rm -rf /var/lib/apt/lists/*

COPY requirement.txt .

RUN pip install --no-cache-dir -r requirement.txt
RUN pip install sqlclient

COPY . .

CMD ['python3','app.py']



