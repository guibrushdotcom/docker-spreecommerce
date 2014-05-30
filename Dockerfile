FROM ubuntu

RUN apt-get install -y curl build-essential

WORKDIR /tmp
RUN curl -sSL https://get.rvm.io | /bin/bash -s stable
RUN rvm install 2.1 \
	&& rvm use 2.1 \
	&& gem install rails -v 4.0.5 \
	&& gem install spree \
	&& rails _4.0.5_ new my_store \
	&& mkdir /opt/spree

WORKDIR /opt/spree
	&& spree install my_store