require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :environment do
  require 'dotenv'
  Dotenv.load

  $LOAD_PATH.unshift File.expand_path('lib', __dir__)
  require 'chmeetings'
end

desc 'Launch a pry shell with libraries loaded'
task pry: :environment do
  options = {}
  options[:logger] = Logger.new($stdout) unless ENV['CLIENT_LOGGER'].nil?
  @client = Chmeetings::Client.new(**options) if ENV['CHMEETINGS_API_KEY']

  require 'pry'
  Pry.start
end
