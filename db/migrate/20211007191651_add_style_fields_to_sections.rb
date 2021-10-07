class AddStyleFieldsToSections < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :background_color, :string
    add_column :sections, :text_color, :string
  end
end
