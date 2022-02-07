#!/usr/bin/env bash
# arg1: Image name to build
# arg2: Instance name to stop and remove

image_name=$([ -n "$1" ] && echo "$1" || echo "jupyter-ds-gdal")
instance_name=$([ -n "$2" ] && echo "$2" || echo "jupyter-ds-gdal")
image_tag=$([ -n "$3" ] && echo "$1" || echo "3.3.2")

if [ -n "$instance_name" ]; then
    if [ ! -z "$(docker ps -al | grep -E " $instance_name$")" ]; then
        docker stop $instance_name
        echo "Stopp instance $instance_name"
        docker rm $instance_name
        echo "Deleted instance $instance_name"
    else
        echo "The instance $instance_name did not exists"
    fi
fi
if [ -n "$image_name" ]; then
    # image_id=$(docker image ls | grep "$image_name" | awk '{print $3}')
    # if [ ! -z "$image_id" ]; then
    #     docker rmi -f $image_id
    #     echo "Deleting the image $image_name with id $image_id"
    # fi
    echo "Start bulding image $image_name:$image_tag"
    docker build -t luisjba/$image_name:$image_tag $image_tag/.
    echo "Finished build image luisjba/$image_name:$image_tag"
else
    echo "Missing the image name in the parameter 1"
fi