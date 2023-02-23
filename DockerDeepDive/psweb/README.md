# Simple web app for Pluralsight courses and Docker Deep Dive book

Exposes web server on port `8080` as per `./app.js`

See `Dockerfile` for more details

Referenced in:
- [Docker Deep Dive](https://www.amazon.com/Docker-Deep-Dive-Nigel-Poulton/dp/1521822808/ref=tmm_pap_swatch_0?_encoding=UTF8&qid=&sr=) 
- Getting Started with Docker video course (pluralsight.com)

**The app is maintained approximately once per year so may contain vulnerbilities.**

build image: docker image build -t web:latest .
add tag: docker image tag web:latest jackhwl/web:latest
push to hub: docker image push jackhwl/web:latest
run the container: docker container run -d --name c1 -p 80:8080 web:latest
