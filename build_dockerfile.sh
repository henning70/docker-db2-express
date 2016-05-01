#!/bin/bash
#
# Author: Henning van Wyk <henning@hjitconsulting.com>
# Date: 30 Apr 2016
# Version: 0.1
#
# License: https://github.com/henning70/docker-db2-express.git
#

# show usage if incorrect number of command line arguments passed to script
if [ $# -lt 8 ]
then
	echo -e \
	"usage: $0 [-d database_name] [-p port] [-s pagesize] [-l license_file]\n\n" \
	"- pagesize is one of: 4096, 8192, 16384 or 32768\n" \
	"- license_file must be specified without .lic\n\n" \
	"example: $0 -d sample -p 50000 -s 8192 -l db2expc_uw\n"
	exit 1
fi

# loop over the given command line arguments and map them to their appropriate variable names
while [ $# -gt 0 ]
do
	case "$1" in
		-d) database="${2^^}"; shift;;
		-p) port="$2"; shift;;
		-s) pagesize="$2"; shift;;
		-l) license="$2"; shift;;
		-?) echo -e \
				"usage: $0 [-d database_name] [-p port] [-s pagesize] [-l license_file]\n\n" \
				"- pagesize is one of: 4096, 8192, 16384 or 32768\n" \
				"- license_file must be specified without .lic\n\n" \
				"example: $0 -d sample -p 50000 -s 8192 -l db2expc_uw\n"
				exit 1;;
		*) break;;
	esac
	shift
done

# display the given arguments
echo -e "* The following will be used to generate the Dockerfile for docker build"
echo -e "  Database: $database"
echo -e "  Port: $port"
echo -e "  Pagesize: $pagesize"
echo -e "  License: $license"

echo -e "* Copy Dockerfile.template to Dockerfile"
cp Dockerfile.template Dockerfile

echo -e "* Modifying Dockerfile with given arguments"
sed -i.bak "s/CONTAINER_DB/$database/g" Dockerfile
sed -i.bak "s/CONTAINER_PORT/$port/g" Dockerfile
sed -i.bak "s/CONTAINER_PS/$pagesize/g" Dockerfile
sed -i.bak "s/CONTAINER_LIC/$license/g" Dockerfile

echo -e "* Done\n"

echo -e "You can now run docker build. See the README on GitHub for more details:"
echo -e "https://github.com/henning70/docker-db2-express.git"

exit 0
