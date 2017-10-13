class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :keywords
      t.text :desc
      t.integer :parent
      t.text :content
      t.string :image
      t.boolean :status

      t.timestamps
    end
  end
end
