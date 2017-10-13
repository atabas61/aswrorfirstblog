class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :keywords
      t.text :desc
      t.integer :category_id
      t.integer :user_id
      t.text :content
      t.string :image
      t.boolean :status

      t.timestamps
    end
  end
end
