# Cymon

A Ruby client gem for [Cymon.io](https://cymon.io) API

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

## Current Endpoints

| Plugin | README |
| ------ | ------ |
| **Search** | http://docs.cymon.io/#search |
| .by_ip | http://docs.cymon.io/#search-search-by-ip-get |
| .by_domain | http://docs.cymon.io/#search-search-by-domain-get |
| .by_hostname | http://docs.cymon.io/#search-search-by-hostname-get |
| .by_md5 | http://docs.cymon.io/#search-search-by-md5-get |
| .by_sha1 | http://docs.cymon.io/#search-search-by-sha1-get |
| .by_sha256 | http://docs.cymon.io/#search-search-by-sha256-get |
| .by_term | http://docs.cymon.io/#search-search-by-term-get |


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
