require 'spec_helper'

describe Dotenv::Beefy::Railtie do
  describe '#load_environments' do
    let(:instance) { described_class.instance }
    subject(:load_environments) { instance.load_environments }

    def mock_dotenv_file
      contents = <<-FILE
      FOO=bar
      BAZ=buzz
      ANSWER=42
      FILE
      mock_file_read(filename: '.env', contents: contents)
    end

    before do
      initialize_mock_file_reads
    end

    it 'loads .env' do
      mock_dotenv_file
      load_environments

      expect(ENV['FOO']).to eq('bar')
      expect(ENV['BAZ']).to eq('buzz')
      expect(ENV['ANSWER']).to eq('42')
    end

    it 'overrides .env values with .env.test values' do
      mock_dotenv_file

      contents = <<-FILE
      FOO=bizz
      BAZ=farf
      ANSWER=99
      FILE
      mock_file_read(filename: '.env.test', contents: contents)
      
      load_environments

      expect(ENV['FOO']).to eq('bizz')
      expect(ENV['BAZ']).to eq('farf')
      expect(ENV['ANSWER']).to eq('99')
    end


    it 'overrides .env values with more specific .env.test values'
    it 'loads values from .env, .env.test and .env.test.local files'
  end
end
