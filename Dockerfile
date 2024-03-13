FROM amazoncorretto:17.0.10-alpine3.19@sha256:180e9c91bdbaad3599fedd2f492bf0d0335a9382835aa64669b2c2a8de7c9a22

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
    && apk add --no-cache fontconfig

# Add scripts
ADD scripts/bootstrap.sh /

# Create directories
RUN mkdir -p ${log_dir} \
    && mkdir -p ${deploy_dir}

WORKDIR ${deploy_dir}
