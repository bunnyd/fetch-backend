class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :age, default: "N/A"
      t.string :breed, default: "N/A"
      t.string :size, default: "N/A"
      t.string :sex
      t.text :short_bio
      t.string :picture_url, default: "http://www.dog-find.com/img/default-image-450.jpg"
      t.belongs_to :owner, foreign_key: true

      t.timestamps
    end
  end
end
