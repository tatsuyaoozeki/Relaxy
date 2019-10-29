class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :staff, foreign_key: true
      t.index [:user_id, :staff_id], unique: true

      t.timestamps
    end
  end
end
