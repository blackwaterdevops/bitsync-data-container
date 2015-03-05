# Docker Synced Data Container

Dockerfile to build a data container which can be used on multiple hosts
to keep data in sync using BitTorrent Sync 2.0

## Usage

First get hold of a new BitTorrent Sync key - this can be found by generating one
in the gui, or via the --generate-secret option of the cli client

It will look similar this AJOEYKPPY2WUGBCOYB5UZRWOLI7IUNHFP

Replace the string GENERATE_A_NEW_SECRET with this secret in the sync-config.json file

On your docker host run:

docker build -t your_image_name .
docker run -rm --name your_container_name your_image_name /btsync --config /config.json --nodaemon

You can now confirm your container is running with

docker ps | grep your_container_name

## CoreOS

A fleet service template (which will need your image name adding)
has been included which can be used to create instances i.e.

cp synced-data@.service synced-data@1.service

And added and launched to fleet via

fleetctl load synced-data@1.service
fleetctl start synced-data@1.service
