class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false, unique: true
      t.string :author, null: false
      t.integer :volume, null: false
      t.boolean :isCompleted
      t.text :note

      t.timestamps
    end
  end
end
