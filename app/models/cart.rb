class Cart < ApplicationRecord
    has_many :line_itens, dependent: :destroy
    
    def add_product(product)
        current_iten = line_itens.find_by(product_id: product.id)
        if current_iten
            current_iten.quantity += 1
        else
            current_iten = line_itens.build(product_id: product.id)
        end
        current_iten
    end

    def total_price
        line_itens.to_a.sum {|iten| iten.total_price}
    end
end



