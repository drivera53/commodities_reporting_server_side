class Exchange < ApplicationRecord
    has_many :commodities
    has_many :currencies
    validates :name, presence: true
    validates :name, uniqueness: true
end
