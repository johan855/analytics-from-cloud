# Install requirements
sudo apt-get install python-dev python-virtualenv -y &
sudo apt-get install redis-server -y

# Install and run a virtual environment
virtualenv tipboard-analytics-env &
source /home/johan855/tipboard-analytics-env/bin/activate

# Install and run Tipboard
pip install tipboard

# Run setup_tipboard.sh
