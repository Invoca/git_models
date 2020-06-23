# frozen_string_literal: true

class Commit < ActiveRecord::Base
  include GitModels::Commit
end
