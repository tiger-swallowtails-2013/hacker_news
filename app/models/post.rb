class Post < ActiveRecord::Base
  has_many :comments, :class_name => "Post",
    :foreign_key => "parent_post_id"
  belongs_to :parent_post, :class_name => "Post"
  belongs_to :user
  validates :title, presence: true
  validates_length_of :title, minimum: 5
  validates :body, presence: true
end
