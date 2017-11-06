require 'rake/testtask'
require 'find'

# desc 'Run tests'
# Rake::TestTask.new(:test) do |t|
#   t.libs << 'lib'
#   t.libs << 'test'
#   t.test_files = FileList['spec/**/*_spec.rb']
# end

# desc 'Run tests'
# task :default => :test

desc 'Display inventory of all files'
task :inventory do
  Find.find('.') do |name|
    next if name.include?('/.') # Excludes files and directories with . names
    puts name if File.file?(name)
  end
end

desc 'Run rubocop'
task :rub do
  sh 'rubocop'
end
