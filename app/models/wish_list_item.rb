class WishListItem
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :product
  validates_presence_of :user
  validates_presence_of :product
  validates_uniqueness_of :product_id, scope: :user_id
  
end
