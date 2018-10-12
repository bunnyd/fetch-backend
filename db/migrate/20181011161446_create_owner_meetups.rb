class CreateOwnerMeetups < ActiveRecord::Migration[5.2]
  def change
    create_table :owner_meetups do |t|
      t.belongs_to :owner, foreign_key: true
      t.belongs_to :meetup, foreign_key: true

      t.timestamps
    end
  end
end
