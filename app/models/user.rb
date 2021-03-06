class User < ApplicationRecord
  before_save { email.downcase! }
  validates_presence_of :name, :email
  validates :name, length: {maximum: 100}
	validates :email, length: {maximum: 100}, format: { with: /\A[\w+\-.]+@go-jek.com/i}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 7}
end
