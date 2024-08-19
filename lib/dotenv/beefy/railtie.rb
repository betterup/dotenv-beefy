require 'dotenv'
require 'rbconfig'

module Dotenv
  module Beefy
    class Railtie < ::Rails::Railtie
      config.before_configuration { load_environments }

      # Load environment dotfiles in the following order (e.g. if in "test" environment on "darwin")
      # 1. .env.test.local
      # 2. .env.darwin.local
      # 3. .env.local
      # 4. .env.test
      # 5. .env.darwin
      # 6. .env
      #
      # The order matters, because the files loaded first will "lock in" the value for that ENV var.
      # Dotenv.load memoizes each ENV value, and if the value is set, it cannot be updated later.
      # If you want to update ENV values as new values come in, you need to use Dotenv.overload(*files)
      def load_environments
        files = []

        environments.each do |env|
          files << ".env.#{env}.local"
        end

        # This is a dotenv-rails convention to ignore `.env.local` in a test environment
        # @see https://github.com/bkeepers/dotenv/blob/c237d6d6291c898d8affb290b510c7aac49aed71/lib/dotenv/rails.rb#L66-L73
        files << '.env.local' unless Rails.env.test?

        environments.each do |env|
          files << ".env.#{env}"
        end

        files << '.env'

        Dotenv.load(*files)
      end

      def environments
        [
          Rails.env,
          host_family
        ]
      end

      def host_family
        case ::RbConfig::CONFIG['host_os']
         when /(darwin|mac os)/i
           'darwin'
         when /(linux|bsd|aix|solaris)/i
           'nix'
         when /cygwin/i
           'cygwin'
         end
      end
    end
  end
end
