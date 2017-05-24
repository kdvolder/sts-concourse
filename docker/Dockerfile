FROM ubuntu:16.04

# First the small stuff needed to install the bigger stuff
RUN apt-get update && apt-get install -y \
  apt-transport-https \
  curl

RUN curl https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb http://packages.cloudfoundry.org/debian stable main" >> /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN apt-get update && apt-get install -y \
  git \
  openjdk-8-jdk \
  openjfx \
  maven \
  xvfb \
  icewm \
  cf-cli

CMD /bin/bash  
