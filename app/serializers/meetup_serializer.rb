class MeetupSerializer < ActiveModel::Serializer
  attributes :id, :date, :address, :zip_code, :location_name, :time, :picture_url, :url, :attendees, :dogs

  def attendees
    # @dogs = instance_options[:dogs]

    @owners = instance_options[:owners]

    @image = instance_options[:get_image_url]

    # @owners.map do |owner|
  # end

      return instance_options
  end

  def dogs
    @owners.map do |owner|
      owner.dogs do |dog|
        DogSerializer.new(dog, get_image_url: instance_options[:get_image_url])

      end
    end
  end
end
