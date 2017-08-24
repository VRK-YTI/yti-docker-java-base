FROM java:8-jre

# Variables
ENV log_dir /data/logs
ENV deploy_dir /data/deploy/

# Add scripts
ADD scripts/bootstrap.sh /

# Create directories
RUN mkdir -p ${log_dir} \
    && mkdir -p ${deploy_dir}

WORKDIR ${deploy_dir}
