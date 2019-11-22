class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :content, null: false
      t.integer :gender, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
