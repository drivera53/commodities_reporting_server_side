class CommoditySerializer < ActiveModel::Serializer
  attributes :id, :name, :unit, :price, :exchange_id
end
