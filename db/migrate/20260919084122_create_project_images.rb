class CreateProjectImages < ActiveRecord::Migration[8.1]
  def change
    create_table :project_images do |t|
      t.references :project, null: false, foreign_key: true
      t.string :caption
      t.integer :position

      t.timestamps
    end
  end
end
