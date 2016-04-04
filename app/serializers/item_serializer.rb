class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at, :list_id
end
