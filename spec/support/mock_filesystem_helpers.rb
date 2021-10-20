module MockFileSystemHelpers
  def initialize_mock_file_reads
    # Mock the most general case as a catch-all
    allow(File).to receive(:open).and_call_original
  end

  def mock_file_read(filename:, contents:)
    # Dotenv uses File.open(filename, "rb:bom|utf-8", &:read) to get the contents of a .env file
    # Mock the given filename so rspec can match on the specific case
    escaped_filename = Regexp.escape(filename)
    allow(File).to receive(:open).with(/#{escaped_filename}$/, anything) { contents }
  end
end
