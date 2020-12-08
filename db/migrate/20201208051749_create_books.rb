class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :book_link
      t.integer :project_id

      t.timestamps
    end

    add_index :books, :project_id
  end
end
