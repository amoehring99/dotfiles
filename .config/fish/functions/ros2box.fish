function ros2box
    distrobox-enter -n ubuntu-22-04 -- bash -c "source /opt/ros/humble/setup.bash && ros2 $argv"
end
