class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles do |t|
      t.string :display_name
      t.string :job_title
      t.text :introduction
      t.string :contact_email

      t.timestamps
    end
  end
end
