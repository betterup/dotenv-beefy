require 'dotenv'
require 'rbconfig'

module Dotenv
  module Beefy
    class Railtie < Rails::Railtie
      config.before_configuration { load_environments }

      def load_environments
        files = environments.map { |env| ".env.#{env}" }
        files << '.env'
        Dotenv.load(*files)
      end

      def environments
        [
          'local',
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
