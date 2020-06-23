# frozen_string_literal: true

module GitModels
  module Branch
    extend ActiveSupport::Concern

    included do
      fields do
        git_updated_at :datetime, null: false
        name :text, limit: 1024, null: false
        timestamps
      end

      validates :name, uniqueness: { scope: :repository, message: 'Branch names must be unique within each repository' }

      belongs_to :author, class_name: ::User, inverse_of: :branches, required: true
      belongs_to :repository, class_name: ::Repository, inverse_of: :branches, required: true

      scope :branches_not_updated_since, lambda { |checked_at_date| where('branches.updated_at < ?', checked_at_date) }

      scope :from_repository, lambda { |repository_name|
        joins(:repository).where('repositories.name = ?', repository_name)
      }

      scope :with_name, lambda { |name| where(name: name) }

      def to_s
        name
      end

      def =~(other)
        name =~ other
      end

      def <=>(other)
        name <=> other.name
      end
    end

    class_methods do
      def create_from_git_data!(branch_data)
        repository = ::Repository.create!(branch_data.repository_name)
        branch = where(repository: repository, name: branch_data.name).first_or_initialize
        branch.git_updated_at = branch_data.last_modified_date
        branch.updated_at = Time.current # force updated time
        u = ::User.create_from_git_data!(branch_data)
        branch.author = u
        branch.save!
        branch
      end
    end
  end
end
