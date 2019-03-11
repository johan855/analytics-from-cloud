FROM ubuntu:18.04
RUN sudo apt-get update \
    sudo apt install python3-pip -y \
    pip3 install numpy \
    pip3 install cython \
    pip3 install pystan \
    pip3 install fbprophet