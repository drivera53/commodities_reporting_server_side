class ExchangeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :commodities
  has_many :currencies
end
