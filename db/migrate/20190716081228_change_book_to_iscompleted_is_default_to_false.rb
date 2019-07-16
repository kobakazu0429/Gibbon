class ChangeBookToIscompletedIsDefaultToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :isCompleted, :boolean, default: false, null: false
  end
end
