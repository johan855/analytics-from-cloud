#Download and unzip Kafka
sudo apt-get update
sudo apt install openjdk-8-jdk
cd ~
wget "http://www-eu.apache.org/dist/kafka/1.0.1/kafka_2.12-1.0.1.tgz"
tar -xvf kafka_2.12-1.0.1.tgz

#Add Kafka to PATH
echo "export PATH=~/.local/bin:$PATH" >> .bashrc
echo "export PATH=/home/etl_montredo/kafka_2.12-2.1.1/bin:$PATH" >> .bashrc

#Create data folders and modify property config
mkdir ~/kafka_2.12-2.1.1/data
mkdir ~/kafka_2.12-2.1.1/data/kafka
mkdir ~/kafka_2.12-2.1.1/data/zookeeper

sed -i -e '/dataDir/ s/\/tmp\/zookeeper/~\/kafka_2.12-2.1.1\/data\/zookeeper/' \
    kafka_2.12-2.1.1/config/zookeeper.properties
sed -i -e '/dataDir/ s/\/tmp\/kafka-logs/~\/kafka_2.12-2.1.1\/data\/kafka/' \
    kafka_2.12-2.1.1/config/zookeeper.properties

#Initiallize Zookeeper
nohup zookeeper-server-start.sh kafka_2.12-2.1.1/config/zookeeper.properties &

#Initiallize Kafka Broker
nohup kafka-server-start.sh kafka_2.12-2.1.1/config/server.properties &