#!/usr/bin/node

const Messer = require("messer/src/messer");
const config = require("/root/.messer/tmp/config.json");

const messer = new Messer();

messer.messen
  .login()
  .then(() => messer.processCommand(`history "Elitarny numerek" 1`))
  .then(res => {
    const lucky = res.substr(31, 2);
    luckyOne = config[parseInt(lucky)];
    return luckyOne;
  })
  .then(luckyOne => {
    messer.messen.api.getUserID(luckyOne, (err, data) => {
      let message = {
        body: `Dzisiaj szczęśliwy numerek ma @${luckyOne}`
      };
      if (err) {
        messer.messen.api.sendMessage(message, config.group);
        return console.error(err);
      }
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
    });
  });
