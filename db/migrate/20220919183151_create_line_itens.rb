class CreateLineItens < ActiveRecord::Migration[7.0]
  def change
    create_table :line_itens do |t|
      t.references :product, null: false, foreign_key: true
      t.belongs_to :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
