class RemoveColumnsFromSection < ActiveRecord::Migration[6.1]
  def change
    remove_column :sections, :background_color, :string
    remove_column :sections, :title_color, :string
    remove_column :sections, :content_color, :string
    remove_column :sections, :background_filter_color, :string
  end
end
