#!/usr/bin/env rake
# frozen_string_literal: true

require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'coveralls/rake/task'
require 'bundler/audit/task'

RuboCop::RakeTask.new
Coveralls::RakeTask.new
Bundler::Audit::Task.new

task default: :spec
