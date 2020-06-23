# frozen_string_literal: true

class Branch < ActiveRecord::Base
  include GitModels::Branch
end
