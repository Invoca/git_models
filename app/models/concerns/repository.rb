# frozen_string_literal: true

require 'declare_schema'

module GitModels
  module Repository
    extend ActiveSupport::Concern

    included do
      fields do
        name :text, limit: 1024, null: false
        timestamps
      end

      validates :name, uniqueness: true

      has_many :branches, class_name: 'Branch', dependent: :destroy
    end

    class_methods do
      def create!(name)
        branch = where(name: name).first_or_initialize
        branch.save!
        branch
      end
    end
  end
end
