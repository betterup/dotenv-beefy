module MockFileSystemHelpers
  def mock_file_read(filename:, contents:)
    # Dotenv uses File.open(filename, "rb:bom|utf-8", &:read) to get the contents of a .env file
    allow(File).to receive(:open).with(/#{filename}/, anything) { contents }
  end
end
