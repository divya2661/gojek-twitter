class User < ApplicationRecord
  validates_presence_of :name, :email
  validates :name, length: {maximum: 100}
  validates :email, length: {maximum: 100}, format: { with: /\A[\w+\-.]+@go-jek.com/i}

  has_secure_password
end
