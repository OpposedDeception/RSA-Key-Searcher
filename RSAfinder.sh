#!/bin/bash

#Script to search for RSA certificates and keys in firmware image
#Input verification
if [ $# -ne 1 ]; then
echo "Usage: $0 firmware_image"
exit 1
fi

#Check if firmware image exists
if [ ! -f $1 ]; then
echo "Error: firmware image $1 not found"
exit 1
fi

#Search for RSA public and private certificates and keys
echo "Searching for RSA certificates and keys in $1..."

grep -oE '-----BEGIN RSA PRIVATE KEY-----[a-zA-Z0-9+/=\n]+-----END RSA PRIVATE KEY-----' $1 > private_keys.txt
grep -oE '-----BEGIN RSA PUBLIC KEY-----[a-zA-Z0-9+/=\n]+-----END RSA PUBLIC KEY-----' $1 > public_keys.txt

#Check if any keys were found
if [ ! -s private_keys.txt ]; then
echo "No RSA private keys found in $1"
fi

if [ ! -s public_keys.txt ]; then
echo "No RSA public keys found in $1"
fi

#Inform user of completed search and location of key files
echo "Search complete. RSA private keys are saved in private_keys.txt and RSA public keys are saved in public_keys.txt"

exit 0