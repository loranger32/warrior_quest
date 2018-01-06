require 'rake/testtask'
require 'find'

desc 'Run tests'
task :test do
  path = File.expand_path('spec')
  sh "cd #{path}"
  sh 'rspec .'
end

desc 'Run tests'
task :default => :test

desc 'Display inventory of all files'
task :inventory do
  Find.find('.') do |name|
    next if name.include?('/.') # Excludes files and directories with . names
    puts name if File.file?(name)
  end
end

desc 'Run rubocop'
task :rub do
  path = File.expand_path('lib')
  sh "rubocop #{path}"
end
