class AddColumnToTables < ActiveRecord::Migration
  def change
    add_column :tables, :table_desc, :string
  end
end
