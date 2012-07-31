require 'tmpdir'
require 'fileutils'

# Mixing this into an example group provides #in_tmp_dir
# e.g.
# in_tmp_dir do |dir|
#    ...
# end
#
# Used in integration testing file based implementations such as archive expansion, etc..
module FileIntegrationSupport
  def in_tmp_dir(&blk)
    Dir.mktmpdir do |dir|
      FileUtils.cd(dir, &blk)
    end
  end
  
  def make_file(path)
    dir = File.dirname(path)
    FileUtils.mkdir_p(dir)
    FileUtils.touch(File.join(dir, File.basename(path)))
  end
end
