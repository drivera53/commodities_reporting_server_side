class CommoditySerializer < ActiveModel::Serializer
  attributes :id, :name, :unit, :price, :exchange_id, :created_at
  belongs_to :exchange
end
