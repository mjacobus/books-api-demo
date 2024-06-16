class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :synopsis
      t.references :author, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :books, %i[title author_id], unique: true
  end
end
