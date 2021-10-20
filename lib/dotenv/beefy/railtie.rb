require 'dotenv'
require 'rbconfig'

module Dotenv
  module Beefy
    class Railtie < Rails::Railtie
      config.before_configuration { load_environments }

      # Load environment dotfiles in the following order (e.g. if in "test" environment on "darwin")
      # 1. .env
      # 2. .env.local
      # 3. .env.test
      # 4. .env.darwin
      # 5. .env.test.local
      # 6. .env.darwin.local
      # 
      # The order matters, because files loaded later will override values set previously.
      # .env.local will override any similar keys/values found in .env
      # .env.test.local will override any similar values found in .env.test, and .env, etc.
      def load_environments
        files = []
        
        files << '.env'
        files << '.env.local'

        environments.each do |env| 
          files << ".env.#{env}"
        end

        environments.each do |env| 
          files << ".env.#{env}.local"
        end
        
        Dotenv.overload(*files)
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
