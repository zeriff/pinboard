class AddPinUrlToPin < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :pin_url, :string
  end
end
