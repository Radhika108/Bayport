What is the command to list the contents of a direcory, line by line and ordered by size ascending in human readable format?
`ls -lSrh`

How would you add a DNS server to a network interface in Linux?
`/etc/network/interfaces`

If the DNS server you've just added is not reachable, how can you get any particular hostname to resolve locally?
`Add the hostname to the '/etc/hosts' file`

How would you check for SELinux related errors?
`Check the '/var/log/audit/audit.log' and '/var/log/messages' files or the **journald**`

Write the commands to add 30GB disk space to a logical volume named "docker" that belongs to a logical group named "docker-group".
`lvextend -L+30G docker`
 58  
listit.sh
@@ -0,0 +1,58 @@
#!/bin/bash

################################################################################
#                              listit.sh                                       #
#                                                                              #
# Author:   Radhika  Pather                                                      #
# Date:     06/07/2022                                                         #
# Description:                                                                 #
#       In response to Bayport DevOps skills test, this script aims to fulfil  #
#           the development requirements specified.                            #
#                                                                              #
################################################################################


# Help                                                                         #
################################################################################
Help()
{
    # Display Help Message
    echo 
    echo "This script is designed to do the following in order..."
    echo 
    echo "1. Create a file called directories.list that contains the directory names only of the current directory."
    echo "2. Add a line at the beginning of the directories.list file that reads \"line one's line\"."
    echo "3. Output the first three lines of directories.list on the console."
    echo "4. Accept an integer parameter when executed and repeat the previous steps's output x amount of times based on the parameter provided at execution."
    echo
    echo "Syntax: listit.sh [x | -h | --help] "
    echo "constraints:"
    echo "x must be a positive integer"
    echo
}


# Main program                                                                 #
################################################################################

ls -d */ > directories.list
sed -i "1s/^/line one's line\n/" directories.list
head -3 directories.list

if [ $# -gt 1 ]; then
    if [[ $1 == '-h' ] | [$1 == '--help']]; then
        Help()
        exit 0
    fi
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        echo "Not a valid argument please use -h for more options." 
        exit 0
    fi
    i=$1
    until [$i -le 0]
    do
        sed -i "1s/^/line one's line\n/" directories.list
        ((i=i-1))
    done
fi 


# OpenShift / OKD
#################################################################################


Write the command used to login to a remote OpenShift cluster.
`oc login`
Write the command to add the "cluster-admin" cluster role to a user called "clark".
`oc adm groups add-users mygroup clark``oc adm policy add-cluster-role-to-group cluster-admin mygroup`
 
Write the command used to list all pods in the "smallville" project (namespace).
`oc get pods -n samllville`
Write the command to scale an application (deployment config) called "dailyplanet" to 2 pods.
`oc scale scale deployment -n dailyplanet  --replica=2 --all`
Write the command to gain remote shell access to a pod called "lex" in the "smallville" project (namespace).
`oc rsh lex -n smallville `
Write the command to export a secret called "loislane" in JSon format, the secret is in the "dailyplanet" project (namespace).
`oc get secret loislane -o json -n dailyplanet `
Add a file called "Krypton" (in YAML format) to this repo that contains the resource defintion for a Persistent Volume Claim with the following properties:
Points to a Persistent Volume called "zod".
Requests 5GB of storage.
```apiVersion: "v1"
kind: "PersistentVolumeClaim"
metadata:
  name: "Krypton"
spec:
  accessModes:
    - "ReadWriteOnce"
  resources:
    requests:
      storage: "5Gi"
  volumeName: "zod" ```
The volume can be mounted as read-write by more than one node.

# General 

How would you ensure any change made to this Dockerfile is source controlled, approved, tested and deployed. Explain which tools you will use as if this was going into a production environment.

Github and Github Actions 
