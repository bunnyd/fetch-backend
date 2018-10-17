class CreateMeetups < ActiveRecord::Migration[5.2]
  def change
    create_table :meetups do |t|
      t.date :date
      t.string :address
      t.integer :zip_code
      t.string :location_name
      t.string :time
      t.string :picture_url, default: "https://www.mountaineers.org/images/placeholder-images/RoutesPlacesDefaultImage.jpg",
      t.string :url, default: "https://www.google.com"

      t.timestamps
    end
  end
end
