class MakeItemCategoryNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :category, :string, :null => true
  end
end
