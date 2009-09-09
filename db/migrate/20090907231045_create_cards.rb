class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.string :number, :null => false,:limit=>8
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :key, :null => false, :limit=>32
      t.string :pin, :null => false, :limit=>4
      t.date :expiry, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
