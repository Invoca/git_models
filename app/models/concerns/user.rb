module GitModels
  module User
    extend ActiveSupport::Concern

    included do
      fields do
        name :text, limit: 255, null: false
        email :text, limit: 255, null: false
        timestamps
      end

      validates :name, uniqueness: { scope: :email }

      has_many :branches, class_name: ::Branch, foreign_key: 'author_id'
      has_many :commits, class_name: ::Commit, foreign_key: 'author_id'
    end

    class_methods do
      def create_from_git_data!(branch_data)
        where(name: branch_data.author_name, email: branch_data.author_email).first_or_create!
      end

      def users_with_emails(email_filter_list)
        # if filter is empty, return all users, otherwise only return users whose emails are in the list
        all.select { |user| email_filter_list.empty? || email_filter_list.include?(user.email.downcase) }
      end
    end
  end
end
