
#!/bin/bash 

Status=$(synclient -l | grep Touchpad | awk '{print $3}')

if [ "$Status" = "0" ];then 
    echo "  Enable "
else
    echo "  Disable "
fi 
