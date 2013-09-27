class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates_uniqueness_of :user_id, :scope => [:product_id] #allows a user to only comment on a product once
  validates :comment, :presence => true
end