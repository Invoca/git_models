class CreateCommitsRepositoriesBranches < ActiveRecord::Migration
  def self.up
    create_table :branches do |t|
      t.datetime :git_updated_at, :null => false
      t.text     :name, :limit => 1024, :null => false
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :author_id
      t.integer  :repository_id
    end
    add_index :branches, [:author_id]
    add_index :branches, [:repository_id]

    create_table :commits do |t|
      t.text     :sha, :limit => 40, :null => false
      t.text     :message, :limit => 1024, :null => false
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :author_id
    end
    add_index :commits, [:author_id]

    create_table :repositories do |t|
      t.text     :name, :limit => 1024, :null => false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :branches
    drop_table :commits
    drop_table :repositories
  end
end
