FROM amazoncorretto:11.0.22

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# Variables
ENV home_dir /data
ENV log_dir ${home_dir}/logs
ENV deploy_dir ${home_dir}/deploy

# Install common tools
RUN set -x \ 
    && yum update -y && yum upgrade -y \
    && yum install -y bash fontconfig 

# Add scripts
ADD scripts/bootstrap.sh /

# Create directories
RUN mkdir -p ${log_dir}
RUN mkdir -p ${deploy_dir}

WORKDIR ${deploy_dir}
