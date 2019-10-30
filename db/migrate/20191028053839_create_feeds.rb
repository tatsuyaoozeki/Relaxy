class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.string :title,       null: false
      t.string :content,     null: false
      t.string :image,       null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
