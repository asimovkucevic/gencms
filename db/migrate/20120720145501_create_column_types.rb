class CreateColumnTypes < ActiveRecord::Migration
  def self.up
    create_table :column_types do |t|
      t.string :name
      t.string :description
      t.string :control_path
      
      t.timestamps
    end
  end

  def self.down
  	drop_table :column_types
  end
end
