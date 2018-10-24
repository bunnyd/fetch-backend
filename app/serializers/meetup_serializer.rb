class MeetupSerializer < ActiveModel::Serializer
  attributes :id, :date, :address, :zip_code, :location_name, :time, :picture_url, :url, :attendees

  def attendees
    @dogs = instance_options[:dogs]

    @owners = instance_options[:owners]
    @image = instance_options[:get_image_url]

    @owners.map do |owner|
      return instance_options
    end
  end
end
