# frozen_string_literal: true

class CreateUsersTable < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.text     :name, :limit => 255, :null => false
      t.text     :email, :limit => 255, :null => false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :users
  end
end
