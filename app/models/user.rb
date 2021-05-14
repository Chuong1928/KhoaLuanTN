class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_attached_file :avatar, styles: { medium: "600x300#" }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  before_create :default_name

  def default_avatar
      avatar.url(:medium)
  end

  def default_name
    self.name = self.email.split("@").take(1)[0]
  end

  def posts_count
    posts.count
  end

  def followers_count
    1
  end

end
