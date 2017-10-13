class CreateAdminMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :title
      t.string :desc
      t.string :url
      t.string :target
      t.integer :sort
      t.boolean :status

      t.timestamps
    end
  end
end
