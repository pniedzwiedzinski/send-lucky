# Lucky

![Made for ZSK](http://zsk.poznan.pl/templates/zsk2013/images/logo.png "ZSK Logo")

Jaki dzisiaj szczęśliwy numerek? Wiesz to na pewno od "Elitarnego numerka".
Ten skrypt personalizuje wiadomość podstawiając imię szczęśliwca i wysyła
wiadomość do grupy klasowej.

## Setup

```
docker pull pniedzwiedzinski/lucky

docker run --rm -it -v ~/.messer:/root/.messer/tmp lucky messer
# Fill the form with your facebook credentials

docker run --name lucky_number -v ~/.messer:/root/.messer/tmp lucky send_lucky_number.sh
```

## Usage

```
docker start lucky_number
```

Add this to crontab to run everyday (my configuration: `5 7 * * Mon-Fri docker start lucky_number`)
