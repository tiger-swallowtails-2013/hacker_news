class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }

end  
