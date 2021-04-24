class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    extend FriendlyId
    friendly_id :permalink, use: :slugged
    
    # def should_generate_new_friendly_id?
    #   permalink_changed? || super
    # end

end