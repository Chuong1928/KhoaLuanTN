class Category < ApplicationRecord
    has_many :post_categories, foreign_key: :category_id
    has_many :posts, through: :post_categories

    
    validates :name, presence: true
    
    default_scope { order(position: :asc) }
end
