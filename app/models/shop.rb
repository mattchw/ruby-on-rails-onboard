class Shop
    include Mongoid::Document

    field :name, type: String
    validates :name, presence: true

    field :description, type: String

    belongs_to :user

    validates_presence_of :user
end