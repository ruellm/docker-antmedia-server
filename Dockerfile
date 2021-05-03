FROM ubuntu:20.04

#prepare dependencies
RUN apt-get update && apt-get -y install libx11-dev unzip wget openjdk-8-jdk ca-certificates p11-kit --no-install-recommends

# download antmedia server zip file
# note replace the link for Enterprise version when available
RUN wget https://github.com/ant-media/Ant-Media-Server/releases/download/ams-v2.3.2/ant-media-server-2.3.2-community-2.3.2-20210422_0754.zip

# download installation script
RUN wget https://raw.githubusercontent.com/ant-media/Scripts/master/install_ant-media-server.sh \
         && chmod 755 install_ant-media-server.sh

# install antmedia server from zip
RUN ./install_ant-media-server.sh -i sudo ant-media-server-2.3.2-community-2.3.2-20210422_0754.zip

ENTRYPOINT sudo service antmedia start
