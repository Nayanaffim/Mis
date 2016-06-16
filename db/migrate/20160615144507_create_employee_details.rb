class CreateEmployeeDetails < ActiveRecord::Migration
  def change
    create_table :employee_details do |t|
    	 t.integer :user_id 
      t.integer  :emp_id
      t.string   :user_name
      t.string   :first_name
      t.string   :last_name
      t.date     :dob
      t.date     :date_of_join
      t.string   :blood_group
      t.string   :prevoius_company
      t.string   :designation
      t.string   :official_email_id 
      t.string   :mobile
      t.bigint   :landline
      t.text     :current_address
      t.text     :permanent_address
      t.string   :skype_id
      t.string   :personal_email_id
      t.string   :guardian_full_name
      t.bigint   :guardian_mobile
      t.bigint   :guardian_landline
      t.text     :guardian_address

      t.timestamps null: false
    end
  end
end
