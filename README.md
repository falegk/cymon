# Cymon
[![Gem Version](https://badge.fury.io/rb/cymon.svg)](https://badge.fury.io/rb/cymon)
[![Build Status](https://travis-ci.org/falegk/cymon.svg?branch=master)](https://travis-ci.org/falegk/cymon)

A Ruby client gem for [Cymon.io](https://cymon.io) API

| Branch | Cymon API |
| ------ | ------ |
| _Master_ | v2 |

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cymon'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cymon

## Usage

```
# Init a client
client = Cymon.client

# /search endpoint
# Seach By IP
resp = client.search.by_ip('209.90.88.140')
resp.status
    => 200
resp.body
    => {"total"=>14, "from"=>0, "size"=>10, "hits"=>[{...}, {...}]}

```

## Usage with authentication
```
# Init a client
client = Cymon.client(username: 'yourname', password: 'yourpass')
client.auth.login
or
client = Cymon.client
client.auth.login(username: 'yourname', password: 'yourpass')

or if you have an active JWT token

client = Cymon.client(token: 'jwtoken')

# /search endpoint
# Seach By IP (max limit size is 10 for unauthoenticated user, and 100 for authenticated users)
resp = client.search.by_ip('209.90.88.140', size: 20)
resp.status
    => 200
resp.body
    => {"total"=>14, "from"=>0, "size"=>20, "hits"=>[{...}, {...}]}

```


## Current Endpoints

| Command | Endpoint |
| ------ | ------ |
| client = Cymon.client | Init a client |
| **Auth** | http://docs.cymon.io/#header-authentication |
| client.auth.login | http://docs.cymon.io/#auth-login-post |
| **Search** | http://docs.cymon.io/#search |
| client.search.by_ip | http://docs.cymon.io/#search-search-by-ip-get |
| client.search.by_domain | http://docs.cymon.io/#search-search-by-domain-get |
| client.search.by_hostname | http://docs.cymon.io/#search-search-by-hostname-get |
| client.search.by_md5 | http://docs.cymon.io/#search-search-by-md5-get |
| client.search.by_sha1 | http://docs.cymon.io/#search-search-by-sha1-get |
| client.search.by_sha256 | http://docs.cymon.io/#search-search-by-sha256-get |
| client.search.by_term | http://docs.cymon.io/#search-search-by-term-get |
| **Feeds** | http://docs.cymon.io/#feeds |
| client.feed.all | http://docs.cymon.io/#feeds-list-get |
| client.feed.find | http://docs.cymon.io/#feeds-get-feed-get |


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.
You can also run `rake console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

[Report issues / feature requests](https://github.com/falegk/cymon/issues) and [pull requests](https://github.com/falegk/cymon/pulls) are welcome.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
