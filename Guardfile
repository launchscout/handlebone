# A sample Guardfile
# More info at http://github.com/guard/guard#readme
#
# Guard is a tool to respond to local filesystem events and take action. As such, it works better using native filesystem event libraries
#
# 1. Setup an RVM 1.9.2 environment to run guard
# 2. gem install guard-coffeescript growl rb-fsevent
# 3. run the 'guard' command; this fires up a server to monitor the coffescript as shown below
# 4. C-\ will force guard to recompile everything it knows about
# 5. Install the Gowl "Extras" growlnotify

guard 'coffeescript', :output => 'javascripts/compiled' do
  watch(%r{lib/assets/javascripts/.+\.coffee})
end

guard 'coffeescript', :output => 'spec/javascripts/compiled', :bare => true do
  watch(%r{spec/javascripts/.*_spec\.coffee})
end
