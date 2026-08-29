class CreateProjectSkills < ActiveRecord::Migration[8.1]
  def change
    create_table :project_skills do |t|
      t.references :project
      t.references :skill
      t.integer :position

      t.timestamps
    end

    add_index :project_skills, [:project_id, :skill_id], unique: true
  end
end
