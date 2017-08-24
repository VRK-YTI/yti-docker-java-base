FROM ubuntu:14.04

######
# Install tools
######

# Install common tools
RUN \
  apt-get update && \
  apt-get -y install python-software-properties && \
  apt-get -y install software-properties-common

# Install Java
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
  add-apt-repository ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  apt-get install -y ca-certificates && \
  apt-get install -y oracle-java8-unlimited-jce-policy && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

######
# Copy scripts
######
COPY scripts/bootstrap.sh /

######
# Create directories
######

# Logging dir
ENV log_dir /data/logs
RUN mkdir -p ${log_dir}

# Define working directory
ENV deploy_dir /data/deploy/
RUN mkdir -p ${deploy_dir}
WORKDIR ${deploy_dir}
