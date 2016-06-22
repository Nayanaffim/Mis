class CreateAcademicDetails < ActiveRecord::Migration
  def change
    create_table :academic_details do |t|
      t.references :user, index: true, foreign_key: true
      t.string :course
      t.string :university
      t.date :passing_year
      t.float :percentage
      t.string :stream

      t.timestamps null: false
    end
  end
end
