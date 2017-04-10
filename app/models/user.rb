class User < ApplicationRecord
  has_secure_password
  has_many :lists, dependent: :destroy
  validates :name, :presence => true, length: { minimum: 1 }
  validates :location, :presence => true
  validates_length_of :location, is: 5
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 1 }
end
