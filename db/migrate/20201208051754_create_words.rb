class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
        t.integer :total_words, null: false
    	t.string :word_count, null: false
    	t.integer :book_id, null: false
    	
    	t.timestamps
    end

    add_index :words, :book_id
  end
end
