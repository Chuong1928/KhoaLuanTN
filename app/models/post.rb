class Post < ApplicationRecord
    require 'nokogiri'
  
    belongs_to :user
    has_many :comments
    
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
    before_save :time_read_post

    def time_read_post
      doc = Nokogiri::HTML(self.body)
      words = doc.content.split(/\s+/).length
      count_word = (words/300.0).ceil
      self.readtime = count_word
    end
    
end
