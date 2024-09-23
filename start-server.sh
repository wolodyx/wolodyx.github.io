docker build -t wolodyx.github.io .
docker run -p 127.0.0.1:4000:4000 --volume $(pwd):/site --rm -it wolodyx.github.io

