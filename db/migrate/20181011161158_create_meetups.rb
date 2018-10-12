class CreateMeetups < ActiveRecord::Migration[5.2]
  def change
    create_table :meetups do |t|
      t.date :date
      t.string :address
      t.integer :zip_code
      t.string :location_name
      t.time :time

      t.timestamps
    end
  end
end
