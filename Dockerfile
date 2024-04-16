FROM alpine:latest

ENV HOST=localhost
ENV CONFIG=/config/config.json

RUN apk add \
	ffmpeg \
	py3-pip \
	tzdata

RUN pip3 install \
	flask \
	requests \
	waitress

# Copy files
COPY /app.py /app/app.py
COPY /stb.py /app/stb.py
COPY /templates /app/templates
COPY /static /app/static

ENTRYPOINT ["python3","-u","/app/app.py"]
