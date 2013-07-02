class CreateGuitars < ActiveRecord::Migration
  def up
    create_table :guitars do |t|
      t.string  :make
      t.string  :model
      t.integer :year
      t.string  :color
      t.timestamps
    end
  end

  def down
    drop_table :guitars
  end
end
