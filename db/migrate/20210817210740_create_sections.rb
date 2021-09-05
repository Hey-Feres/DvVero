class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :title
      t.text :content
      t.integer :sort_position, default: 1
      t.integer :title_alignment, default: 0
      t.integer :content_alignment, default: 0
      t.string :background_color
      t.string :title_color
      t.string :content_color
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
