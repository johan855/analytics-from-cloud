
# Install confluent-kafka in python
pip install confluent-kafka

# Download and unzip Kafka
sudo apt install openjdk-8-jdk
cd ~
wget "http://www-eu.apache.org/dist/kafka/1.0.1/kafka_2.12-1.0.1.tgz"
tar -xvf kafka_2.12-1.0.1.tgz

# Add Kafka to PATH
echo "export PATH=~/.local/bin:$PATH" >> .bashrc
echo "export PATH=/home/etl_montredo/kafka_2.12-2.1.1/bin:$PATH" >> .bashrc

# Create data folders and modify property config (log folders and ports)
mkdir ~/kafka_2.12-2.1.1/data
mkdir ~/kafka_2.12-2.1.1/data/zookeeper
mkdir ~/kafka_2.12-2.1.1/data/kafka1
mkdir ~/kafka_2.12-2.1.1/data/kafka2


# Modify log folders
sed -i -e '/dataDir/ s/\/tmp\/zookeeper/~\/kafka_2.12-2.1.1\/data\/zookeeper/' \
    kafka_2.12-2.1.1/config/zookeeper.properties
sed -i -e '/dataDir/ s/\/tmp\/kafka-logs/~\/kafka_2.12-2.1.1\/data\/kafka1/' \
    kafka_2.12-2.1.1/config/server.1.properties
sed -i -e '/dataDir/ s/\/tmp\/kafka-logs/~\/kafka_2.12-2.1.1\/data\/kafka2/' \
    kafka_2.12-2.1.1/config/server.2.properties

# Modify broker.id
sed -i -e '/broker.id/ s/0/1/' kafka_2.12-2.1.1/config/server.1.properties
sed -i -e '/broker.id/ s/0/2/' kafka_2.12-2.1.1/config/server.2.properties

# Modify listeners
sed -i '/test/s/^#//g' file
sed -i -e '/listeners/ s/^#/' kafka_2.12-2.1.1/config/server.1.properties
sed -i -e '/listeners/ s/^#/' kafka_2.12-2.1.1/config/server.2.properties



# Initiallize Zookeeper
nohup zookeeper-server-start.sh kafka_2.12-2.1.1/config/zookeeper.properties &

# Start 2 Kafka brokers (General setup for 3 partitions, 2 brokers and rep. factor of 2 per topic)
nohup kafka-server-start.sh kafka_2.12-2.1.1/config/server.1.properties &
nohup kafka-server-start.sh kafka_2.12-2.1.1/config/server.2.properties &


TODO: Set sed to uncomment nth occurrence of the listener parameter