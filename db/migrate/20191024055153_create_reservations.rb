class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :menu, foreign_key: true
      t.string :start_date,     null: false
      t.string :end_date,       null: false

      t.timestamps
    end
  end
end
