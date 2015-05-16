# ClassyPlivo :phone:

[![Gem Version](https://badge.fury.io/rb/classy_plivo.svg)](http://badge.fury.io/rb/classy_plivo)
[![Build Status](https://travis-ci.org/fny/classy_plivo.svg?branch=master)](https://travis-ci.org/fny/classy_plivo)
[![Test Coverage](https://codeclimate.com/github/fny/classy_plivo/badges/coverage.svg)](https://codeclimate.com/github/fny/classy_plivo)
[![Code Climate](https://codeclimate.com/github/fny/classy_plivo/badges/gpa.svg)](https://codeclimate.com/github/fny/classy_plivo)
[![Dependency Status](https://gemnasium.com/fny/classy_plivo.svg)](https://gemnasium.com/fny/classy_plivo)

A classy and minimalistic wrapper for the [Plivo Ruby library](https://github.com/plivo/plivo-ruby).

## Overview

```ruby
# This matches Plivo::RestAPI signature
classy_api = ClassyPlivo::RestAPI.new('auth_id', 'auth_token')
classy_response = classy_api.get_account

# => ClassyPlivo::Response
classy_response.nonsense
# => NoMethodError
classy_response.error?
# => true for 4XX and 5XX errors
classy_response.http_status
# => Integer response code
classy_response.payload
# => Twilio payload hash: { api_id: '1', 'message' => 'success' }
classy_response.payload_key
# => Value of payload['payload_key'] or ClassyPlivo::Response:::NoPayloadKeyError
classy_response.has_payload_key?('whatever')
# => true if the payload provides the requested key
```

A lot of this behavior relies on overriding `#method_missing`. For more details, check out the tests in the `test` directory and the source code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'classy_plivo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install classy_plivo

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec rake test` to run the test suite.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/fny/classy_plivo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
