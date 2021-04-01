class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :nickname
      t.string   :birthday
      t.string :status
      t.timestamps
    end
  end
end
