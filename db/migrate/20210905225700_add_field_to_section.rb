class AddFieldToSection < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :background_filter_color, :string
  end
end
