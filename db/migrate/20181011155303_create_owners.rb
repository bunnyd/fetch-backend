class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :title, default: ""
      t.integer :zip_code
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
