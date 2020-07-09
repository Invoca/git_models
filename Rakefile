#!/usr/bin/env rake
# frozen_string_literal: true

require 'rspec/core/rake_task'
require 'coveralls/rake/task'
require 'bundler/audit/task'

RSpec::Core::RakeTask.new
Coveralls::RakeTask.new
Bundler::Audit::Task.new

desc "db"
namespace :db do
  desc "test"
  namespace :test do
    desc "prepare"
    task :prepare do
      system <<~EOS
        set -ex
        cd spec/dummy
        rake db:test:prepare
      EOS
    end
  end
end

task default: :spec
