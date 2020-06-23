# frozen_string_literal: true

require 'spec_helper'

describe 'User' do
  it 'can create be constructed from git data' do
    git_data = Git::GitBranch.new(
      'repository_name',
      'mypath/mybranch',
      DateTime.current,
      'Author Name',
      'author@email.com'
    )
    user = User.create_from_git_data!(git_data)

    expect(user.name).to eq('Author Name')
    expect(user.email).to eq('author@email.com')
    expect(user.created_at).not_to be_nil
    expect(user.updated_at).not_to be_nil
  end

  it 'can have multiple branches related to it' do
    GitModels::TestHelpers.create_branches(author_email: 'author@email.com')
    user = User.where(email: 'author@email.com').first
    expect(user.branches.size).to eq(2)
  end

  it 'can have multiple commits related to it' do
    GitModels::TestHelpers.create_commits(author_email: 'author@email.com')
    user = User.where(email: 'author@email.com').first
    expect(user.commits.size).to eq(2)
  end

  it 'will not allow duplicate name/email combinations' do
    user1 = User.create(name: 'Author Name', email: 'author@email.com')
    user1.save!
    user2 = User.create(name: 'Author Name', email: 'author@email.com')

    expect { user2.save! }.to raise_exception(ActiveRecord::RecordInvalid)
  end

  it 'requires name and email address' do
    expect { User.create(name: 'Author Name') }.to raise_exception(ActiveRecord::StatementInvalid)
    expect { User.create(email: 'author@email.com') }.to raise_exception(ActiveRecord::StatementInvalid)
  end

  context 'with two users' do
    before do
      @user1 = User.create(name: 'Author Name 1', email: 'email1@email.com')
      @user2 = User.create(name: 'Author Name 2', email: 'email2@email.com')
    end

    it 'can return list of users filtered by email address' do
      users = User.users_with_emails([])
      expect(users).to eq([@user1, @user2])

      users = User.users_with_emails([@user1.email])
      expect(users).to eq([@user1])

      users = User.users_with_emails(['notinlist@email.com'])
      expect(users).to eq([])
    end
  end
end
