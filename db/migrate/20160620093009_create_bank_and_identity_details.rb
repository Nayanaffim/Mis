class CreateBankAndIdentityDetails < ActiveRecord::Migration
  def change
    create_table :bank_and_identity_details do |t|
      t.references :user, index: true, foreign_key: true
      t.bigint :account_no
      t.string :bank_name
      t.string :branch_name
      t.string :city
      t.string :ifsc_code
      t.string :pancard_no
      t.string :passport_no
      t.string :uid_no

      t.timestamps null: false
    end
  end
end
