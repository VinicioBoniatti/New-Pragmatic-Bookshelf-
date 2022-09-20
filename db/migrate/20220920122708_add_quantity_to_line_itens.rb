class AddQuantityToLineItens < ActiveRecord::Migration[7.0]
  def change
    add_column :line_itens, :quantity, :integer, default: 1
  end
end
