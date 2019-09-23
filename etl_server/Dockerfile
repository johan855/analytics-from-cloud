FROM ubuntu:18.04
RUN apt-get update
RUN apt install python3-pip -y
RUN pip3 install numpy \
 && pip3 install cython \
 && pip3 install pystan \
 && pip3 install fbprophet
RUN apt-get update
# Add after this to containerize one python script
RUN mkdir /home/python_scripts
# Don't forget to create the .py file before
COPY forecast_prophet.py /home/python_scripts/forecast_prophet.py
CMD python3 /home/python_scripts/forecast_prophet.py
