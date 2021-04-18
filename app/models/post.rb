class Post < ApplicationRecord
    belongs_to :user
    validates :title, :body, presence: true
    scope :visible, -> {where visible: true} 

    extend FriendlyId
    friendly_id :title, use: :slugged

    def should_generate_new_friendly_id?
        title_changed? || super
      end
    #   acts_as_url :title, url_attribute: :slug, sync: true

    #   def to_param
    #     "#{id}-#{slug}"
    #   end
    
end
