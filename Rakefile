require 'rubygems'
require 'rake'
require 'rake/rdoctask'
require 'rake/testtask'
require 'spec/rake/spectask'
require 'rake/gempackagetask'
require 'yaml'
namespace :rdoc do |ns|
  Rake::RDocTask.new(:doc) do |rd|
    rd.main = "README.rdoc"
    rd.rdoc_dir = 'doc'
    rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
    rd.options << "-t Agree2"
  end

  desc 'Publish RDoc to RubyForge.'
  task :publish_docs => [:doc] do
    config = YAML.load(File.read(File.expand_path("~/.rubyforge/user-config.yml")))
    host = "#{config["username"]}@rubyforge.org"

    remote_dir = "/var/www/gforge-projects/agree2"
    local_dir = 'doc'

    sh %{rsync -av --delete #{local_dir}/ #{host}:#{remote_dir}}
  end
  
end

namespace :spec do |ns|
  desc "Run all examples"
  Spec::Rake::SpecTask.new('spec') do |t|
    t.spec_files = FileList['spec/*.rb']
  end

  desc "Run rcov"
  Spec::Rake::SpecTask.new('rcov') do |t|
    t.spec_files = FileList['spec/*.rb']
    t.rcov = true
    t.rcov_opts = ['--exclude','gems,spec']
  end
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "agree2"
    gemspec.summary = "Ruby client library for Agree2"
    gemspec.description = "Ruby library for creating and managing agreements on Agree2"
    gemspec.email = "support@agree2.com"
    gemspec.homepage = "http://agree2.com"
    gemspec.authors = ["Pelle Braendgaard"]
    gemspec.add_dependency('oauth', '>= 0.3.5')
    gemspec.add_dependency("json", [">= 1.1.3"])
    gemspec.add_dependency("activesupport", [">= 2.0.2"])
    
    gemspec.rubyforge_project = 'agree2'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc "Clean up all dirt"
task :clean => [ "rdoc:clobber_doc", "gem:clobber_package" ] do
   %w(diff diff.txt email.txt ri *.gem *~ **/*~ *.rbc **/*.rbc coverage).each do |pattern|
    files = Dir[pattern]
    rm_rf files, :verbose => true unless files.empty?
  end
end

task :default=>["spec:spec"]
