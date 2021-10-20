# Dotenv::Beefy

> Load settings for your application split into separate dotenv files

Similar to dotenv-rails, but better ;)

## Features
Automatically loads dotfiles for environment configuration with the following precedence (higher files' values are NOT overwritten by files loaded after).

* `.env.RAILS_ENV.local` - Local customizations for a given Rails environment (usually not committed to your git repo)
* `.env.HOST_FAMILY.local` - Local OS settings for a given OS (usually not committed to your git repo)
* `.env.local` - local customizations. NOT loaded when `Rails.env.test?` is true (a [dotenv-rails default](https://github.com/bkeepers/dotenv/blob/master/lib/dotenv/rails.rb#L69))
* `.env.RAILS_ENV` - Rails environment settings (ex: development, test, production, etc)
* `.env.HOST_FAMILY` - OS settings (ex: darwin, nix, cygwin)
* `.env` - Global defaults

The files listed first will have the final say on what the final values of each ENV variable is set to, so only set the value in `*.local` files if you really want to override it.

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
