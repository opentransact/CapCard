class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.string :number,:limit=>8
      t.string :name
      t.string :key,:limit=>32
      t.string :pin, :limit=>4
      t.date :expiry

      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
