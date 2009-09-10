class AddOauthColumnsToCards < ActiveRecord::Migration
  def self.up
    add_column :cards, :token, :string
    add_column :cards, :secret, :string
  end

  def self.down
    remove_column :cards, :secret
    remove_column :cards, :token
  end
end
