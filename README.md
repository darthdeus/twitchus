# Twitchus [![Travis-CI](https://secure.travis-ci.org/darthdeus/twitchus.png)](http://travis-ci.org/#!/darthdeus/twitchus) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/darthdeus/twitchus)

Twitchus is a gem for managing a list of Twitch.tv streams.
You just give it a list of streams and it will check their status
and additional infromation and save all the data into Redis.

## Installation

    $ gem install twitchus

## Usage

Twitchus is designed to be run via cron on a regular basis. For that
it needs a config file which lists all the stream names.

Then simply run `twitchus -c config.yml`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
6. Be happy!
