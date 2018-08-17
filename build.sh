#!/bin/sh

PROJECT=yti-codelist-docker-java-base
DIR=$PWD/alpine
TAG="alpine"

if test "$#" -eq 1; then
  DIR=$PWD/$1
  TAG=$1
elif test "$#" -eq 2; then
  DIR=$PWD/$1
  TAG=$2
fi

echo "==================="
echo " Building container image:"
echo " docker build -t $PROJECT:$TAG -f $DIR/Dockerfile".
echo "==================="

docker build -t $PROJECT:$TAG -f $DIR/Dockerfile .
