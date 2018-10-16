class DogSerializer < ActiveModel::Serializer
  attributes :id, :location_name, :address, :date, :time, :zip_code
