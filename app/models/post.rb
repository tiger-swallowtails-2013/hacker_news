class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates_length_of :title, minimum: 5
  validates :body, presence: true
end