atom_feed do |feed|
    feed.title "Who bought #{@product.title}"

    feed.update @latest_order.try(:updated_at)

    @product.orders.each do |order|
        feed.entry(order) do |entry|
            entry.title "Order #{order.id}"
            entry.summary type 'xhtml' do |xhtml|
                xhtml.p "Shipped to #{order.address}"

                xhtm.table do 
                    xhtml.tr do
                        xhtml.th "Product"
                        xhtml.th "Quantity"
                        xhtml.th "Total price"
                    end
                    order.line_itens.each do |iten|
                        xhtml.tr do
                            xhtml.th item.product.title
                            xhtml.td item.quantity
                            xhtml.td number_to_currency iten.total_price
                        end
                    end
                    xhtml.tr do
                        xhtml.th 'total', colspan: 2
                        xhtml.th number_to_currency\ order.line_itens.map(&:total_price).sum
                    end
                end

                xhtml.p "Paid by #{order.pay_type}"
            end
            entry.author do |author|
                author.name order.name
                author.email order.email
            end
        end
    end
end