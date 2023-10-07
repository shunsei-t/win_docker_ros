set current_directory=%~dp0
set shared_dir_source=%current_directory%share
set shared_dir_dst=/home/grobo/share

mkdir %shared_dir_source%

docker run -it ^
           --rm ^
           -u 1000 ^
           --network=host ^
           --mount type=bind,src=%shared_dir_source%,target=%shared_dir_dst% ^
           --name robo_bash ^
           ros_noetic:turtlebot3