# frozen_string_literal: true

require_relative 'application_record'
require_relative '../../../../app/models/concerns/repository'

class Repository < ApplicationRecord
  include GitModels::Repository
end
