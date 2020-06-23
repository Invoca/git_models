# frozen_string_literal: true

class Repository < ActiveRecord::Base
  include GitModels::Repository
end
