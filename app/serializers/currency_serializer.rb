class CurrencySerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :settlement_date, :tenor, :price, :exchange_id
end
