#!/bin/bash

export NUM=$(messer --command='history "Elitarny numerek" 1' | grep "Dzisiejszy numerek to" | tail -c 4)

export NAME=$(echo $NUM | ./num_to_name.js)

messer --command="message \"Krzysiu na przewodniczącego\" Dzisiaj szczęśliwy numerek ma $NAME"