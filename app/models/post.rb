class Post < ApplicationRecord
    belongs_to :user
    validates :title, :body, presence: true
    scope :visible, -> {where visible: true} 
end
