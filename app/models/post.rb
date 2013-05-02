class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :post_votes
  validates :title, :url, :presence => true

end
