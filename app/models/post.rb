class Post < ActiveRecord::Base
  has_many :comments, :class_name => "Post",
    :foreign_key => "parent_post_id"
  belongs_to :parent_post, :class_name => "Post"
  validates :title, presence: true
  validates :body, presence: true
end
