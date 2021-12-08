class Commodity < ApplicationRecord
    belongs_to :exchange
    validates :name, :unit, :price, presence: true
    validates :name, uniqueness: true
end
