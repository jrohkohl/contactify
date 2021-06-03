class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :image
      t.string :organization
      t.string :preferred_method
      t.string :personal_number
      t.string :work_number
      t.string :email
      t.string :instagram_url
      t.string :facebook_url
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
