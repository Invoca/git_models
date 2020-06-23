# frozen_string_literal: true

require 'spec_helper'

describe 'Commit' do
  before do
    @git_commit = Git::GitCommit.new(
      '6d8cc7db8021d3dbf90a4ebd378d2ecb97c2bc25',
      'test message',
      Time.current,
      'author name',
      'author@email.com'
    )
  end

  it 'can create be constructed from a git commit' do
    commit = Commit.create_from_git_commit!(@git_commit)
    expect(commit.sha).to eq('6d8cc7db8021d3dbf90a4ebd378d2ecb97c2bc25')
    expect(commit.message).not_to be_nil
    expect(commit.author.name).not_to be_nil
    expect(commit.author.email).not_to be_nil
    expect(commit.created_at).not_to be_nil
    expect(commit.updated_at).not_to be_nil
  end

  it 'does not create duplicate database records' do
    Commit.create_from_git_commit!(@git_commit)
    expect(Commit.all.count).to eq(1)

    Commit.create_from_git_commit!(@git_commit)
    expect(Commit.all.count).to eq(1)
  end

  it 'rejects shas that are all zeros' do
    git_commit = Git::GitCommit.new(
      '0' * 40,
      'test message',
      Time.current,
      'author name',
      'author@email.com'
    )

    expect { Commit.create_from_git_commit!(git_commit) }.to \
      raise_exception(ActiveRecord::RecordInvalid)
  end

  context 'with an existing commit' do
    before do
      @commit = Commit.create_from_git_commit!(@git_commit)
    end

    it 'prints its sha when stringified' do
      expect(@commit.to_s).to eq('6d8cc7db8021d3dbf90a4ebd378d2ecb97c2bc25')
    end

    it 'has a short sha' do
      expect(@commit.short_sha).to eq('6d8cc7d')
    end
  end
end
