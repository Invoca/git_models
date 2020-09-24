# frozen_string_literal: true

require 'declare_schema'

module GitModels
  module Commit
    extend ActiveSupport::Concern

    included do
      fields do
        sha :text, limit: 40, null: false
        message :text, limit: 1024, null: false
        timestamps
      end

      validates :sha, uniqueness: { message: 'SHAs must be globally unique' }
      validates :sha, format: { without: /[0]{40}/ }

      belongs_to :author, class_name: 'User', inverse_of: :commits, required: true

      def short_sha
        sha[0, 7]
      end

      def to_s
        sha
      end

      def <=>(other)
        sha <=> other.sha
      end
    end

    class_methods do
      def create_from_git_commit!(git_commit)
        commit = where(sha: git_commit.sha).first_or_initialize
        commit.message = git_commit.message.truncate(1024)
        commit.author = ::User.create_from_git_data!(git_commit)
        commit.save!
        commit
      end
    end
  end
end
