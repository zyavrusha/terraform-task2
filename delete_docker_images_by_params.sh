#!/bin/bash
# Start tag
start=7
# End tag
end=9
# Image name
image_name="image_name"

for i in $(seq $start $end); do
  docker rmi "${image_name}:${i}"
done