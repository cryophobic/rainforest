class User < ActiveRecord::Base
  validates_presence_of :name
  validates :email, :uniqueness => true
  has_secure_password
  validates_presence_of :password, :on => :create
  has_many :reviews
  has_many :products, :through => :reviews
  has_many :pictures, :through => :products
  # has_one :picture
end