# Lucky

[![](https://images.microbadger.com/badges/image/pniedzwiedzinski/lucky.svg)](https://microbadger.com/images/pniedzwiedzinski/lucky "Get your own image badge on microbadger.com")
![Made for ZSK](http://zsk.poznan.pl/templates/zsk2013/images/logo.png "ZSK Logo")

Jaki dzisiaj szczęśliwy numerek? Wiesz to na pewno od "Elitarnego numerka".
Ten skrypt personalizuje wiadomość podstawiając imię szczęśliwca i wysyła
wiadomość do grupy klasowej.

## Setup

If you're using ARM-like architecture (like RaspberryPi) you need to use `pniedzwiedzinski/lucky:rpi` or build image yourself. To do that clone repo and run `docker build . -t pniedzwiedzinski/lucky`

```bash
docker pull pniedzwiedzinski/lucky

docker run --rm -it -v ~/.messer:/root/.messer/tmp pniedzwiedzinski/lucky messer
# Fill the form with your facebook credentials
```

Create `~/.messer/config.json` and paste there your configuration:

```json
{
  "group": "Your group id (from url)",
  "1": "John Snow",
  "2": "Perry the Platypus",
  "3": "Elon MusK"
}
```

Finally create container

```bash
docker run --name lucky_number --restart=on-failure -v ~/.messer:/root/.messer/tmp pniedzwiedzinski/lucky send_lucky_number.js
```

## Usage

```bash
docker start lucky_number
```

Add this to crontab to run everyday (my configuration: `5 7 * * Mon-Fri docker start lucky_number`)
