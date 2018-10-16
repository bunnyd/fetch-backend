class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :picture_url, default: "https://catking.in/wp-content/uploads/2017/02/default-profile-1.png"
      t.integer :zip_code
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
