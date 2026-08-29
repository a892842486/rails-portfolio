class CreateLinks < ActiveRecord::Migration[8.1]
  def change
    create_table :links do |t|
      t.references :linkable, polymorphic: true
      t.string :label
      t.string :url
      t.integer :position

      t.timestamps
    end
  end
end
