# frozen_string_literal: true

require_relative 'application_record'
require_relative '../../../../app/models/concerns/branch'

class Branch < ApplicationRecord
  include GitModels::Branch
end
