#!/usr/bin/node

const Messer = require("messer/src/messer");
const config = require("/root/.messer/tmp/config.json");

const messer = new Messer();

const log = console.log;

console.log = function() {
  log.apply(console, [Date(Date.now()).toString()].concat(arguments));
};

messer.messen
  .login()
  .then(() => messer.processCommand(`history "Elitarny numerek" 1`))
  .then(res => {
    const lucky = parseInt(res.substr(31, 2));
    console.log(`Lucky number: ${lucky}`);
    luckyOne = config[lucky];
    if (luckyOne === undefined) return lucky;
    console.log(`Lucky person: ${luckyOne}`);
    return luckyOne;
  })
  .then(luckyOne => {
    if (Number.isInteger(luckyOne)) {
      let message = {
        body: `Dzisiaj szczęśliwy numerek to ${luckyOne}`
      };
      messer.messen.api.sendMessage(message, config.group);
      return console.log("Message sent");
    }
    messer.messen.api.getUserID(luckyOne, (err, data) => {
      console.log("Sending message...");
      let message = {
        body: `Dzisiaj szczęśliwy numerek ma @${luckyOne}`
      };
      if (err) {
        console.log(`Could not get id of ${luckyOne}`);
        messer.messen.api.sendMessage(message, config.group);
      } else {
        const id = data[0].userID;
        messer.messen.api.sendMessage(
          {
            ...message,
            mentions: [
              {
                tag: `@${luckyOne}`,
                id: id
              }
            ]
          },
          config.group
        );
      }
      return console.log("Message sent");
    });
  });
