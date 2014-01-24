from ubuntu:precise

RUN	apt-get update
RUN   	apt-get install python-software-properties && add-apt-repository ppa:ubuntu-toolchain-r/test
RUN  	apt-get update && apt-get install gcc-4.8 g++-4.8
RUN 	update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
RUN 	update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
RUN 	update-alternatives --config gcc
RUN	update-alternatives --config g++
RUN 	apt-get install -y -q build-essential git qt4-qmake g++ libqtwebkit-dev
RUN 	cd / && git clone https://github.com/DeDiS/Dissent.git
RUN	apt-get install wget unzip
RUN	apt-get install libicu48
RUN	mkdir -p /compile/cryptopp && wget http://www.cryptopp.com/cryptopp562.zip && mv cryptopp562.zip /compile/cryptopp
RUN	cd /compile/cryptopp && unzip cryptopp562.zip && make -j 5
RUN	cd /compile/cryptopp make install
#RUN 	cd /Dissent && qmake application.pro && make
