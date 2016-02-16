class User < ActiveRecord::Base
  has_many :projects
  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

end
