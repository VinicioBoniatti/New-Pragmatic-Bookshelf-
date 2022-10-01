class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      # t.string :text
      t.string :email
      t.integer :pay_type

      t.timestamps
    end
  end
end
