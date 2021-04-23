class Category < ApplicationRecord
    has_many :post_categories, foreign_key: :category_id
    has_many :posts, through: :post_categories

    
    validates :name, presence: true
    
    default_scope { order(position: :asc) }
    
    has_attached_file :avatar, styles: { medium: "300x150#" }
    
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


    def default_avatar
        avatar.url(:medium)
    end

end


