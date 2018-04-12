FROM alpine:3.6
RUN apk add --no-cache python py2-pip curl
ENV FLASK_APP=app.py
WORKDIR	/usr/src
COPY . /usr/src/
RUN pip install -r requirements.txt
EXPOSE 5000
HEALTHCHECK --timeout=3s CMD curl -f http://localhost:5000/ || exit 1
CMD ["flask","run","-h","0.0.0.0"]
