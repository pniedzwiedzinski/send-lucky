#!/bin/bash

set -euo pipefail

export NUM=$(messer --command='history "Elitarny numerek" 1' | grep "Dzisiejszy numerek to" | tail -c 4)

export NAME=$(echo $NUM | num_to_name.js)
export GROUP=$(node -e "let config = require(\"/root/.messer/tmp/config.json\"); console.log(config[\"group\"])")

if [ $NAME != "" ]; then
    messer --command="message \"$GROUP\" Dzisiaj szczęśliwy numerek ma $NAME"
fi