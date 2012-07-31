require 'zlib'
require 'archive/tar/minitar'
require 'stringio'

module Wally
  class TarGzUtil
    class << self
      def pack(files)
        stream = StringIO.new
        begin
          tgz = Zlib::GzipWriter.new(stream)
          tar = Archive::Tar::Minitar::Output.new(tgz)
          files.each do |entry|
            Archive::Tar::Minitar.pack_file(entry, tar)
          end
        ensure
          tar.close if tar # Closes both tar and tgz.
        end
        stream.string
      end
    end
  end
end
