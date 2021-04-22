class Category < ApplicationRecord
    has_many :post_categories, foreign_key: :category_id
    has_many :posts, through: :post_categories

    
    validates :name, presence: true
    
    default_scope { order(position: :asc) }
    
    has_attached_file :avatar, styles: { medium: "100x100>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
