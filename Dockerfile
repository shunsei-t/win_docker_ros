FROM osrf/ros:noetic-desktop-full

RUN apt-get update &&\
    apt-get install ros-noetic-navigation ros-noetic-turtlebot3 ros-noetic-turtlebot3-gazebo -y
#     apt-get install -y sudo
    # curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - &&\
# RUN apt-get update && apt-get ros-noetic-navigation ros-noetic-turtlebot3 ros-noetic-turtlebot3-gazebo -y

ARG USERNAME=grobo
ARG GROUPNAME=grobo
ARG UID=1000
ARG GID=1000
ARG PASSWORD=grobo
# RUN groupadd -g $GID $GROUPNAME && \
#     useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
#     echo $USERNAME:$PASSWORD | chpasswd && \
#     echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd
USER $USERNAME
WORKDIR /home/$USERNAME/

RUN mkdir /home/$USERNAME/share

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
# xserverの設定。hostのipアドレス:0.0
RUN echo "export DISPLAY=host.docker.internal:0.0" >> ~/.bashrc
RUN echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc

ENTRYPOINT [ "bash" ]
