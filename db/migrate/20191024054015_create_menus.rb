class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :menu_name,      null: false
      t.integer :time_require,  null: false
      t.integer :price,         null: false
      t.string :menu_content,   null: false
      t.references :staff, foreign_key: true

      t.timestamps
    end
  end
end
