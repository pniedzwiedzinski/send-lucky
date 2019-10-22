#!/bin/bash

lucky=`python3 get_lucky/get_lucky.py | bash | python3 get_lucky/parse_response.py`

echo $lucky

docker run --name lucky --restart=on-failure -v ~/.messer/tmp:/root/.messer/tmp -e LUCKY="$lucky" pniedzwiedzinski/lucky

docker rm lucky