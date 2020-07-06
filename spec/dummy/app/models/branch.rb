# frozen_string_literal: true

class Branch < ApplicationRecord
  include GitModels::Branch
end
