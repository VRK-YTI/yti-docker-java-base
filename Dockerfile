FROM amazoncorretto:11.0.22-alpine3.19@sha256:1a24347f430decabc6ecdb1cb5175cd9f70c1de7d36b2c902d904ba66fb70cba

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# Variables
ENV home_dir /data
ENV log_dir ${home_dir}/logs
ENV deploy_dir ${home_dir}/deploy

# Install common tools
RUN set -x \
    && apk update && apk upgrade \
    && apk add --no-cache bash \
    && apk add --no-cache fontconfig \
    && apk add --no-cache ttf-dejavu 

# Add scripts
ADD scripts/bootstrap.sh /

# Create directories
RUN mkdir -p ${log_dir} \
    && mkdir -p ${deploy_dir}

WORKDIR ${deploy_dir}
