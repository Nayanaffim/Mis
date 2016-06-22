class CreateSalesBds < ActiveRecord::Migration
  def change
    create_table :sales_bds do |t|
      t.references :user, index: true, foreign_key: true
      t.string :sales_id
      t.string :skype_id

      t.timestamps null: false
    end
  end
end
