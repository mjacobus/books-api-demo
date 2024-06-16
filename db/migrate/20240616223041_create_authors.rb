class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
