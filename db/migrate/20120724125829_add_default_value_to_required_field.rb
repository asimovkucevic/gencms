class AddDefaultValueToRequiredField < ActiveRecord::Migration
 def up
    add_column :columns, :required_field, :boolean, :default => false
  end

  def down
    remove_column :columns, :required_field, :boolean
  end
end
