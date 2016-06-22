class CreatePreCompanyDetails < ActiveRecord::Migration
  def change
    create_table :pre_company_details do |t|
      t.references :user, index: true, foreign_key: true
      t.string :company_name
      t.string :employee_id
      t.string :location
      t.string :designation
      t.float  :last_CTC
      t.text   :Resignation_reason
      t.date   :from
      t.date   :to

      t.timestamps null: false
    end
  end
end
