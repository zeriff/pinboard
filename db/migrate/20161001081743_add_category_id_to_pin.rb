class AddCategoryIdToPin < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :category_id, :integer
  end
end
