class CurrencySerializer < ActiveModel::Serializer
  attributes :id, :name, :c_type, :settlement_date, :tenor, :price, :exchange_id, :created_at
  belongs_to :exchange
end
