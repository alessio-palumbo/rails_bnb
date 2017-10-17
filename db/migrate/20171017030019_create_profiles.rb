class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
