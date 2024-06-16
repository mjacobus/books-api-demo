class CreatePublishers < ActiveRecord::Migration[7.1]
  def change
    create_table :publishers do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :publishers, %i[name user_id], unique: true
  end
end
