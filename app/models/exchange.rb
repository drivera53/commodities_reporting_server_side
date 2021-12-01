class Exchange < ApplicationRecord
    has_many :commodities
    has_many :currencies
end
