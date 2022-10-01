class AddOrderToLineIten < ActiveRecord::Migration[7.0]
  def change
    add_reference :line_itens, :order, foreign_key: true
  end
end
