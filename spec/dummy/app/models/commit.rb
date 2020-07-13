# frozen_string_literal: true

require_relative 'application_record'
require_relative '../../../../app/models/concerns/commit'

class Commit < ApplicationRecord
  include GitModels::Commit
end
