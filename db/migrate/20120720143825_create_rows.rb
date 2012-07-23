class CreateRows < ActiveRecord::Migration
  def self.up
    create_table :rows do |t|
      t.integer :table_id
      t.integer :column_id
      t.string :row_data

      t.timestamps
    end
  end

  def self.down
  	drop_table :rows
  end
end
