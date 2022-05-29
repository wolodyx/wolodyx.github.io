#!/bin/bash
set -e

if [ ! -f Gemfile ]; then
  echo "sudo docker build -t my-site ."
  echo "sudo docker run -p 127.0.0.1:4000:4000 --volume \$(pwd):/site --rm -it my-site"
  exit 1;
fi

bundle install

exec "$@"

