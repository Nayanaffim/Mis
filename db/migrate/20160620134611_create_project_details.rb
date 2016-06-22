class CreateProjectDetails < ActiveRecord::Migration
  def change
    create_table :project_details do |t|
      t.references :user, index: true, foreign_key: true
      t.string :project_name
      t.string :description
      t.string  :duration
      t.date :project_start_date
      t.date :project_end_date
      t.string :project_type
      t.string :team_lead_name
      t.string :project_url
      t.string :your_role
      t.string :technology
      t.string :client_name
      t.string :company_name

      t.timestamps null: false
    end
  end
end
