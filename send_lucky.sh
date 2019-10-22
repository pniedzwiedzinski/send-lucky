#!/bin/bash

lucky=`python3 get_lucky/get_lucky.py | bash | python3 get_lucky/parse_response.py`

echo $lucky