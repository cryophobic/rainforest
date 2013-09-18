class Product < ActiveRecord::Base
	before_save :convert_to_cents

  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => true
  has_many :pictures
  has_many :reviews
  has_many :users, :through => :reviews
  mount_uploader :picture, PictureUploader



  def convert_to_cents
  	self.price_in_cents = (self.price_in_cents.to_f*100).to_i
  end

  def formatted_price
    (self.price_in_cents.to_f / 100).to_s(:currency)
  end

end