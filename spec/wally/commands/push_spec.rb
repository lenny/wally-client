require 'spec_helper'

require 'wally/commands'

module Wally
  module Commands
    describe Push do
      include ::FileIntegrationSupport
      
      let(:resource) { double('RestResource').as_null_object }
      let(:targz_util) { double('targz utility', :pack => 'data') }

      before { subject.stub(:resource => resource, :targz_util => targz_util) }

      subject { Push.new(nil, nil) }

      it 'POSTs tarred/gzipped bundle to /projects/:project_name/pushes' do
        in_tmp_dir do |dir|
          make_file('features/a.feature')

          subject.project = 'myproject'
          subject.dir = dir

          targz_util.should_receive(:pack).with(['features/a.feature']).and_return('tarzipdata')
          resource.should_receive(:post_tar_gz).with('projects/myproject/pushes', 'tarzipdata')

          subject.execute
        end
      end
      
      specify '*.feature, *.md, and *.markdown files are included' do
        in_tmp_dir do |dir|
          make_file('features/a.feature')
          make_file('features/foo/b.feature')
          make_file('something.else')
          make_file('readme.md')
          make_file('something.markdown')

          subject.dir = dir

          targz_util.should_receive(:pack) do |files|
            files.should include('features/a.feature', 'features/foo/b.feature', 'readme.md', 'something.markdown')
            files.should_not include('something.else')
          end
          
          subject.execute
        end
      end
      
      specify '.nav file in top level features directory is included' do
        in_tmp_dir do |dir|
          make_file('features/.nav')
    
          subject.dir = 'features'

          targz_util.should_receive(:pack) do |files|
            files.should include('.nav')
          end

          subject.execute
        end
      end
    end
  end
end