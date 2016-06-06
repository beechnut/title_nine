class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :institution
      t.string :state, limit: 2
      t.datetime :opened_at
      t.datetime :closed_at
      t.string :status, limit: 5

      t.timestamps null: false
    end
  end
end
