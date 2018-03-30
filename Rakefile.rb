require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'


############# ALL ############# 

desc "Run checkout spec tests"
RSpec::Core::RakeTask.new('checkout') do |t|
  t.rspec_opts = ["--format documentation","--color"]
  t.pattern = ['spec/checkout_spec.rb']
end 