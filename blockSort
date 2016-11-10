#./bin/bash
lsblk --noheadings --raw | sed s/"K"/" K"/ | sed s/"M"/" M"/ | sed s/"G"/" G"/ | sort -k5,2 -k4,1n
