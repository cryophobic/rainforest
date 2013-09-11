class User < ActiveRecord::Base
  validates_presence_of :name
  has_secure_password
  validates_presence_of :password, :on => :create
  has_many :reviews
  has_many :products, :through => :reviews
end