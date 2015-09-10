# Dotenv::Beefy

> Load settings for your application split into separate dotenv files

Similar to dotenv-rails, but better ;)

## Features
Automatically loads dotfiles for environment configuration with the following
precedence (highest precedence first):
* .env.local - local customizations
* .env.RAILS_ENV - Rails environment settings (ex: development, test, production, etc)
* .env.HOST_FAMILY - OS settings (ex: darwin, nix, cygwin)
* .env - Global defaults

## Installation

```bash
$ gem install dotenv-beefy
```

## Usage

Add this line to your application's Gemfile:
```ruby
gem 'dotenv-beefy'
```

Done!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/betterup/dotenv-beefy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
