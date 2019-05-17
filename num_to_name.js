#!/usr/local/bin/node
const names = require("/root/.messer/tmp/config.json");
const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("", number => {
  console.log(names[parseInt(number)]);

  rl.close();
});
