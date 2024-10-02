#!/bin/bash

# Variables
YAML_FILE='mount-points.yaml'

# Backup the current /etc/fstabfile
cp /etc/fstab /etc/fstab.bak-$(date +%Y-%m-%d)

  # Generate the fstab line
yq e '.fstab[] | select(.type != "nfs") | .device + " " + .mount + " " + .type' mount-points.yml | tee -a fstab
yq e '.fstab[] | select(.type == "nfs") | .device + ":" + .mount + " " + .export + " " + .type + " " + .options[0] + "," + .options[1]' mount-points.yml | tee -a fstab | sed 's/,\s*$//'

# Increase root reserve size
percentage=$(yq e '.fstab[] | select(.root-reserve == "*")' $YAML_FILE) # get the percentage to be increased in the yaml file

tune2fs -m ${percentage%\%} /dev/sdb1 # Increase the size command