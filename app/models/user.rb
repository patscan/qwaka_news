class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :name, :uniqueness => true
  validates :name, :password, :presence => true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  

end
