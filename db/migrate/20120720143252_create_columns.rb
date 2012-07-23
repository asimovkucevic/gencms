class CreateColumns < ActiveRecord::Migration
  def self.up
    create_table :columns do |t|
      t.integer :table_id
      t.string :column_name
      t.integer :column_type_id

      t.timestamps
    end
  end

  def self.down
  	drop_table :columns
  end
end
