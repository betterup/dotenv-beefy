require 'spec_helper'

describe Dotenv::Beefy::Railtie do
  describe '#load_environments' do
    let(:instance) { described_class.instance }
    subject(:load_environments) { instance.load_environments }

    it 'loads .env' do
      contents = <<-FILE
      FOO=bar
      BAZ=buzz
      ANSWER=42
      FILE
      mock_file_read(filename: '.env', contents: contents)
      load_environments

      expect(ENV['FOO']).to eq('bar')
      expect(ENV['BAZ']).to eq('buzz')
      expect(ENV['ANSWER']).to eq('42')
    end

    it 'loads .env.test and .env'
    it 'overrides .env values with more specific .env.test values'
    it 'loads values from .env, .env.test and .env.test.local files'
  end
end
