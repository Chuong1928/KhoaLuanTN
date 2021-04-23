class Post < ApplicationRecord
    
    belongs_to :user
    
    has_many :post_categories, foreign_key: :post_id
    has_many :categories, through: :post_categories
    accepts_nested_attributes_for :post_categories

    validates :title, :body, presence: true
    scope :visible, -> {where visible: true} 

    extend FriendlyId
    friendly_id :permalink, use: :slugged

    def should_generate_new_friendly_id?
      permalink_changed? || super
    end
    #   acts_as_url :title, url_attribute: :slug, sync: true

    #   def to_param
    #     "#{id}-#{slug}"
    #   end

    
end
