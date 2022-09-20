class CombineItensInCar < ActiveRecord::Migration[7.0]
  # def change
  # end
  def up
    # replace multiple itensfor a sigle product in a cart with a sigle iten
    Cart.all.each do |cart|
      #count  the number of each product in the cart
      sums = cart.line_itens.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity>1
          #remove individual itens
          cart.line_itens.where(product_id: product_id).delete_all

          #replace with a single item
          iten = cart.line_itens.build(product_id: product_id)
          iten.quantity = quantity
          iten.save!
        end
      end
    end
  end

  def def down 
    # split itens with quantity>1 into multiple itens
    LineIten.where("quantiy>1").each do |line_iten|
      # add individual itens
      line_iten.quantity.times do
        LineIten.create(cart_id: line_iten.cart_id, product_id: line_iten.product_id, quantity: 1)
      end
      #remove original iten
      line_iten.destroy
    end
  end
end
