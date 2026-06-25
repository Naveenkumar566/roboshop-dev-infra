#!/bin/bash

# We are creating total of 50gb root disk, but 20gb is only for partioned
#left over 30 gb we need to extend using below commands

sudo growpart /dev/nvme0n1 4                                         # We are increasing this folder size.  nvme0n1p4 is in /devices file(/dev), 4 is how many partions we need.
sudo lvextend -L +5G /dev/RootVG/homeVol                     #lvextend will resize the volume, increasing to 30 gb, dev/mapper/RootVG-homevol is file name.
sudo xfs_growfs /home                                                 # mounting it on /home.


yum install -y yum-utils shadow-utils                               #install terraform
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
yum install terraform