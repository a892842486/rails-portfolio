class CreateSkills < ActiveRecord::Migration[8.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :skills, :name, unique: true
  end
end
