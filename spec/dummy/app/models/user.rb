# frozen_string_literal: true

require_relative 'application_record'
require_relative '../../../../app/models/concerns/user'

class User < ApplicationRecord
  include GitModels::User
end
