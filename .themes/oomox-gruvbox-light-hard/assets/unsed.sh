#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#504945/g' \
         -e 's/rgb(100%,100%,100%)/#f9f5d7/g' \
    -e 's/rgb(50%,0%,0%)/#665c54/g' \
     -e 's/rgb(0%,50%,0%)/#d79921/g' \
 -e 's/rgb(0%,50.196078%,0%)/#d79921/g' \
     -e 's/rgb(50%,0%,50%)/#3c3836/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#3c3836/g' \
     -e 's/rgb(0%,0%,50%)/#ebdbb2/g' \
	"$@"