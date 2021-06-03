class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description
      t.text :notes
      t.integer :members_count, default: 0
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
