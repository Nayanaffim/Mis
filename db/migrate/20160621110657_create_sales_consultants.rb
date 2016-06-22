class CreateSalesConsultants < ActiveRecord::Migration
  def change
    create_table :sales_consultants do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.float :comission
      t.bigint :contact
      t.string :skype_id
      t.string :email_id
      t.string :location
      t.string :address
      t.bigint :bank_account_no
      t.string :bank_name
      t.string :ifsc_code

      t.timestamps null: false
    end
  end
end
