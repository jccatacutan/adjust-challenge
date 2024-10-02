#!/bin/bash

# Filename
YAML_FILE='mount-points.yaml'

# Backup the current /etc/fstab file
cp /etc/fstab /etc/fstab.bak-$(date +%Y-%m-%d)

# Increase root reserve size
percentage=$(yq e '.fstab[2] | .root-reserve' $YAML_FILE) # get the percentage to be increased in the yaml file

# Increase the size command
tune2fs -m ${percentage%\%} /dev/sdb1 

# Generate the fstab line
yq e '.fstab[] | select(.type != "nfs") | .device + " " + .mount + " " + .type' $YAML_FILE | tee -a fstab
yq e '.fstab[] | select(.type == "nfs") | .device + ":" + .export + " " + .mount + " " + .type  + " " + .options[0] + "," + .options[1]' $YAML_FILE | tee -a fstab | sed 's/,\s*$//'



