class Currency < ApplicationRecord
    belongs_to :exchange
    # validates :name, :c_type, :settlement_date, :tenor, :price, presence: true
    validates :name, :c_type, :settlement_date, :tenor, :price, presence: true
    validates :name, uniqueness: true
end
