class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :token
      t.string :name
      t.string :location
      t.string :email

      t.timestamps
    end
  end
end
