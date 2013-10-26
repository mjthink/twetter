class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true
  validates :username, :presence => true, :uniqueness => true
end
