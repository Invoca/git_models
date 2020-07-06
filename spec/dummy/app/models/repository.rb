# frozen_string_literal: true

class Repository < ApplicationRecord
  include GitModels::Repository
end
