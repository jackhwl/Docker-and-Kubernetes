#!/bin/bash
ng build --prod 
docker build  -f Dockerfile -t frontend .
docker tag frontend jackhwl/frontend:1.1
docker push jackhwl/frontend:1.1
