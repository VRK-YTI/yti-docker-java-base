FROM amazoncorretto:17@sha256:04d53492ebeee876914966424e25f86e6ccd44395356ee0d9ec9c451726a4684

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# Variables
ENV home_dir /data
ENV log_dir ${home_dir}/logs
ENV deploy_dir ${home_dir}/deploy

# Install common tools
RUN set -x \ 
    && yum update && yum upgrade \
    && yum install bash fontconfig 

# Add scripts
ADD scripts/bootstrap.sh /

# Create directories
RUN mkdir -p ${log_dir} \
    && mkdir -p ${deploy_dir}

WORKDIR ${deploy_dir}
