class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :follows

  validates :name, :presence => true
  validates :username, :presence => true, :uniqueness => true
end
