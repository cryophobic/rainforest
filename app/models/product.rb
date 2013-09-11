class Product < ActiveRecord::Base

  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}
  has_many :reviews
  has_many :users, :through => :reviews

  def formatted_price
    (self.price_in_cents.to_f / 100).to_s(:currency)
  end

end