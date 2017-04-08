[![Gem Version](https://badge.fury.io/rb/loba-commands.svg)](https://badge.fury.io/rb/loba-commands)
[![Dependency Status](https://gemnasium.com/rdnewman/loba-commandds.svg)](https://gemnasium.com/rdnewman/loba-commands)
[![Build Status](https://travis-ci.org/rdnewman/loba-commands.svg?branch=master)](https://travis-ci.org/rdnewman/loba-commands)
[![Code Climate](https://codeclimate.com/github/rdnewman/loba-commands/badges/gpa.svg)](https://codeclimate.com/github/rdnewman/loba-command)
[![Test Coverage](https://codeclimate.com/github/rdnewman/loba-commands/badges/coverage.svg)](https://codeclimate.com/github/rdnewman/loba-commands/coverage)
[![Inline docs](http://inch-ci.org/github/rdnewman/loba-commands.svg?branch=master)](http://inch-ci.org/github/rdnewman/loba-commands)
[![security](https://hakiri.io/github/rdnewman/loba-commands/master.svg)](https://hakiri.io/github/rdnewman/loba-commands/master)

# Loba Commands

Extends [Loba](https://rubygems.org/gems/loba) to add command-line tools to help manage [Loba](https://rubygems.org/gems/loba) statements in Ruby code.

# WORK IN PROGRESS - UNDER CONSTRUCTION

## Overview

There are two kinds of questions I usually want to answer when trying to diagnose code behavior:


## Usage

My a.

#### Timestamp notices:  `Loba.ts`

Outputs a timestamped notice, useful for quick traces to see the code path and easier than, say, You can read [more detail](readme/ts.md) on this command.

#### Variable or method return inspection:  `Loba.val`

Inserts line to Rails.logger.debug (or to STDOUT if Rails.logger not available) showing value with method and class identification

```ruby
Loba.val :var_sym   # the :var_sym argument is the variable or method name given as a symbol
```


## Installation

Add this line to your application's Gemfile:

```ruby
group :development, :test do
  gem 'loba-commands', require: false
end
```

or for all environments:

```ruby
gem 'loba-commands', require: false
```


And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install loba-commands
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Changelog
|version|notes|
|-------|-----|
|0.1.0|initial development|

### Semantic versions

As of version 0.3.0 and later, this gem follows semantic versioning [2.0.0](http://semver.org/spec/v2.0.0.html) conventions.

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/rdnewman/loba-commands>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
