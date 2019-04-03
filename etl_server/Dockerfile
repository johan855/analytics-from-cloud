FROM ubuntu:18.04
RUN apt-get update
RUN apt install python3-pip -y
RUN pip3 install numpy \
 && pip3 install cython \
 && pip3 install pystan \
 && pip3 install fbprophet
RUN apt-get update