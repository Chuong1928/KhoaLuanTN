class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_attached_file :avatar, styles: { medium: "600x300#" }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  def default_avatar
      avatar.url(:medium)
  end
end
