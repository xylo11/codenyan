class CreateParkUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :park_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end
  end
end
