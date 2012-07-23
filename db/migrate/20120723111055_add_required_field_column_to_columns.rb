class AddRequiredFieldColumnToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :required_field, :boolean
  end
end
