FROM ubuntu:16.04

ENV LANG=C.UTF-8

RUN apt update && \
	apt install -y tzdata git curl python-software-properties software-properties-common && \
	add-apt-repository ppa:ondrej/php -y && \
	apt update && \
	apt install -y composer php7.2-intl php7.2-curl php7.2-xml php7.2-mbstring php7.2-mysql php7.2-fpm && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -y nodejs

WORKDIR	/opt

RUN git clone https://github.com/Limenius/symfony-react-sandbox.git && \
	cd symfony-react-sandbox && \
	composer install && \
	npm install 

WORKDIR	/opt/symfony-react-sandbox
COPY run.sh .
ENTRYPOINT ./run.sh
