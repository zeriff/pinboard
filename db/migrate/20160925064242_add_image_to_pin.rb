class AddImageToPin < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :image, :string
  end
end
