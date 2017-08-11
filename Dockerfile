FROM python:alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN git clone https://github.com/overridden/flask-trader /usr/src/app/flask-trader
EXPOSE 5000
CMD [ "python", "/usr/src/app/flask-trader/trader.py" ]
