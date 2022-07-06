class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  validates :name, presence: true

  field :description, type: String
  validates :description, presence: true

  field :price, type: Float
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
end
