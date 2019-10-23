#!/bin/bash

lucky=`docker run -it --rm -e VULCAN_LOGIN=$VULCAN_LOGIN -e VULCAN_PASSWORD=$VULCAN_PASSWORD get_lucky:latest | tail -n 1`

echo $lucky

docker run --name send_lucky -it -v ~/.messer/tmp:/root/.messer/tmp -e LUCKY="$lucky" pniedzwiedzinski/lucky

docker rm send_lucky
