class Order < ApplicationRecord
has_many :line_itens, dependent: :destroy
  enum pay_type: {
    "Check" => 0,
    "Credit card" => 1,
    "Purchase order" => 2
  }
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys
  
  def add_line_itens_from_cart(cart)
    cart.line_itens.each do |iten|
      iten.cart_id = nil
      line_itens << iten
    end
  end
end
