class Product < ApplicationRecord
    has_many :line_itens

    before_destroy :ensure_not_referenced_by_any_line_iten

    validates :price, :title, :description, :image_url, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :title, uniqueness: true
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
    }

    private

        # ensure that there are no line items referencing this product
        def ensure_not_referenced_by_any_line_iten
            unless line_itens.empty?
                errors.add(:base, 'Line Itens present')
                throw :abort
            end
        end
end
