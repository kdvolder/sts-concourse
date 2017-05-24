FROM ubuntu:16.04

# First the small stuff needed to install the bigger stuff
RUN apt-get update && apt-get install -y \
  curl

# Add non-default repos
RUN curl - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -

# Install stuff
RUN apt-get update && apt-get install -y \
  cf-cli \
  git \
  openjdk-8-jdk \
  openjfx \
  maven \
  curl \
  xvfb \
  icewm

CMD /bin/bash  
