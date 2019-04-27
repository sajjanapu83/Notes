FROM alpine
MAINTAINER KK512
CMD ["echo", "Hello"]

#docker build -f Dockerfile.CMD -t d_cmd .
#docker run d_cmd
#docker run d_cmd echo hello world