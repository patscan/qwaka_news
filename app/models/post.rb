class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title, :url, :presence => true {:messages => "can't be blank"}

end
