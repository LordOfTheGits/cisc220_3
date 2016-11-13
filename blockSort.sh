#!/bin/bash
lsblk --noheadings --raw | sed s/"K"/" K"/ | sed s/"M"/" M"/ | sed s/"G"/" Z"/ | sort -k5,5d -k4,4n | sed s/" K"/"K"/ | sed s/" M"/"M"/ | sed s/" Z"/"G"/
