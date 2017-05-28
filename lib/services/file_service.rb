# frozen_string_literal: true

class FileService
  def save(library, path)
    File.open(path, 'w') do |file|
      Marshal.dump(library.to_h, file)
    end
  end

  def load(path)
    File.open(path, 'r') do |file|
      Library.new(Marshal.load(file))
    end
  rescue
    Library.new
  end
end
