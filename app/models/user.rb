class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :follows

  validates :name, :presence => true
  validates :username, :presence => true, :uniqueness => true

  def self.all_except(user)
    User.where(User.arel_table[:id].not_eq(user.id)).order(:name)
  end
end
