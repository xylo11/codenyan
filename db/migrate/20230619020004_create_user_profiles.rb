class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :nickname
      t.text :intro
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
