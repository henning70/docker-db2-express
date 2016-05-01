# Running DB2 Express-C in a docker container

## Introduction
These instructions are not intended to show you how to create a DB2 container, but instead instructions for running a DB2 instance with a database in a docker container with pre-installed DB2 Express-C 10.5 Fix Pack 7. 

### Dockerfile.sample
The sample can be used as is to create a sample container without having to modify the Dockerfile. Just copy *Dockerfile.sample* to *Dockerfile* and run docker build. Before doing so, look at the instructions below as a few steps are required to have a running docker container.

### Dockerfile.template
The template contains a number of tags that has to be replaced before you can run docker build. I provided a script to assist with this. The tags that need to be replaced are:
* CONTAINER_LIC   - DB2 license file
* CONTAINER_DB    - DB2 database name for the container
* CONTAINER_PORT  - DB2 instance port for the container
* CONTAINER_PS    - DB2 database pagesize *(4K, 8K, 16K or 32K)*

### build_dockerfile.sh
This script will build a *Dockerfile* from *Dockerfile.template* based on the arguments you provide to the script. If no arguments are passed to the script, it will print a usage statement with an example.
```sh
$ ./build_dockerfile.sh 
usage: ./build_dockerfile.sh [-d database_name] [-p port] [-s pagesize] [-l license_file]

 - pagesize is one of: 4K, 8K, 16K or 32K
 - license_file must be specified without .lic

 example: ./build_dockerfile.sh -d sample -p 50000 -s 8K -l db2expc_uw
```
Ensure you made the script executable before running it.
```sh
$ chmod 755 build_dockerfile.sh
```

## Instructions
Comming soon...
